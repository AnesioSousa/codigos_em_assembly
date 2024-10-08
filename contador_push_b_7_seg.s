    .global _start

    // Endereço base do GPIO (ajustar conforme necessário)
    .equ GPIO_BASE, 0xFF200000   // Endereço base do GPIO (ajustar conforme necessário)
    .equ HEX0_OFFSET, 0x20       // Offset para o primeiro display de 7 segmentos (HEX0)
    .equ BUTTON_OFFSET, 0x50     // Offset para o botão de pressão (Pushbutton)

    // Valores para representar os números no display de 7 segmentos
    .equ SEG_0, 0x3F             // Valor para mostrar '0'
    .equ SEG_1, 0x06             // Valor para mostrar '1'
    .equ SEG_2, 0x5B             // Valor para mostrar '2'
    .equ SEG_3, 0x4F             // Valor para mostrar '3'
    .equ SEG_4, 0x66             // Valor para mostrar '4'
    .equ SEG_5, 0x6D             // Valor para mostrar '5'
    .equ SEG_6, 0x7D             // Valor para mostrar '6'
    .equ SEG_7, 0x07             // Valor para mostrar '7'
    .equ SEG_8, 0x7F             // Valor para mostrar '8'
    .equ SEG_9, 0x6F             // Valor para mostrar '9'

    .equ MAX_COUNT, 10           // Contagem máxima antes de voltar a 0

    // Definir constante para o delay (ajustar conforme o desempenho do processador)
    .equ DELAY_COUNT, 0x3F0000   // Contagem de ciclos para simular um delay

_start:

    // Inicializar contagem para 0
    MOV r4, #0                   // Contador de 0 a 9
    LDR r0, =GPIO_BASE           // Carrega o endereço base do GPIO
    ADD r0, r0, #HEX0_OFFSET     // Adiciona o offset do display de 7 segmentos (HEX0)

display_number:
    // Converter contagem para segmentos de 7-segment display
    CMP r4, #0
    BEQ show_0
    CMP r4, #1
    BEQ show_1
    CMP r4, #2
    BEQ show_2
    CMP r4, #3
    BEQ show_3
    CMP r4, #4
    BEQ show_4
    CMP r4, #5
    BEQ show_5
    CMP r4, #6
    BEQ show_6
    CMP r4, #7
    BEQ show_7
    CMP r4, #8
    BEQ show_8
    CMP r4, #9
    BEQ show_9

show_0:
    MOV r1, #SEG_0
    B update_display
show_1:
    MOV r1, #SEG_1
    B update_display
show_2:
    MOV r1, #SEG_2
    B update_display
show_3:
    MOV r1, #SEG_3
    B update_display
show_4:
    MOV r1, #SEG_4
    B update_display
show_5:
    MOV r1, #SEG_5
    B update_display
show_6:
    MOV r1, #SEG_6
    B update_display
show_7:
    MOV r1, #SEG_7
    B update_display
show_8:
    MOV r1, #SEG_8
    B update_display
show_9:
    MOV r1, #SEG_9

update_display:
    STR r1, [r0]                 // Atualiza o display de 7 segmentos com o valor da contagem

    // Verificar estado do botão de pressão
check_button:
    LDR r2, =GPIO_BASE
    ADD r2, r2, #BUTTON_OFFSET   // Carregar endereço do botão de pressão
    LDR r3, [r2]                 // Ler estado do botão
    CMP r3, #0                   // Verificar se o botão está pressionado
    BEQ check_button             // Se não pressionado, continuar verificando

    // Adicionar delay de debounce (simulação de 5ms com busy-wait)
    BL delay

    // Incrementar contagem
    ADD r4, r4, #1               // Incrementar a contagem
    CMP r4, #MAX_COUNT           // Verificar se ultrapassou 9
    BNE display_number           // Se não, exibir o próximo número
    MOV r4, #0                   // Reiniciar contagem para 0
    B display_number

wait_button_release:
    LDR r3, [r2]                 // Ler estado do botão novamente
    CMP r3, #0                   // Verificar se o botão foi solto
    BNE wait_button_release      // Esperar até o botão ser liberado

    // Adicionar um delay de debounce (simulação de 5ms com busy-wait)
    BL delay

    // Loop infinito
wait:
    B wait

// Função de delay com busy-wait (espera ocupada)
delay:
    MOV r5, #DELAY_COUNT         // Carregar o valor de contagem do delay
delay_loop:
    SUBS r5, r5, #1              // Decrementar o contador
    BNE delay_loop               // Repetir até o contador atingir 0
    BX lr                        // Retornar da função de delay


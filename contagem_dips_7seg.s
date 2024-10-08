    .global _start

    // Endereço base do GPIO (ajustar conforme necessário)
    .equ GPIO_BASE, 0xFF200000   // Endereço base do GPIO (ajustar se necessário)
    .equ SWITCHES_OFFSET, 0x40   // Offset para os switches
    .equ HEX0_OFFSET, 0x20        // Offset para o primeiro display de 7 segmentos (HEX0)

    // Mapeamento de números para displays de 7 segmentos
    .equ SEG0, 0x3F   // 0
    .equ SEG1, 0x06   // 1
    .equ SEG2, 0x5B   // 2
    .equ SEG3, 0x4F   // 3
    .equ SEG4, 0x66   // 4
    .equ SEG5, 0x6D   // 5
    .equ SEG6, 0x7D   // 6
    .equ SEG7, 0x07   // 7
    .equ SEG8, 0x7F   // 8
    .equ SEG9, 0x6F   // 9
    .equ SEGA, 0x77   // A
    .equ SEGB, 0x7C   // B
    .equ SEGC, 0x39   // C
    .equ SEGD, 0x5E   // D
    .equ SEGE, 0x79   // E
    .equ SEGF, 0x71   // F

_start:
    // Loop infinito para ler switches e atualizar o display
loop:
    // Ler o valor dos switches
    LDR r0, =GPIO_BASE           // Carrega o endereço base do GPIO
    ADD r0, r0, #SWITCHES_OFFSET  // Adiciona o offset dos switches
    LDR r1, [r0]                 // Lê o valor dos switches (4 bits)

    // Determinar qual valor mostrar no display de 7 segmentos
    AND r1, r1, #0x0F            // Considera apenas os 4 bits dos switches
    CMP r1, #0                    // Compara para ver se é 0
    BEQ display_zero              // Se for 0, vai para display_zero

    CMP r1, #1                    // Compara para ver se é 1
    BEQ display_one               // Se for 1, vai para display_one

    CMP r1, #2                    // Compara para ver se é 2
    BEQ display_two               // Se for 2, vai para display_two

    CMP r1, #3                    // Compara para ver se é 3
    BEQ display_three             // Se for 3, vai para display_three

    CMP r1, #4                    // Compara para ver se é 4
    BEQ display_four              // Se for 4, vai para display_four

    CMP r1, #5                    // Compara para ver se é 5
    BEQ display_five              // Se for 5, vai para display_five

    CMP r1, #6                    // Compara para ver se é 6
    BEQ display_six               // Se for 6, vai para display_six

    CMP r1, #7                    // Compara para ver se é 7
    BEQ display_seven             // Se for 7, vai para display_seven

    CMP r1, #8                    // Compara para ver se é 8
    BEQ display_eight             // Se for 8, vai para display_eight

    CMP r1, #9                    // Compara para ver se é 9
    BEQ display_nine              // Se for 9, vai para display_nine

    CMP r1, #10                   // Compara para ver se é A
    BEQ display_a                 // Se for A, vai para display_a

    CMP r1, #11                   // Compara para ver se é B
    BEQ display_b                 // Se for B, vai para display_b

    CMP r1, #12                   // Compara para ver se é C
    BEQ display_c                 // Se for C, vai para display_c

    CMP r1, #13                   // Compara para ver se é D
    BEQ display_d                 // Se for D, vai para display_d

    CMP r1, #14                   // Compara para ver se é E
    BEQ display_e                 // Se for E, vai para display_e

    CMP r1, #15                   // Compara para ver se é F
    BEQ display_f                 // Se for F, vai para display_f

    B loop                       // Retorna para o loop

// Funções para cada número
display_zero:
    LDR r0, =GPIO_BASE
    ADD r0, r0, #HEX0_OFFSET
    MOV r2, #SEG0                // Mostra 0
    STR r2, [r0]
    B loop

display_one:
    LDR r0, =GPIO_BASE
    ADD r0, r0, #HEX0_OFFSET
    MOV r2, #SEG1                // Mostra 1
    STR r2, [r0]
    B loop

display_two:
    LDR r0, =GPIO_BASE
    ADD r0, r0, #HEX0_OFFSET
    MOV r2, #SEG2                // Mostra 2
    STR r2, [r0]
    B loop

display_three:
    LDR r0, =GPIO_BASE
    ADD r0, r0, #HEX0_OFFSET
    MOV r2, #SEG3                // Mostra 3
    STR r2, [r0]
    B loop

display_four:
    LDR r0, =GPIO_BASE
    ADD r0, r0, #HEX0_OFFSET
    MOV r2, #SEG4                // Mostra 4
    STR r2, [r0]
    B loop

display_five:
    LDR r0, =GPIO_BASE
    ADD r0, r0, #HEX0_OFFSET
    MOV r2, #SEG5                // Mostra 5
    STR r2, [r0]
    B loop

display_six:
    LDR r0, =GPIO_BASE
    ADD r0, r0, #HEX0_OFFSET
    MOV r2, #SEG6                // Mostra 6
    STR r2, [r0]
    B loop

display_seven:
    LDR r0, =GPIO_BASE
    ADD r0, r0, #HEX0_OFFSET
    MOV r2, #SEG7                // Mostra 7
    STR r2, [r0]
    B loop

display_eight:
    LDR r0, =GPIO_BASE
    ADD r0, r0, #HEX0_OFFSET
    MOV r2, #SEG8                // Mostra 8
    STR r2, [r0]
    B loop

display_nine:
    LDR r0, =GPIO_BASE
    ADD r0, r0, #HEX0_OFFSET
    MOV r2, #SEG9                // Mostra 9
    STR r2, [r0]
    B loop

display_a:
    LDR r0, =GPIO_BASE
    ADD r0, r0, #HEX0_OFFSET
    MOV r2, #SEGA                // Mostra A
    STR r2, [r0]
    B loop

display_b:
    LDR r0, =GPIO_BASE
    ADD r0, r0, #HEX0_OFFSET
    MOV r2, #SEGB                // Mostra B
    STR r2, [r0]
    B loop

display_c:
    LDR r0, =GPIO_BASE
    ADD r0, r0, #HEX0_OFFSET
    MOV r2, #SEGC                // Mostra C
    STR r2, [r0]
    B loop

display_d:
    LDR r0, =GPIO_BASE
    ADD r0, r0, #HEX0_OFFSET
    MOV r2, #SEGD                // Mostra D
    STR r2, [r0]
    B loop

display_e:
    LDR r0, =GPIO_BASE
    ADD r0, r0, #HEX0_OFFSET
    MOV r2, #SEGE                // Mostra E
    STR r2, [r0]
    B loop

display_f:
    LDR r0, =GPIO_BASE
    ADD r0, r0, #HEX0_OFFSET
    MOV r2, #SEGF                // Mostra F
    STR r2, [r0]
    B loop


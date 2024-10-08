#include <stdio.h>


int main(){
   int x;

   scanf("%d\n", &x);
   printf("Endereco de memoria: %p\n",(void *)&x);
   return 0;
}

%{
#include <stdlib.h>
#include <stdio.h>
int n1;
int n2;
%}
number_sequence [0-9]*
%%
{number_sequence}[0|2|4|6|8] {
                                printf("Even number [%d]",yyleng);
                                return atoi(yytext);
                             }
{number_sequence}[1|3|5|7|9] {
                                printf("Odd number [%d]",yyleng);
                                return atoi(yytext);
                              }
%%
int yywrap(void){}
int main()
{
  printf("\nInput an even number and an odd number\n");
  n1 = yylex();
  n2 = yylex();
  int diff = n1 - n2;
  if(diff%2!=0)
    printf("\nYour inputs were checked for correctness, \nResult : Correct\n");
  else
    printf("\nYour inputs were checked for correctness, \nResult : Incorrect\n");
  return 1;
}


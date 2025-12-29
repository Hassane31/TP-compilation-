%{
#include <stdio.h>
int nbr_line = 0 ;
%}

%%
\n {nbr_line++;}
. ;
%%
int main(){
    yylex();
printf("le nombre de line est : %d",nbr_line);
    return 0 ;
}
int yywrap(void){
    return 1;
}
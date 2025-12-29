%{
%}
binaire (0|1)+
%%
{binaire} printf("cest un nombre binaire " );
%% 
int main (){ 
yylex();
return 0 ; 
}
int yywrap(){ 
    return 1;
} 
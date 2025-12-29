%{
%}
binaire (0|1)+
decimale [2-9]+
%%
{binaire} printf("%s c est un nombre binaire ",yytext );
{decimale} printf("%s ce n pas un nombre binaire ",yytext);
%% 
int main (){ 
yylex();
return 0 ; 
}
int yywrap(){
    return 1;
} 
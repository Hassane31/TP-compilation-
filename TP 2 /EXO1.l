%{

%}
ch1 ^[A-Z][A-Za-z]*
ch2 .*a[A-Za-z]*e
ch3 [01]*011[01]*
ch4 .*[.?]$
%%
{ch1} printf("la chaine (%s) de CC commance par MAJ :",yytext);
{ch2} printf("la chaine (%s) de CC commance par a et termin par e :",yytext);
{ch3} printf("la chaine (%s) est contiennent 011 :",yytext);
{ch4} printf("dans la chaine (%s) il ya '.' ou bien '?' dans la fin (end of line) :",yytext);
.* {}; 
%%

int yywrap(){
    return 1;
}

int main(){
    yylex();
    return 0;
}
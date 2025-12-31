%option yylineno
lettre [a-z]
chiffre [0-9]
mot_cle (programe|begin|end|boolean|var|real|integer)
ident {lettre}({lettre}|{chiffre})*
operateur "+"|":="
separateur [:;.]
cste {chiffre}+
esp [ \t]
%%
{mot_cle} fprintf(yyout,"line %d:[%s:mot cle]\n",yylineno,yytext);
{ident} fprintf(yyout,"line %d:[%s: ident]\n",yylineno,yytext);
{operateur} fprintf(yyout,"line %d:[%s:operateur]\n",yylineno,yytext);
{separateur} fprintf(yyout,"line %d:[%s:separateur]\n",yylineno,yytext);
{cste} fprintf(yyout,"line %d:[%s:cste]\n",yylineno,yytext);
{esp} { };
\n yylineno++;
. fprintf(yyout,"%d :[%s :erruer lexical !!]\n ",yylineno,yytext);
%%
int main(int argc ,char *argv[]){
    yyin=fopen(argv[1],"r");
    yyout=fopen("res.txt","w");
    yylex();
    fclose(yyin);
    fclose(yyout);
    return 0;
}
int yywrap(){
    return 1;
}
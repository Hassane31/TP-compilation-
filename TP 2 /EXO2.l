%{
    int nbr = 1;
%}
lettre [a-z]
chiffre [0-9]
ident {lettre}({lettre}|{chiffre})*
mot_cle programe|begin|end|boolean|var|real|intger
oprerateur "+"|":="
separateur [:;.]
cste {chiffre}+
esp [ \t]
%%
{mot_cle} fprintf(yyout,line %d:[%s:mot cle]\n",nbr,yytext);
{ident} fprintf(yyout,line %d:[%s: ident]\n",nbr,yytext);
{oprerateur} fprintf(yyout,line %d:[%s:oprerateur]\n",nbr,yytext);
{separateur} fprintf(yyout,line %d:[%s:separateur]\n",nbr,yytext);
{cste} fprintf(yyout,line %d:[%s:cste]\n",nbr,yytext);
{esp} { };
\n nbr++;
. fprintf(yyout,"%d :[%s :erruer lexical !!]\n ,nbr,yytext);
%%
int yywrap(){
    return 1;
}
int main(int argc ,char *argv[]){
    yyin=fopen(argv[1],"r");
    yyout=fopen("res.txt","w");
    yylex();
    fclose(yyin);
    fclose(yyout);
    return 0;
}

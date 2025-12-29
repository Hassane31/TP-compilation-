%{

%}
letter_a "a" 
letter_z "z" 
%%
{letter_a} printf("z");
{letter_z} printf("a");
%%
int main(){
    yylex();
}
int yywrap(){
    return 1;
}

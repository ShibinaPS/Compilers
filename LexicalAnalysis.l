%option noyywrap nodefault yylineno

%x COMMENT

ELSE 	([Ee][Ll][Ss][Ee])
FALSE	([f][Aa][Ll][Ss][Ee])
IF	([Ii][Ff])
LOOP	([Ll][Oo][Oo][Pp])
THEN	([Tt][Hh][Ee][Nn])
WHILE	([Ww][Hh][Ii][Ll][Ee])
NOT	([Nn][Oo][Tt])
TRUE	([t][Rr][Uu][Ee])
PRINT	([Pp][Rr][Ii][nN][Tt])
PRINTLN	([Pp][Rr][Ii][Nn][Tt][Ll][Nn])

%{

#include <iostream>
int tok_count 	= 0;
int tok_num 	= 0;

%}

%%

[ \t:;,.\n]	{}

{ELSE}		{ tok_count++; std::cout<<"Token "<<tok_num<<": "<<yytext<<"\t\t[Class: KEYWORD;\tLine number: "<<yylineno<< ";\t\tError: 0]\n"; tok_num++; }
{FALSE} 	{ tok_count++; std::cout<<"Token "<<tok_num<<": "<<yytext<<"\t\t[Class: KEYWORD;\tLine number: "<<yylineno<< ";\t\tError: 0]\n"; tok_num++; }
{IF}		{ tok_count++; std::cout<<"Token "<<tok_num<<": "<<yytext<<"\t\t[Class: KEYWORD;\tLine number: "<<yylineno<< ";\t\tError: 0]\n"; tok_num++; }
{LOOP}		{ tok_count++; std::cout<<"Token "<<tok_num<<": "<<yytext<<"\t\t[Class: KEYWORD;\tLine number: "<<yylineno<< ";\t\tError: 0]\n"; tok_num++; }
{THEN}		{ tok_count++; std::cout<<"Token "<<tok_num<<": "<<yytext<<"\t\t[Class: KEYWORD;\tLine number: "<<yylineno<< ";\t\tError: 0]\n"; tok_num++; }
{WHILE}		{ tok_count++; std::cout<<"Token "<<tok_num<<": "<<yytext<<"\t\t[Class: KEYWORD;\tLine number: "<<yylineno<< ";\t\tError: 0]\n"; tok_num++; }
{NOT}		{ tok_count++; std::cout<<"Token "<<tok_num<<": "<<yytext<<"\t\t[Class: KEYWORD;\tLine number: "<<yylineno<< ";\t\tError: 0]\n"; tok_num++; }
{TRUE}		{ tok_count++; std::cout<<"Token "<<tok_num<<": "<<yytext<<"\t\t[Class: KEYWORD;\tLine number: "<<yylineno<< ";\t\tError: 0]\n"; tok_num++; }
{PRINT}		{ tok_count++; std::cout<<"Token "<<tok_num<<": "<<yytext<<"\t\t[Class: KEYWORD;\tLine number: "<<yylineno<< ";\t\tError: 0]\n"; tok_num++; }
{PRINTLN}	{ tok_count++; std::cout<<"Token "<<tok_num<<": "<<yytext<<"\t\t[Class: KEYWORD;\tLine number: "<<yylineno<< ";\t\tError: 0]\n"; tok_num++; }

[-+]?[0-9]+	{ tok_count++; std::cout<<"Token "<<tok_num<<": "<<yytext<<"\t\t[Class: NUMBER;\t\tLine number: "<<yylineno<< ";\t\tError: 0]\n"; tok_num++; }

[a-zA-Z0-9]*	{ tok_count++; std::cout<<"Token "<<tok_num<<": "<<yytext<<"   \t[Class: VARIABLE;\tLine number: "<<yylineno<< ";\t\tError: 0]\n"; tok_num++; }

[a-z_][a-zA-Z0-9_]*	{ tok_count++; std::cout<<"Token "<<tok_num<<": "<<yytext<<"   \t[Class: OBJ_ID;\tLine number: "<<yylineno<< ";\t\tError: 0]\n"; tok_num++; }
[A-Za-z_][a-zA-z0-9_]*	{ tok_count++; std::cout<<"Token "<<tok_num<<": "<<yytext<<"\t[Class: TYPE_ID;\tLine number: "<<yylineno<< ";\t\tError: 0]\n";   tok_num++; }

"("	{ tok_count++; std::cout<<"Token "<<tok_num<<": "<<yytext<<"\t\t[Class: OP;\t\tLine number: "<<yylineno<< ";\t\tError: 0]\n";        tok_num++; }
")"	{ tok_count++; std::cout<<"Token "<<tok_num<<": "<<yytext<<"\t\t[Class: CP;\t\tLine number: "<<yylineno<< ";\t\tError: 0]\n";        tok_num++; }
"="	{ tok_count++; std::cout<<"Token "<<tok_num<<": "<<yytext<<"\t\t[Class: ASSIGN; \tLine number: "<<yylineno<< ";\t\tError: 0]\n";     tok_num++; }
"*"	{ tok_count++; std::cout<<"Token "<<tok_num<<": "<<yytext<<"\t\t[Class: MUL;\t\tLine number: "<<yylineno<< ";\t\tError: 0]\n";       tok_num++; }
"/"	{ tok_count++; std::cout<<"Token "<<tok_num<<": "<<yytext<<"\t\t[Class: DIV;\t\tLine number: "<<yylineno<< ";\t\tError: 0]\n";       tok_num++; }
"+"	{ tok_count++; std::cout<<"Token "<<tok_num<<": "<<yytext<<"\t\t[Class: ADD;\t\tLine number: "<<yylineno<< ";\t\tError: 0]\n";       tok_num++; }
"-"	{ tok_count++; std::cout<<"Token "<<tok_num<<": "<<yytext<<"\t\t[Class: MINUS;\tLine number: "<<yylineno<< ";\t\tError: 0]\n";       tok_num++; }
"|"	{ tok_count++; std::cout<<"Token "<<tok_num<<": "<<yytext<<"\t\t[Class: ABS;\t\tLine number: "<<yylineno<< ";\t\tError: 0]\n";       tok_num++; }
"+="	{ tok_count++; std::cout<<"Token "<<tok_num<<": "<<yytext<<"\t\t[Class: ASSIGNADD;\tLine number: "<<yylineno<< ";\t\tError: 0]\n";   tok_num++; }
"-="	{ tok_count++; std::cout<<"Token "<<tok_num<<": "<<yytext<<"\t\t[Class: ASSIGNMINUS;\tLine number: "<<yylineno<< ";\t\tError: 0]\n"; tok_num++; }
"%"     { tok_count++; std::cout<<"Token "<<tok_num<<": "<<yytext<<"\t\t[Class: REMDIV;\tLine number: "<<yylineno<< ";\t\tError: 0]\n";	     tok_num++; }
"++"	{ tok_count++; std::cout<<"Token "<<tok_num<<": "<<yytext<<"\t\t[Class: INCREMENT;\tLine number: "<<yylineno<< ";\t\tError: 0]\n";   tok_num++; }
"--"	{ tok_count++; std::cout<<"Token "<<tok_num<<": "<<yytext<<"\t\t[Class: DECREMENT;\tLine number: "<<yylineno<< ";\t\tError: 0]\n";   tok_num++; }

["][^EOF\0"]*["]	{ tok_count++; std::cout<<"Token "<<tok_num<<": "<<yytext<<"\t\t[Class: STRING;\tLine number: "<<yylineno<< ";\t\tError: 0]\n"; tok_num++; }

"/*" 	      { BEGIN(COMMENT); }
<COMMENT>"*/" { BEGIN(INITIAL); }
<COMMENT>([^*]|\n|EOF)+|.

"- -" 	      	  { BEGIN(COMMENT); }
<COMMENT>[\n|EOF] { BEGIN(INITIAL); }
<COMMENT>(\n|EOF)+|.

"(" 	      { BEGIN(COMMENT); }
<COMMENT>")"  { BEGIN(INITIAL); }
<COMMENT>(\n|EOF)+|.

.	{ tok_count++; std::cout<<"Token "<<tok_num<<": "<<yytext<<"\t\t[Class: UNKNOWN;\tLine number: "<<yylineno<< ";\t\tError: 1]\n"; tok_num++; }

%%

main()
{
	std::cout<<"Input your text for lexical analysis:\n";
	yylineno = 1;
	yylex();
	std::cout<<"Quantity: " << tok_count << "\n";
	return 0;
}
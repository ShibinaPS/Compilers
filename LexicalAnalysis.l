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
#include "LexFunc.hpp"
%}

%%

[ \t:;,.]	{}
[\n]        { cur_tok_num = 1; }

{ELSE}	{ PrintLogFile(yytext, KEYWORD, cur_line_num, cur_tok_num, 0); cur_tok_num++; tok_count++; }
{FALSE} 	{ PrintLogFile(yytext, KEYWORD, cur_line_num, cur_tok_num, 0); cur_tok_num++; tok_count++; }
{IF}		{ PrintLogFile(yytext, KEYWORD, cur_line_num, cur_tok_num, 0); cur_tok_num++; tok_count++; }
{LOOP}	{ PrintLogFile(yytext, KEYWORD, cur_line_num, cur_tok_num, 0); cur_tok_num++; tok_count++; }
{THEN}	{ PrintLogFile(yytext, KEYWORD, cur_line_num, cur_tok_num, 0); cur_tok_num++; tok_count++; }
{WHILE}	{ PrintLogFile(yytext, KEYWORD, cur_line_num, cur_tok_num, 0); cur_tok_num++; tok_count++; }
{NOT}		{ PrintLogFile(yytext, KEYWORD, cur_line_num, cur_tok_num, 0); cur_tok_num++; tok_count++; }
{TRUE}	{ PrintLogFile(yytext, KEYWORD, cur_line_num, cur_tok_num, 0); cur_tok_num++; tok_count++; }
{PRINT}	{ PrintLogFile(yytext, KEYWORD, cur_line_num, cur_tok_num, 0); cur_tok_num++; tok_count++; }
{PRINTLN}	{ PrintLogFile(yytext, KEYWORD, cur_line_num, cur_tok_num, 0); cur_tok_num++; tok_count++; }

[-+]?[0-9]+	{ PrintLogFile(yytext, NUMBER, cur_line_num, cur_tok_num, 0); cur_tok_num++; tok_count++; }

[a-zA-Z0-9]*	{ PrintLogFile(yytext, VARIABLE, cur_line_num, cur_tok_num, 0); cur_tok_num++; tok_count++; }

[a-z_][a-zA-Z0-9_]*	{ PrintLogFile(yytext, OBJECT_ID, cur_line_num, cur_tok_num, 0);  cur_tok_num++; tok_count++; }
[A-Za-z_][a-zA-z0-9_]*	{ PrintLogFile(yytext, TYPE_ID, cur_line_num, cur_tok_num, 0); cur_tok_num++; tok_count++; }

"("	{ PrintLogFile(yytext, OP, cur_line_num, cur_tok_num, 0);           cur_tok_num++; tok_count++; }
")"	{ PrintLogFile(yytext, CP, cur_line_num, cur_tok_num, 0);           cur_tok_num++; tok_count++; }
"="	{ PrintLogFile(yytext, ASSIGN, cur_line_num, cur_tok_num, 0);       cur_tok_num++; tok_count++; }
"*"	{ PrintLogFile(yytext, MUL, cur_line_num, cur_tok_num, 0);          cur_tok_num++; tok_count++; }
"/"	{ PrintLogFile(yytext, DIV, cur_line_num, cur_tok_num, 0);          cur_tok_num++; tok_count++; }
"+"	{ PrintLogFile(yytext, ADD, cur_line_num, cur_tok_num, 0);          cur_tok_num++; tok_count++; }
"-"	{ PrintLogFile(yytext, MINUS, cur_line_num, cur_tok_num, 0);        cur_tok_num++; tok_count++; }
"|"	{ PrintLogFile(yytext, ABS, cur_line_num, cur_tok_num, 0);          cur_tok_num++; tok_count++; }
"+="	{ PrintLogFile(yytext, ASSIGNADD, cur_line_num, cur_tok_num, 0);    cur_tok_num++; tok_count++; }
"-="	{ PrintLogFile(yytext, ASSIGNMINUS, cur_line_num, cur_tok_num, 0);  cur_tok_num++; tok_count++; }
"%"   { PrintLogFile(yytext, REMDIV, cur_line_num, cur_tok_num, 0);       cur_tok_num++; tok_count++; }
"++"	{ PrintLogFile(yytext, INCREMENT, cur_line_num, cur_tok_num, 0);    cur_tok_num++; tok_count++; }
"--"	{ PrintLogFile(yytext, DECREMENT, cur_line_num, cur_tok_num, 0);    cur_tok_num++; tok_count++; }
"&&"  { PrintLogFile(yytext, AND, cur_line_num, cur_tok_num, 0);          cur_tok_num++; tok_count++; }
"||"  { PrintLogFile(yytext, OR, cur_line_num, cur_tok_num, 0);           cur_tok_num++; tok_count++; }

["][^EOF\0"]*["]	{ PrintLogFile(yytext, STRING, cur_line_num, cur_tok_num, 0); cur_tok_num++; tok_count++; }

"- -" 	      { BEGIN(COMMENT); }
<COMMENT>[\n|EOF] { BEGIN(INITIAL); }
<COMMENT>(\n|EOF)+|.


"/*" 	        { BEGIN(COMMENT); }
<COMMENT>"*/" { BEGIN(INITIAL); }
<COMMENT>([^*]|\n|EOF)+|.


.	{ PrintLogFile(yytext, UNKNOWN, cur_line_num, cur_tok_num, 1); cur_tok_num++; tok_count++; }

<<EOF>> { PrintLogFile(yytext, ENDOFFILE, cur_line_num, cur_tok_num, 0); return 0; }

%%

int yywrap() {}
#include "LexFunc.hpp"
#include "Header.hpp"
#include <iostream>

int main(int argc, char* argv[])
{	
	log_file = fopen("log_file.txt", "w");
    if (log_file == nullptr)
	{
		printf("Log_file was not opened. Error code: %d\n", ERROR_LOG_FILE_OPEN);
		return ERROR_LOG_FILE_OPEN;
	}

	FILE* yyin = fopen(argv[1], "r");
	if(yyin == nullptr) 
	{
		printf("Error code: %d \n", ERROR_SOURCE_FILE_OPEN);
            return ERROR_SOURCE_FILE_OPEN;
	}

	fprintf(log_file, "\n======================================== Lexical Analysis ========================================\n");

	yyrestart(yyin);
	yylex(yyin);

	fprintf(log_file, "\nQuantity: %lu\n", tok_count);
	fprintf(log_file, "\n==================================================================================================\n");

	fclose(yyin);
	fclose(log_file);

	return 0;
}
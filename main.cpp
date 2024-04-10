#include "LexFunc.hpp"
#include <iostream>

int main(int argc, char* argv[])
{
	if(argc < 2)
	{
		std::cout<< "Input file was not entered. Error code: " << ERROR_INPUT_FILE;
		return ERROR_INPUT_FILE;
	}
	
	log_file = fopen("log_file.txt", "w");
    	if (log_file == nullptr)
    	{
		std::cout<< "Log_file was not opened. Error code: " << ERROR_LOG_FILE_OPEN;
      	return ERROR_LOG_FILE_OPEN;
    	}

	FILE* f = fopen(argv[1], "r");
	if(!f) 
	{
		std::cout<< "Error code: "<< ERROR_FILE_OPEN;
            return ERROR_FILE_OPEN;
	}

	fprintf(log_file, "\n======================================== Lexical Analysis ========================================\n");
	fprintf(log_file, "Input text: ");

	yyrestart(f);
	yylex();

	fprintf(log_file, "\nQuantity: %lu\n", tok_count);
	fprintf(log_file, "\n==================================================================================================\n");

	fclose(f);
	fclose(log_file);

	return 0;
}
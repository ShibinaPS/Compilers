#include "LexFunc.hpp"

//========================================================================================================

FILE* log_file      = nullptr;
size_t cur_tok_num  = 1;
size_t tok_count    = 0;
size_t cur_line_num = 1;

//========================================================================================================

void PrintLogFile(const char* const token_l, size_t const tok_class_l, size_t const line_num_l, size_t const cur_tok_num_l, size_t const error_code_l)
{
      fprintf(log_file, "Token %s\n", token_l);
      fprintf(log_file, "[Line: %lu, position: %lu, ", line_num_l, cur_tok_num_l);

      switch(tok_class_l)
      {
            case(KEYWORD): 
                        fprintf(log_file, "token class: KEYWORD\n");
                        break;
            case(NUMBER): 
                        fprintf(log_file, "token class: NUMBER\n");
                        break;
            case(VARIABLE): 
                        fprintf(log_file, "token class: VARIABLE\n");
                        break;
            case(OBJECT_ID): 
                        fprintf(log_file, "token class: OBJECT_ID\n");
                        break;
            case(TYPE_ID): 
                        fprintf(log_file, "token class: TYPE_ID\n");
                        break;
            case(OP): 
                        fprintf(log_file, "token class: OP\n");
                        break;
            case(CP): 
                        fprintf(log_file, "token class: CP\n");
                        break;
            case(ASSIGN): 
                        fprintf(log_file, "token class: ASSIGN\n");
                        break;
            case(MUL): 
                        fprintf(log_file, "token class: MUL\n");
                        break;
            case(DIV): 
                        fprintf(log_file, "token class: DIV\n");
                        break;
            case(ADD): 
                        fprintf(log_file, "token class: ADD\n");
                        break;
            case(MINUS): 
                        fprintf(log_file, "token class: MINUS\n");
                        break;
            case(ABS): 
                        fprintf(log_file, "token class: ABS\n");
                        break;
            case(ASSIGNADD): 
                        fprintf(log_file, "token class: ASSIGNADD\n");
                        break;
            case(ASSIGNMINUS): 
                        fprintf(log_file, "token class: ASSIGNMINUS\n");
                        break;
            case(REMDIV): 
                        fprintf(log_file, "token class: REMDIV\n");
                        break;
            case(INCREMENT): 
                        fprintf(log_file, "token class: INCREMENT\n");
                        break;
            case(DECREMENT): 
                        fprintf(log_file, "token class: DECREMENT\n");
                        break;
            case(AND): 
                        fprintf(log_file, "token class: AND\n");
                        break;
            case(OR): 
                        fprintf(log_file, "token class: OR\n");
                        break;
            case(STRING): 
                        fprintf(log_file, "token class: STRING\n");
                        break;
            case(UNKNOWN): 
                        fprintf(log_file, "token class: UNKNOWN\n");
                        break;
            case(ENDOFFILE): 
                        fprintf(log_file, "token class: ENDOFFILE\n");
                        break;
            default:
                        fprintf(log_file, " ");
                        break;
      }
}

//========================================================================================================
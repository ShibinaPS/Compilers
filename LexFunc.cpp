#include "LexFunc.hpp"

//========================================================================================================

FILE* log_file      = nullptr;
size_t cur_tok_num  = 1;
size_t tok_count    = 0;
size_t cur_line_num = 1;

//========================================================================================================

void PrintLogFile(const char* const token_l, size_t const tok_class_l, size_t const line_num_l, size_t const cur_tok_num_l, size_t const error_code_l)
{
      fprintf(log_file, "Token '%s'\n", token_l);
      fprintf(log_file, "[Line: %lu, position: %lu, ", line_num_l, cur_tok_num_l);

      switch(tok_class_l)
      {
            case(KEYWORD): 
                        fprintf(log_file, "token class: KEYWORD, ");
                        break;
            case(NUMBER): 
                        fprintf(log_file, "token class: NUMBER, ");
                        break;
            case(VARIABLE): 
                        fprintf(log_file, "token class: VARIABLE, ");
                        break;
            case(OBJECT_ID): 
                        fprintf(log_file, "token class: OBJECT_ID, ");
                        break;
            case(TYPE_ID): 
                        fprintf(log_file, "token class: TYPE_ID, ");
                        break;
            case(OP): 
                        fprintf(log_file, "token class: OP, ");
                        break;
            case(CP): 
                        fprintf(log_file, "token class: CP, ");
                        break;
            case(ASSIGN): 
                        fprintf(log_file, "token class: ASSIGN, ");
                        break;
            case(MUL): 
                        fprintf(log_file, "token class: MUL, ");
                        break;
            case(DIV): 
                        fprintf(log_file, "token class: DIV, ");
                        break;
            case(ADD): 
                        fprintf(log_file, "token class: ADD, ");
                        break;
            case(MINUS): 
                        fprintf(log_file, "token class: MINUS, ");
                        break;
            case(ABS): 
                        fprintf(log_file, "token class: ABS, ");
                        break;
            case(ASSIGNADD): 
                        fprintf(log_file, "token class: ASSIGNADD, ");
                        break;
            case(ASSIGNMINUS): 
                        fprintf(log_file, "token class: ASSIGNMINUS, ");
                        break;
            case(REMDIV): 
                        fprintf(log_file, "token class: REMDIV, ");
                        break;
            case(INCREMENT): 
                        fprintf(log_file, "token class: INCREMENT, ");
                        break;
            case(DECREMENT): 
                        fprintf(log_file, "token class: DECREMENT, ");
                        break;
            case(AND): 
                        fprintf(log_file, "token class: AND, ");
                        break;
            case(OR): 
                        fprintf(log_file, "token class: OR, ");
                        break;
            case(STRING): 
                        fprintf(log_file, "token class: STRING, ");
                        break;
            case(UNKNOWN): 
                        fprintf(log_file, "token class: UNKNOWN, ");
                        break;
            case(ENDOFFILE): 
                        fprintf(log_file, "token class: ENDOFFILE, ");
                        break;
            default:
                        fprintf(log_file, " ");
                        break;
      }


      switch(error_code_l)
      {
            case(0):
                  fprintf(log_file, "error code: %d]\n", NO_ERROR);
                  break;
            case(1):
                  fprintf(log_file, "error code %d]\n", ERROR_UNKNOWN_TOKEN);
                  break;
            default:
                  fprintf(log_file, " ");
                  break;
      }
}

//========================================================================================================
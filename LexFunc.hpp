#ifndef LEX_FUNC_HPP
#define LEX_FUNC_HPP

//========================================================================================================

#include <stdio.h>
#include "Header.hpp"

//========================================================================================================

extern FILE* log_file;
extern size_t cur_tok_num;
extern size_t tok_count;
extern size_t cur_line_num;

//========================================================================================================

enum tok_class
{
      KEYWORD     = 0,
      NUMBER      = 1,
      VARIABLE    = 2,
      OBJECT_ID   = 3,
      TYPE_ID     = 4,
      OP          = 5,
      CP          = 6,
      ASSIGN      = 7,
      MUL         = 8,
      DIV         = 9,
      ADD         = 10,
      MINUS       = 11,
      ABS         = 12,
      ASSIGNADD   = 13,
      ASSIGNMINUS = 14,
      REMDIV      = 15,
      INCREMENT   = 16,
      DECREMENT   = 17,
      AND         = 18,
      OR          = 19,
      STRING      = 20,
      UNKNOWN     = 21,
      ENDOFFILE   = 22,
};

//========================================================================================================

enum LexerErrors
{
      ERROR_INPUT_FILE = 1,
      ERROR_LOG_FILE_OPEN = 2,
      ERROR_FILE_OPEN = 3,
};

//========================================================================================================

/**
 * @brief Prints all necessary information about token.
 * 
 * @param token_l The current token.
 * @param tok_class_l The class of the token.
 * @param line_num_l  The current line where the token is.
 * @param cur_tok_num_l The current position of the token in the current line.
 * @param error_code_l Error code. If the token is correct it will equal to 0, else 1.
 */

void PrintLogFile(const char* token_l, const char tok_class_l, size_t const line_num_l, size_t const cur_tok_num_l, size_t const error_code_l);

//========================================================================================================

#endif //LEXICAL_ANALYSIS_FUNC_HPP
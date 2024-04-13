FILE_NAME := Tests.txt

All:
	flex --header-file=Header.hpp -o lex.yy.cc LexicalAnalysis.l
	g++ main.cpp lex.yy.cc LexFunc.cpp
	./a.out $(FILE_NAME)

Flex:
	flex --header-file=Header.hpp -o lex.yy.cc LexicalAnalysis.l

LexicalAnalysis: main.cpp lex.yy.cc LexFunc.cpp
	g++ main.cpp lex.yy.cc LexFunc.cpp
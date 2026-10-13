flex mylexer.l
g++ lex.yy.c -lfl -o lexer.ex
./lexer.ex < input.txt
rm lexer.ex lex.yy.c

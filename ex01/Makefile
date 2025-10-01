NAME = ex01

SRC = main.ml

all: 
	ocamlopt main.ml -o $(NAME)

run: all
	./$(NAME)
	@rm -f main.o main.cmx main.cmi $(NAME)

clean:
	rm -f main.o main.cmx main.cmi
c: clean

fclean: clean
	rm -f main.o main.cmx main.cmi $(NAME)
f: fclean

re: fclean all
r: re

.PHONY: all clean c fclean f re r run
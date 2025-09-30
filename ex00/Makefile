NAME = ex00

SRC = people.ml main.ml
OBJS = $(SRC:.ml=.cmx)

all: $(NAME)

$(NAME): $(OBJS)
	ocamlopt -o $@ $(OBJS)

people.cmx: people.ml
	ocamlopt -c people.ml

main.cmx: main.ml people.cmx
	ocamlopt -c main.ml

run: $(NAME)
	./$(NAME)
	@rm -f main.o people.o main.cmx people.cmx main.cmi people.cmi $(NAME)

clean:
	rm -f main.o people.o main.cmx people.cmx main.cmi people.cmi
c: clean

fclean: clean
	rm -f $(NAME)
f: fclean

re: fclean all
r: re

.PHONY: all clean c fclean f re r run

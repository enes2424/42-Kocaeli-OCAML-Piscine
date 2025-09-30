NAME = ex01

SRC = people.ml doctor.ml main.ml
OBJS = $(SRC:.ml=.cmx)

all: $(NAME)

$(NAME): $(OBJS)
	ocamlopt -o $@ $(OBJS)

people.cmx: people.ml
	ocamlopt -c people.ml

doctor.cmx: doctor.ml people.cmx
	ocamlopt -c doctor.ml

main.cmx: main.ml people.cmx doctor.cmx
	ocamlopt -c main.ml

run: $(NAME)
	./$(NAME)
	@rm -f main.o people.o doctor.o main.cmx people.cmx doctor.cmx main.cmi people.cmi doctor.cmi $(NAME)

clean:
	rm -f main.o people.o doctor.o main.cmx people.cmx doctor.cmx main.cmi people.cmi doctor.cmi
c: clean

fclean: clean
	rm -f $(NAME)
f: fclean

re: fclean all
r: re

.PHONY: all clean c fclean f re r run

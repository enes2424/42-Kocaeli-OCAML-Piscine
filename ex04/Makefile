NAME = ex04

SRC = atom.ml atoms.ml molecule.ml molecules.ml alkane.ml alkanes.ml reaction.ml alkane_combustion.ml main.ml
OBJS = $(SRC:.ml=.cmx)
CMI = $(SRC:.ml=.cmi)
O = $(SRC:.ml=.o)


all: $(NAME)

$(NAME): $(OBJS)
	ocamlopt -o $@ $(OBJS)

atom.cmx: atom.ml
	ocamlopt -c atom.ml

atoms.cmx: atoms.ml atom.cmx
	ocamlopt -c atoms.ml

molecule.cmx: molecule.ml atom.cmx atoms.cmx
	ocamlopt -c molecule.ml

molecules.cmx: molecules.ml atom.cmx atoms.cmx molecule.cmx
	ocamlopt -c molecules.ml

alkane.cmx: alkane.ml atom.cmx atoms.cmx molecule.cmx molecules.cmx
	ocamlopt -c alkane.ml

alkanes.cmx: alkanes.ml atom.cmx atoms.cmx molecule.cmx molecules.cmx alkane.cmx
	ocamlopt -c alkanes.ml

reaction.cmx: reaction.ml atom.cmx atoms.cmx molecule.cmx molecules.cmx alkane.cmx alkanes.cmx
	ocamlopt -c reaction.ml

alkane_combustion.cmx: alkane_combustion.ml atom.cmx atoms.cmx molecule.cmx molecules.cmx alkane.cmx alkanes.cmx reaction.cmx
	ocamlopt -c alkane_combustion.ml

main.cmx: main.ml atom.cmx atoms.cmx molecule.cmx molecules.cmx alkane.cmx alkanes.cmx reaction.cmx alkane_combustion.cmx
	ocamlopt -c main.ml

run: $(NAME)
	./$(NAME)
	@rm -f $(OBJS) $(CMI) $(O) $(NAME)

clean:
	rm -f $(OBJS) $(CMI) $(O) $(NAME)
c: clean

fclean: clean
	rm -f $(NAME)
f: fclean

re: fclean all
r: re

.PHONY: all clean c fclean f re r run

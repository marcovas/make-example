MODULE		= test
CC			= gcc
SRCDIR		= ./src
BINDIR		= ./bin

SOURCES		= main.c test.c

SRCS		= $(addprefix $(SRCDIR)/,$(SOURCES))
OBJS		= $(SRCS:.c=.o)
EXE			= $(BINDIR)/$(MODULE)
INIT		= $(BINDIR)

.SUFFIXES: .c .o .h

all: $(INIT) $(EXE) # Este é o target padrão, dependende de (INIT) e (EXE)

$(INIT): # Cria o diretório de saída
	@mkdir $(BINDIR)

$(EXE): $(OBJS) # Gera o artefato final
	$(CC) -o $@  $(SRCDIR)/*.o	

%.o: %.c
	$(CC) -c $< -o $@ 
	
clean: # Limpa os diretórios e artefatos gerados 
	rm -rf bin
	rm $(SRCDIR)/*.o

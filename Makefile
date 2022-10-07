NAME		=	so_long
CC			=	gcc
FLAGS		=	-Wall -Werror -Wextra
SANITIZE	=	-g3 -fsanitize=address
VALGRIND	=	valgrind --leak-check=full --show-leak-kinds=all --track-origins=yes --tool=memcheck --leak-resolution=high --error-exitcode=1
INC			=	so_long.h
LIB_PATH	=	./includes/
SRC_PATH	=	./src/
OBJ_PATH	=	./obj/
LIB			=	-L ./includes/ -lmlx -framework OpenGL -framework AppKit
SRC			=	so_long.c \
				ft_strlen.c
SRCS		=	$(addprefix $(SRC_PATH), $(SRC))
OBJ			=	$(SRC:.c=.o)
OBJS		=	$(addprefix $(OBJ_PATH), $(OBJ))

all: $(NAME)

$(NAME): $(SRCS)
	@ make -C $(LIB_PATH)minilibx
	@ mkdir -p obj
	@ $(CC) -c $(SRCS) -I $(LIB_PATH)
	@ ar -rc $(NAME).a $(OBJ)
	@ mv $(OBJ) $(OBJ_PATH)
	@ $(CC) $(FLAGS) -o $(NAME) -I $(LIB_PATH) $(SRCS) $(LIB)

sanitize:
	@ make	-C $(LIB_PATH)minilibx
	@ mkdir	-p obj
	@ $(CC) -c $(SANITIZE) -g $(SRCS) -I (LIB_PATH)
	@ ar -rc $(NAME).a $(OBJ)
	@ mv $(OBJ) $(OBJ_PATH)
	@ $(CC) $(FLAGS) $(SANITIZE) -g -o $(NAME) -I $(LIB_PATH) $(SRCS) $(LIB)

run:
	@ mkdir	-p obj
	@ $(CC) -c $(SRCS) -I $(LIB_PATH)
	@ ar -rc $(NAME).a $(OBJ)
	@ mv $(OBJ) $(OBJ_PATH)
	@ $(CC) -o $(NAME) -I $(LIB_PATH) $(SRCS) $(LIB)
	@ ./$(NAME)


v:
	@ mkdir	-p obj
	@ $(CC) -c $(SRCS) -I $(LIB_PATH)
	@ ar -rc $(NAME).a $(OBJ)
	@ mv $(OBJ) $(OBJ_PATH)
	@ $(CC) $(FLAGS) -o $(NAME) -I $(LIB_PATH) $(SRCS) $(LIB)
	@ $(VALGRIND) ./$(NAME)

clean:
	rm -rf $(OBJS) $(OBJ_PATH) $(LIB_PATH)/minilibx/*.o

fclean: clean
	rm -rf $(NAME) $(LIB_PATH)/minilibx/libmlx.a

re: fclean all

.PHONY: all clean fclean re run v

# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Makefile                                           :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: kcaraway <kcaraway@student.42.fr>          +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2020/11/24 18:19:40 by kcaraway          #+#    #+#              #
#    Updated: 2020/11/25 06:44:40 by kcaraway         ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

CLANG = gcc

C_FLAGS = -Wall -Werror -Wextra

NAME = libasm.a

NASM = nasm

NA_FLAGS = -f macho64

SRCS =\
ft_strlen.s \
ft_strcmp.s \
ft_strcpy.s \
ft_write.s \
ft_read.s \
ft_strdup.s

OBJS = $(SRCS:.s=.o)

INCLUDE = ./

MAIN = main.c

MAIN_OBJ = $(MAIN:.c=.o)

all: $(NAME)

%.o: %.s
	@$(NASM) $(NA_FLAGS) $<

%.o: %.c
	@$(CLANG) $(C_FLAGS) -c $(MAIN) -I $(INCLUDE)

$(NAME): $(OBJS) 
	@ar rcs $(NAME) $^
	@ranlib $(NAME)
	@echo "\033[32mlibasm.a created\033[0m"

test: $(MAIN_OBJ) $(NAME)
	@$(CLANG) $(C_FLAGS)  $^  -I $(INCLUDE) -o test

clean:
	@rm -f $(OBJS) $(MAIN_OBJ)
	@echo "\033[31mclean completed\033[0m"

fclean: clean
	@rm -f $(NAME)
	@rm -f test
	@echo "\033[31mfclean completed\033[0m"

re: fclean all

.PHONY: all clean fclean re
# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Makefile                                           :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: pmiceli <marvin@42.fr>                     +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2017/11/07 14:44:04 by pmiceli           #+#    #+#              #
#*   Updated: 2022/10/24 16:31:26 by                  ###   ########.fr       *#
#                                                                              #
# **************************************************************************** #

NAME = libft.a

SRCS_DIR = ./src/
SRCS_NAME = $(shell ls $(SRCS_DIR) | grep -E ".c")
SRCS = $(addprefix $(SRCDIR), $(SRCS_NAME))
INC = ./inc/
OBJS_DIR = ./obj/
OBJS = $(addprefix $(OBJS_DIR), $(SRCS:.c=.o))

CC = gcc
CFLAGS = -Wall -Wextra -Werror

all : $(OBJS_DIR) $(NAME)

$(OBJS_DIR):
	@mkdir -p $(OBJS_DIR)
#	@echo "\033[033m➼	\033[033mCreating Libft's objects\033m"

$(OBJS_DIR)%.o:$(SRCS_DIR)%.c
	@echo "\033[038;2;255;153;0m⧖	Creating	$@\033[0m"
	@$(CC) $(CFLAGS) -I$(INC) -o $@ -c $<

$(NAME) : $(OBJS)
	@echo "\033[032m✓	\033[0m\033[032mLibft's objects created\033[0m"
	@ar rcs $(NAME) $(OBJS)
	@ranlib $(NAME)
	@echo "\033[032m✓	\033[0m\033[032mLibft created\033[0m"

clean :
	@rm -rf $(OBJS_DIR)
	@echo "\033[36m❌	\033[0m\033[31mLibft's objets removed\033[0m"

fclean : clean
	@rm -rf $(NAME)
	@echo "\033[036m❌	\033[0m\033[31mLibft removed"

re : fclean all

.PHONY : all clean fclean re

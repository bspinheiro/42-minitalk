# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Makefile                                           :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: bda-silv <bda-silv@student.42.rio>         +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2022/10/10 19:01:06 by bda-silv          #+#    #+#              #
#*   Updated: 2022/10/11 20:57:17 by                  ###   ########.fr       *#
#                                                                              #
# **************************************************************************** #

# TODO:
# Incluir .gitignore caso nao exista
# Append dos Diretórios
# Criar Integracao com Libft / GNL / FT_Printf
# Criar Valgrind e Debug
# Selecionar Quais Usar
# Colors and Icons

NAME		:=



#.*.*.*.*.*.*.*.*.*.*.*.*.*.*.*.*.*.*.*.*.*.*.*.*.*.*.*.*.*.*.*.*.*.*.*.*.*.*.*.

DIR			:=	./
_INC		:=	include
_SRC		:=	src
_OBJ		:=	obj

#.*.*.*.*.*.*.*.*.*.*.*.*.*.*.*.*.*.*.*.*.*.*.*.*.*.*.*.*.*.*.*.*.*.*.*.*.*.*.*.

CC			:=	cc
CFLAGS		:=	-Wall -Wextra -Werror
CPPFLAGS	:=	-g

AR			:=	ar -rcs
RL			:=	ranlib
RM			:=	rm -f


all:		$(NAME)

$(NAME):	$(OBJS)
			$(AR) $(NAME) $(OBJS)
			$(RL) $(NAME)

clean:
			$(RM) $(OBJS)

fclean:		clean
			$(RM) $(NAME)

re:			fclean all

.PHONY:				all clean fclean re


#.*.*.*.*.*.*.*.*.*.*.*.*.*.*.*.*. VERBOSE .*.*.*.*.*.*.*.*.*.*.*.*.*.*.*.*.*.*.
ifdef VERBOSE
 MAKEFLAGS += --debug
endif
ifndef VERBOSE
 MAKEFLAGS += --silent
.SILENT:
endif
#.*.*.*.*.*.*.*.*.*.*.*.*.*.*.*.*.*.*.*.*.*.*.*.*.*.*.*.*.*.*.*.*.*.*.*.*.*.*.*.


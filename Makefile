# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Makefile                                           :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: bda-silv <bda-silv@student.42.rio>         +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2022/10/10 19:01:06 by bda-silv          #+#    #+#              #
#*   Updated: 2022/10/13 15:01:25 by                  ###   ########.fr       *#
#                                                                              #
# **************************************************************************** #

# TODO:
# Incluir .gitignore caso nao exista
# Append dos Diretórios
# Criar Integracao com Libft / GNL / FT_Printf
# Criar Valgrind e Debug
# Selecionar Quais Usar

#NAME		:=
#.*.*.*.*.*.*.*.*.*.*.*.*.*.*.*.*.*.*.*.*.*.*.*.*.*.*.*.*.*.*.*.*.*.*.*.*.*.*.*.
#DIR			:=	./
#_INC		:=	include
#_SRC		:=	src
#_OBJ		:=	obj
#.*.*.*.*.*.*.*.*.*.*.*.*.*.*.*.*. FLAGS .*.*.*.*.*.*.*.*.*.*.*.*.*.*.*.*.*.*.*.*.*.*.
#CC			:=	cc
#CFLAGS		:=	-Wall -Wextra -Werror
#CPPFLAGS	:=	-g

#AR			:=	ar -rcs
#RL			:=	ranlib
#RM			:=	rm -f

SHELL=$$SHELL


#.*.*.*.*.*.*.*.*.*.*.*.*.*.*.*.*. COLOURS .*.*.*.*.*.*.*.*.*.*.*.*.*.*.*.*.*.*.
s:=\033[0;
red:=$s31m
grn:=$s32m
yel:=$s33m
blu:=$s34m
pnk:=$s35m
cya:=$s36m
wht:=$s37m
rst:=$s00m

color := grn() {printf "${grn}$$@${rst}\n"}; \
		 red() {printf "$(red)$$@$(rst)\n"}; \
		 yel() {printf "$(yel)$$@$(rst)\n"}; \
		 blu() {printf "$(blu)$$@$(rst)\n"}; \
		 pnk() {printf "$(pnk)$$@$(rst)\n"}; \
		 cya() {printf "$(cya)$$@$(rst)\n"}; \
		 wht() {printf "$(wht)$$@$(rst)\n"}; \
		 rst() {printf "$(rst)$$@$(rst)\n"}; \

rainbow:
		 echo "$(red)R$(grn)A$(yel)I$(blu)N$(pnk)B$(cya)O$(wht)W$(rst)"

#.*.*.*.*.*.*.*.*.*.*.*.*.*.*.*.*. RULES .*.*.*.*.*.*.*.*.*.*.*.*.*.*.*.*.*.*.*.*.*.*.

#all:		$(NAME)

#$(NAME):	$(OBJS)
#			$(AR) $(NAME) $(OBJS)
#			$(RL) $(NAME)

#clean:
#			$(RM) $(OBJS)

#fclean:		clean
#			$(RM) $(NAME)

#re:			fclean all

#.PHONY:		all clean fclean re

#.*.*.*.*.*.*.*.*.*.*.*.*.*.*.*.*. VERBOSE .*.*.*.*.*.*.*.*.*.*.*.*.*.*.*.*.*.*.
ifdef VERBOSE
 MAKEFLAGS += --debug
endif

ifndef VERBOSE
 MAKEFLAGS += --silent
.SILENT:
endif
#.*.*.*.*.*.*.*.*.*.*.*.*.*.*.*.*.*.*.*.*.*.*.*.*.*.*.*.*.*.*.*.*.*.*.*.*.*.*.*.

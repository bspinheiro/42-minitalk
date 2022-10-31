# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Makefile                                           :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: bda-silv <bda-silv@student.42.rio>         +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2022/10/24 16:48:08 by bda-silv          #+#    #+#              #
#*   Updated: 2022/10/31 15:23:40 by                  ###   ########.fr       *#
#                                                                              #
# **************************************************************************** #
# TODO
# * Debug
# * Valgrind
# * .gitignore
# * Evaluation
#
#
#
#.*.*.*.*.*.*.*.*.*.*.*.*.*.*.*.*. SPECS .*.*.*.*.*.*.*.*.*.*.*.*.*.*.*.*.*.*.*.

NAME				=	ft_printf.a

SRCS_DIR			=	./src/
OBJS_DIR			=	./obj/
INCS_DIR			=	./inc/
LIBS_DIR			=	..

#.*.*.*.*.*.*.*.*.*.*.*.*.*.*.*.*. SETUP .*.*.*.*.*.*.*.*.*.*.*.*.*.*.*.*.*.*.*.

SRCS_NAME			=	$(shell ls $(SRCS_DIR) | grep -E ".c")
SRCS				=	$(addprefix $(SRCDIR), $(SRCS_NAME))
OBJS				=	$(addprefix $(OBJS_DIR), $(SRCS:.c=.o))

CC					=	cc
CFLAGS				=	-Wall -Wextra -Werror
CPPFLAGS			=	-g

MD					=	mkdir -p
AR					=	ar rcs
RL					=	ranlib
RM					=	rm -rf

#.*.*.*.*.*.*.*.*.*.*.*.*.*.*.*.*. VISUALS .*.*.*.*.*.*.*.*.*.*.*.*.*.*.*.*.*.*.
ok:=✓
ko:=✗
ck:=・
s:=\033[0
red:=$s31m
grn:=$s32m
yel:=$s33m
blu:=$s34m
pnk:=$s35m
cya:=$s36m
wht:=$s37m
rst:=$s00m
ora:=$s38;2;255;153;0m
#.*.*.*.*.*.*.*.*.*.*.*.*.*.*.*.*. RULES .*.*.*.*.*.*.*.*.*.*.*.*.*.*.*.*.*.*.*.

all : $(OBJS_DIR) $(NAME)

$(OBJS_DIR) :
	$(MD) $(OBJS_DIR)

$(OBJS_DIR)%.o : $(SRCS_DIR)%.c
	@echo "$(ora)$(ck)	Creating		$@$(rst)"
	$(CC) $(CFLAGS) -I$(INCS_DIR) -o $@ -c $<

$(NAME) : $(OBJS)
	$(AR) $(NAME) $(OBJS)
	$(RL) $(NAME)
	@echo "$(grn)$(ok)	Compiled		$@$(rst)"

clean :
	$(RM) $(OBJS_DIR)
	@echo "$(red)$(ko)	Removing		$(OBJS_DIR)$(rst)"

fclean : clean
	$(RM) $(NAME)
	@echo "$(red)$(ko)	Removing		$(NAME)$(rst)"

re : fclean all

norm:
	@echo "$(pnk)"
	norminette | grep "Error" || echo "$(grn)$(ok)	Norminette		 OK!"

rainbow :
	@echo "$(red)R$(grn)A$(yel)I$(blu)N$(pnk)B$(cya)O$(wht)W$(rst)"

.PHONY : all clean fclean re norm rainbow

#.*.*.*.*.*.*.*.*.*.*.*.*.*.*.*.*. VERBOSE .*.*.*.*.*.*.*.*.*.*.*.*.*.*.*.*.*.*.
ifdef VERBOSE
 MAKEFLAGS += --debug
endif

ifndef VERBOSE
 MAKEFLAGS += --silent
.SILENT:
endif
#.*.*.*.*.*.*.*.*.*.*.*.*.*.*.*.*.*.*.*.*.*.*.*.*.*.*.*.*.*.*.*.*.*.*.*.*.*.*.*.

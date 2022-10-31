# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Makefile                                           :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: bda-silv <bda-silv@student.42.rio>         +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2022/10/24 16:48:08 by bda-silv          #+#    #+#              #
#*   Updated: 2022/10/31 16:37:50 by                  ###   ########.fr       *#
#                                                                              #
# **************************************************************************** #
# TODO
# * Debug
# * Valgrind
# * Compile
#
#.*.*.*.*.*.*.*.*.*.*.*.*.*.*.*.*. SPECS .*.*.*.*.*.*.*.*.*.*.*.*.*.*.*.*.*.*.*.

NAME				=	libft.a

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

norm :
	@echo "$(pnk)"
	norminette | grep "Error" || echo "$(grn)$(ok)	Norminette		 OK!"

ign :
	if [ -f '.gitignore' ]; \
	then \
		echo "$(red)$(ko)	.gitignore is already set.$(ora)" ; \
		cat -n .gitignore ; \
	else \
		echo "$(grn)$(ok)	.gitignore was created.$(ora)" ; \
		echo ".*" >> .gitignore ; \
		echo "*.o" >> .gitignore ; \
		echo "*.a" >> .gitignore ; \
		echo "*.out" >> .gitignore ; \
		echo "*.DSYM" >> .gitignore ; \
		echo ".DS_Store" >> .gitignore ; \
		cat -n .gitignore ; \
	fi

comp: re
	if [-f 'main.c' ]

dbg :

val :

deli : fclean ign norm
	test -f main.c && mv main.c .main.c || echo "$(ora)$(ck)	Missing main.c"
	$(RM) *.o *.a *.out *.DSYM .DS_Store
	@echo "$(grn)$(ok)	Files ready to delivery!"

rainbow :
	@echo "$(red)R$(grn)A$(yel)I$(blu)N$(pnk)B$(cya)O$(wht)W$(rst)"

.PHONY : all clean fclean re norm ign comp dbg val deli rainbow

#.*.*.*.*.*.*.*.*.*.*.*.*.*.*.*.*. VERBOSE .*.*.*.*.*.*.*.*.*.*.*.*.*.*.*.*.*.*.

ifdef VERBOSE
 MAKEFLAGS += --debug
endif

ifndef VERBOSE
 MAKEFLAGS += --silent
.SILENT:
endif

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
#.*.*.*.*.*.*.*.*.*.*.*.*.*.*.*.*.*.*.*.*.*.*.*.*.*.*.*.*.*.*.*.*.*.*.*.*.*.*.*.

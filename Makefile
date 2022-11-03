# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Makefile                                           :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: bda-silv <bda-silv@student.42.rio>         +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2022/10/24 16:48:08 by bda-silv          #+#    #+#              #
#*   Updated: 2022/11/03 13:51:30 by                  ###   ########.fr       *#
#                                                                              #
# **************************************************************************** #
#
#.*.*.*.*.*.*.*.*.*.*.*.*.*.*.*.*. SPECS .*.*.*.*.*.*.*.*.*.*.*.*.*.*.*.*.*.*.*.

PROJ				=	minitalk

SRCS_DIR			=	./src/
OBJS_DIR			=	./obj/
INCS_DIR			=	./inc/
LIBS_DIR			=	./lib/

#.*.*.*.*.*.*.*.*.*.*.*.*.*.*.*.*. SETUP .*.*.*.*.*.*.*.*.*.*.*.*.*.*.*.*.*.*.*.

LIBS_NAME			=	$(shell cd $(LIBS_DIR); ls -d */)
LIBS_PATH			=	$(addprefix $(LIBS_DIR), $(LIBS_NAME))
SRCS_NAME			=	$(shell ls $(SRCS_DIR) | grep -E ".+\.c")
SRCS				=	$(addprefix $(SRCS_DIR), $(SRCS_NAME))
OBJS				=	$(addprefix $(OBJS_DIR), $(SRCS_NAME:.c=.o))
LIBS				=	$(addsuffix $(LIBS_NAME:/=).a, $(LIBS_PATH))
SRC					=	$(SRCS_NAME:.c=)
NAME				=	$(SRCS_NAME)

CC					=	cc
CFLAGS				=	-Wall -Wextra -Werror
CPPFLAGS			=	-g

MD					=	mkdir -p
AR					=	ar rcs
RL					=	ranlib
RM					=	rm -rf

#.*.*.*.*.*.*.*.*.*.*.*.*.*.*.*.*. ROUTE .*.*.*.*.*.*.*.*.*.*.*.*.*.*.*.*.*.*.*.

ifeq (run,$(firstword $(MAKECMDGOALS)))
  RUN_ARGS := $(wordlist 2,$(words $(MAKECMDGOALS)),$(MAKECMDGOALS))
  $(eval $(RUN_ARGS):;@:)
endif
ifeq (leaks,$(firstword $(MAKECMDGOALS)))
  RUN_ARGS := $(wordlist 2,$(words $(MAKECMDGOALS)),$(MAKECMDGOALS))
  $(eval $(RUN_ARGS):;@:)
endif
ifeq (debug,$(firstword $(MAKECMDGOALS)))
  RUN_ARGS := $(wordlist 2,$(words $(MAKECMDGOALS)),$(MAKECMDGOALS))
  $(eval $(RUN_ARGS):;@:)
endif

#.*.*.*.*.*.*.*.*.*.*.*.*.*.*.*.*. RULES .*.*.*.*.*.*.*.*.*.*.*.*.*.*.*.*.*.*.*.

all : $(OBJS_DIR) $(LIBS) $(NAME)

$(OBJS_DIR) :
	$(MD) $(OBJS_DIR)

$(OBJS_DIR)%.o : $(SRCS_DIR)%.c
	@echo "$(ora)$(ck)	Creating		$@$(rst)"
	$(CC) $(CFLAGS) -I$(INCS_DIR) -o $@ -c $<

$(LIBS) :
	$(MAKE) -C $(LIBS_PATH)

$(NAME) : $(OBJS) $(LIBS)
	$(CC) $(CFLAGS) $(OBJS) $(LIBS) -o $(SRC)
	@echo "$(grn)$(ok)	Compiled		$@$(rst)"

clean :
	$(MAKE) $@ -C $(LIBS_PATH)
	$(RM) $(OBJS_DIR)
	@echo "$(red)$(ko)	Removing		$(OBJS_DIR)$(rst)"

fclean :
	$(MAKE) $@ -C $(LIBS_PATH)
	$(RM) $(SRC) $(OBJS_DIR)
	@echo "$(red)$(ko)	Removing		$(SRC)$(rst)"

re : fclean all

norm :
	@echo "$(pnk)"
	norminette | grep "Error" || echo "$(grn)$(ok)	Norminette		OK!"

comp : all

run : comp
	@echo "$(grn)$(ok)	Running			$(RUN_ARGS)$(cya)"
	./$(RUN_ARGS); echo "$(rst)\n"

debug : leaks
	@echo "$(pnk)"
	lldb $(RUN_ARGS)

leaks :
	valgrind --leak-check=full --show-leak-kinds=all --trace-children=yes \
	$(addprefix ./, $(RUN_ARGS))

gig :
	if [ -f '.gitignore' ]; \
	then \
		echo "$(grn)$(ok)	.gitignore		OK!$(ora)" ; \
	else \
		echo "$(ora)$(ck)	Creating		.gitignore$(ora)" ; \
		echo ".*" >> .gitignore ; \
		echo "*.o" >> .gitignore ; \
		echo "*.a" >> .gitignore ; \
		echo "*.out" >> .gitignore ; \
		echo "*.dSYM" >> .gitignore ; \
		echo ".DS_Store" >> .gitignore ; \
		cat -n .gitignore ; \
	fi

sure : norm gig
	test -f main.c && mv main.c .main.c \
	|| echo "$(ora)$(ck)	Skipping		main.c"
	$(RM) *.o *.a *.out *.dSYM .DS_Store
	$(MAKE) fclean
	@echo "$(grn)$(ok)	Delivery		DONE!"

rainbow :
	@echo "$(red)R$(grn)A$(yel)I$(blu)N$(pnk)B$(cya)O$(wht)W$(rst)"

c : comp

dbg : debug

.PHONY : all clean fclean re norm gig comp debug leaks sure rainbow c dbg run

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

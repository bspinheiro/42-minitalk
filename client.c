/* ************************************************************************** */
/*                                                                            */
/*                                                        :::      ::::::::   */
/*   client.c                                           :+:      :+:    :+:   */
/*                                                    +:+ +:+         +:+     */
/*   By: bda-silv <bda-silv@student.42.rio>         +#+  +:+       +#+        */
/*                                                +#+#+#+#+#+   +#+           */
/*   Created: 2022/10/10 09:25:17 by bda-silv          #+#    #+#             */
/*   Updated: 2022/10/10 11:54:38 by bda-silv         ###   ########.fr       */
/*                                                                            */
/* ************************************************************************** */

#include <unistd.h>

/*TODO: Exportar putchar e puts*/

void	putchar(char c)
{
	write(1, &c, 1);
}

void	puts(char *s)
{
	while (*s)
		putchar(*s++);
	putchar ('\n');
}

int	main(int argc, char **argv)
{
	int		i;
	char	*pid;
	char	*msg;

	i = 0;
	if (argc != 3)
	{
		puts("Unexpected number of arguments!");
		return (argc);
	}
	pid = argv[1];
	msg = argv[2];
	return (0);
}

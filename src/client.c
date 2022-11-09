/* ************************************************************************** */
/*                                                                            */
/*                                                        :::      ::::::::   */
/*   client.c                                           :+:      :+:    :+:   */
/*                                                    +:+ +:+         +:+     */
/*   By: bda-silv <bda-silv@student.42.rio>         +#+  +:+       +#+        */
/*                                                +#+#+#+#+#+   +#+           */
/*   Created: 2022/10/10 09:25:17 by bda-silv          #+#    #+#             */
/*   Updated: 2022/11/09 13:02:09 by bda-silv         ###   ########.fr       */
/*                                                                            */
/* ************************************************************************** */

#include "minitalk.h"

void	send_bits(int c, int pid)
{
	int	bit;

	bit = 8;
	while (0 < bit--)
	{
		if (c & 0x01 << bit)
			kill(pid, SIGUSR2);
		else
			kill(pid, SIGUSR1);
		usleep (WAIT_TIME);
	}
}

void	send_msg(int pid, char *msg)
{
	size_t	i;

	i = 0;
	while (i < ft_strlen(msg))
	{
		send_bits(msg[i], pid);
		i++;
	}
}

int	main(int argc, char **argv)
{
	int		pid;
	char	*msg;

	if (argc != 3)
	{
		ft_puts("Unexpected arguments!\n ./client [PID] [MSG]");
		return (argc);
	}
	pid = ft_atoi(argv[1]);
	msg = argv[2];
	send_msg(pid, msg);
	return (0);
}

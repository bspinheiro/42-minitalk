/* ************************************************************************** */
/*                                                                            */
/*                                                        :::      ::::::::   */
/*   server.c                                           :+:      :+:    :+:   */
/*                                                    +:+ +:+         +:+     */
/*   By: bda-silv <bda-silv@student.42.rio>         +#+  +:+       +#+        */
/*                                                +#+#+#+#+#+   +#+           */
/*   Created: 2022/11/03 14:42:50 by bda-silv          #+#    #+#             */
/*   Updated: 2022/11/10 15:18:42 by bda-silv         ###   ########.fr       */
/*                                                                            */
/* ************************************************************************** */

#include "../inc/minitalk.h"

void	sig_handler(int signal)
{
	static int		bits = 0;
	static int		c = 0;

	bits++;
	c <<= 1;
	if (signal == SIGUSR2)
		c++;
	if (bits == 8)
	{
		write(1, &c, 1);
		c = 0;
		bits = 0;
	}
}

void	listen_bits(void)
{
	signal(SIGUSR1, sig_handler);
	signal(SIGUSR2, sig_handler);
}

int	main(void)
{
	ft_printf("PID: %i\n", getpid());
	while (1)
		listen_bits();
	return (0);
}

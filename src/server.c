/* ************************************************************************** */
/*                                                                            */
/*                                                        :::      ::::::::   */
/*   server.c                                           :+:      :+:    :+:   */
/*                                                    +:+ +:+         +:+     */
/*   By: bda-silv <bda-silv@student.42.rio>         +#+  +:+       +#+        */
/*                                                +#+#+#+#+#+   +#+           */
/*   Created: 2022/11/03 14:42:50 by bda-silv          #+#    #+#             */
/*   Updated: 2022/11/08 02:23:29 by bda-silv         ###   ########.fr       */
/*                                                                            */
/* ************************************************************************** */

#include "server.h"
#include <unistd.h>
#include <signal.h>

/* TODO:
 * - Get PID and show
 * - Testar receber sinal
 * - Colocar loop de espera
 * - Print
 * */

void	sig_handler(int signal)
{
	ft_printf("%i: signal received\n", signal);
}

int	main(void)
{
	ft_printf("PID: %i\n", getpid());
	signal(SIGUSR1, sig_handler);
	signal(SIGUSR2, sig_handler);
	while (1)
		sleep (1);
	return (0);
}

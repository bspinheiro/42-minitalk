/* ************************************************************************** */
/*                                                                            */
/*                                                        :::      ::::::::   */
/*   client.c                                           :+:      :+:    :+:   */
/*                                                    +:+ +:+         +:+     */
/*   By: bda-silv <bda-silv@student.42.rio>         +#+  +:+       +#+        */
/*                                                +#+#+#+#+#+   +#+           */
/*   Created: 2022/10/10 09:25:17 by bda-silv          #+#    #+#             */
/*   Updated: 2022/11/08 02:37:36 by bda-silv         ###   ########.fr       */
/*                                                                            */
/* ************************************************************************** */

#include "client.h"

/*TODO:
 * Send msgs
 * */

int	main(int argc, char **argv)
{
	int		pid;
	int		msg;

	if (argc != 3)
	{
		ft_puts("Unexpected arguments!");
		return (argc);
	}
	pid = ft_atoi(argv[1]);
	msg = ft_atoi(argv[2]);
	ft_printf("PID:%i SIG:%i\n", pid, msg);
	kill(pid, msg);
	return (0);
}

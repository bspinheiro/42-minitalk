/* ************************************************************************** */
/*                                                                            */
/*                                                        :::      ::::::::   */
/*   client.c                                           :+:      :+:    :+:   */
/*                                                    +:+ +:+         +:+     */
/*   By: bda-silv <bda-silv@student.42.rio>         +#+  +:+       +#+        */
/*                                                +#+#+#+#+#+   +#+           */
/*   Created: 2022/10/10 09:25:17 by bda-silv          #+#    #+#             */
/*   Updated: 2022/11/03 10:29:22 by bda-silv         ###   ########.fr       */
/*                                                                            */
/* ************************************************************************** */

#include "client.h"

/*TODO:
 * Validar PID (Deve ser um numero)  >> atoi
 * */

int	main(int argc, char **argv)
{
	int		pid;
	char	*msg;

	if (argc != 3)
	{
		ft_puts("Unexpected arguments!");
		return (argc);
	}
	pid = ft_atoi(argv[1]);
	msg = argv[2];
	ft_printf("%i %s", pid, msg);
	return (0);
}

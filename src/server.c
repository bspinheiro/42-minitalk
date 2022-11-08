/* ************************************************************************** */
/*                                                                            */
/*                                                        :::      ::::::::   */
/*   server.c                                           :+:      :+:    :+:   */
/*                                                    +:+ +:+         +:+     */
/*   By: bda-silv <bda-silv@student.42.rio>         +#+  +:+       +#+        */
/*                                                +#+#+#+#+#+   +#+           */
/*   Created: 2022/11/03 14:42:50 by bda-silv          #+#    #+#             */
/*   Updated: 2022/11/08 01:24:33 by bda-silv         ###   ########.fr       */
/*                                                                            */
/* ************************************************************************** */

#include "server.h"
#include <unistd.h>
/* TODO:
 * - Get PID and show
 * - Listen for Message
 * - Print
 * */

int	main(void)
{
	ft_printf("PID: %i\n", getpid());
	return (0);
}

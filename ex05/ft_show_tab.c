/* ************************************************************************** */
/*                                                                            */
/*                                                        :::      ::::::::   */
/*   ft_show_tab.c                                      :+:      :+:    :+:   */
/*                                                    +:+ +:+         +:+     */
/*   By: ppetchda <marvin@42.fr>                    +#+  +:+       +#+        */
/*                                                +#+#+#+#+#+   +#+           */
/*   Created: 2021/10/26 23:52:59 by porrapat          #+#    #+#             */
/*   Updated: 2021/10/26 23:53:55 by porrapat         ###   ########.fr       */
/*                                                                            */
/* ************************************************************************** */

#include <unistd.h>
#include <stdlib.h>

#include "ft_stock_str.h"

char	*ft_strdup(char *src)
{
	int		index;
	char	*dest;

	index = 0;
	dest = (char *)malloc(ft_str_length(src) * sizeof(char) + 1);
	if (dest == NULL)
		return (0);
	while (src[index])
	{
		dest[index] = src[index];
		index++;
	}
	dest[index] = '\0';
	return (dest);
}

void	ft_put_string(char *str)
{
	while (*str)
	{
		write(1, str, 1);
		str++;
	}
}

void	ft_put_number(int number)
{
	if (number > 9)
		ft_put_number(number / 10);
	write(1, &"0123456789"[number % 10], 1);
}

void	ft_show_tab(struct s_stock_str *par)
{
	int	index;

	index = 0;
	while (par[index].str != 0)
	{
		ft_put_string(par[index].str);
		ft_put_string("\n");
		ft_put_number(par[index].size);
		ft_put_string("\n");
		ft_put_string(par[index].copy);
		ft_put_string("\n");
		index++;
	}
}

struct s_stock_str	*ft_strs_to_tab(int ac, char **av)
{
	int					index;
	struct s_stock_str	*array;

	ac = ac + 0;
	array = malloc((ac + 1) * sizeof(struct s_stock_str));
	if (!array)
		return (NULL);
	index = 0;
	while (index < ac)
	{
		array[index].size = ft_str_length(av[index]);
		array[index].str = av[index];
		array[index].copy = ft_strdup(av[index]);
		index++;
	}
	array[index] = (struct s_stock_str){0, 0, 0};
	return (array);
}

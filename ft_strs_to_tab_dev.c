/* ************************************************************************** */
/*                                                                            */
/*                                                        :::      ::::::::   */
/*   ft_strs_to_tab.c                                   :+:      :+:    :+:   */
/*                                                    +:+ +:+         +:+     */
/*   By: ppetchda <marvin@42.fr>                    +#+  +:+       +#+        */
/*                                                +#+#+#+#+#+   +#+           */
/*   Created: 2021/10/26 23:52:59 by porrapat          #+#    #+#             */
/*   Updated: 2021/10/26 23:53:55 by porrapat         ###   ########.fr       */
/*                                                                            */
/* ************************************************************************** */

#include <stdlib.h>
#include <stdio.h>

#include "ft_stock_str.h"

int	ft_str_length(char *str)
{
	int	index;

	index = 0;
	while (str[index])
		index++;
	return (index);
}

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

struct	s_stock_str	*ft_strs_to_tab(int ac, char **av)
{
	int					index;
	struct s_stock_str	*array;
	struct s_stock_str	*created;

	ac = ac + 0;
	array = malloc((ac + 1) * sizeof(struct s_stock_str));
	if (!array)
		return (NULL);
	index = 0;
	while (index < ac)
	{
		created = (t_stock_str *)malloc(sizeof(struct s_stock_str));
		if (!created)
			return (NULL);
		array[index] = *created;
		array[index].size = ft_str_length(av[index]);
		array[index].str = av[index];
		array[index].copy = ft_strdup(av[index]);
		index++;
	}
	array[index] = (struct s_stock_str){0, 0, 0};
	return (array);
}

int	main(void)
{
	int					index;
	int					ac;
	char				**av;
	struct s_stock_str	*structs;

	ac = 10;
	av = (char **)malloc((ac + 1) * sizeof(char *));
	index = 0;
	while (index < ac)
	{
		av[index] = (char *)malloc((2 + 1) * sizeof(char));
		av[index][0] = 'x';
		av[index][1] = (char)(index + 'a');
		av[index][2] = '\0';
		index++;
	}
	structs = ft_strs_to_tab(ac, av);
	index = 0;
	while (index < ac)
	{
		printf("%d\n", index);
		printf("\t| original : $%s$ @ %p\n", structs[index].str, structs[index].str);
		printf("\t|   copied : $%s$ @ %p\n", structs[index].copy, structs[index].copy);
		printf("\t|     size : %d\n", structs[index].size);
		index++;
	}
}

#include "so_long.h"

int main(void)
{
	char *arr = (char*) malloc(5 * sizeof(char));
	int i;

	i = 0;

	while (arr[i])
	{
		arr[i] = 'a';
		i++;
	}
	printf("value is %c \n", arr[0]);
	printf("value is %c \n", arr[1]);
	printf("value is %c \n", arr[2]);
	printf("value is %c \n", arr[3]);
	printf("value is %c \n", arr[4]);
	printf("value is %c \n", arr[5]);
	printf("value is %zu \n", ft_strlen(arr));
	free(arr);
	return (0);
}

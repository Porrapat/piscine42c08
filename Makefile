.DEFAULT_GOAL := all
norminette:
	-norminette ./ex00/ft_strlen.c
	-norminette ./ex01/ft_putstr.c
	-norminette ./ex02/ft_putnbr.c
	-norminette ./ex03/ft_atoi.c
	-norminette ./ex04/ft_putnbr_base.c
	-norminette ./ex05/ft_atoi_base.c

compile: norminette
	-gcc ./ex00/ft_strlen.c test_ex00_ft_strlen.c -Wall -Werror -Wextra -o test_ex00_ft_strlen
	-gcc ./ex01/ft_putstr.c test_ex01_ft_putstr.c -Wall -Werror -Wextra -o test_ex01_ft_putstr
	-gcc ./ex02/ft_putnbr.c test_ex02_ft_putnbr.c -Wall -Werror -Wextra -o test_ex02_ft_putnbr
	-gcc ./ex03/ft_atoi.c test_ex03_ft_atoi.c -Wall -Werror -Wextra -o test_ex03_ft_atoi
	-gcc ./ex04/ft_putnbr_base.c test_ex04_ft_putnbr_base.c -Wall -Werror -Wextra -o test_ex04_ft_putnbr_base
	-gcc ./ex05/ft_atoi_base.c ./ex05/ft_strlen.c test_ex05_ft_atoi_base.c -Wall -Werror -Wextra -o test_ex05_ft_atoi_base

build-sample: compile
	-./test_ex00_ft_strlen > result_sample_ex00_ft_strlen.txt
	-./test_ex01_ft_putstr > result_sample_ex01_ft_putstr.txt
	-./test_ex02_ft_putnbr > result_sample_ex02_ft_putnbr.txt
	-./test_ex03_ft_atoi > result_sample_ex03_ft_atoi.txt
	-./test_ex04_ft_putnbr_base > result_sample_ex04_ft_putnbr_base.txt
	-./test_ex05_ft_atoi_base > result_sample_ex05_ft_atoi_base.txt

run:	compile
	-./test_ex00_ft_strlen > result_current_ex00_ft_strlen.txt
	-./test_ex01_ft_putstr > result_current_ex01_ft_putstr.txt
	-./test_ex02_ft_putnbr > result_current_ex02_ft_putnbr.txt
	-./test_ex03_ft_atoi > result_current_ex03_ft_atoi.txt
	-./test_ex04_ft_putnbr_base > result_current_ex04_ft_putnbr_base.txt
	-./test_ex05_ft_atoi_base > result_current_ex05_ft_atoi_base.txt

all:	norminette	compile run

test:	all
	-diff result_current_ex00_ft_strlen.txt result_sample_ex00_ft_strlen.txt
	-diff result_current_ex01_ft_putstr.txt result_sample_ex01_ft_putstr.txt
	-diff result_current_ex02_ft_putnbr.txt result_sample_ex02_ft_putnbr.txt
	-diff result_current_ex03_ft_atoi.txt result_sample_ex03_ft_atoi.txt
	-diff result_current_ex04_ft_putnbr_base.txt result_sample_ex04_ft_putnbr_base.txt
	-diff result_current_ex05_ft_atoi_base.txt result_sample_ex05_ft_atoi_base.txt

clean:
	-rm -rf */*.out
	-rm -rf result_current_ex*.txt
	-rm test_ex00_ft_strlen
	-rm test_ex01_ft_putstr
	-rm test_ex02_ft_putnbr
	-rm test_ex03_ft_atoi
	-rm test_ex04_ft_putnbr_base
	-rm test_ex05_ft_atoi_base

clean-sample:
	-rm -rf result_sample_ex*.txt

clean-before-push-with-sample: clean
	-git add .
	-git commit -m "Build Sample Complete"
	-git push origin master

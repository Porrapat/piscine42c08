.DEFAULT_GOAL := all

norminette:
	-norminette ./ex00/ft.h
	-norminette ./ex01/ft_boolean.h
	-norminette ./ex02/ft_abs.h
	-norminette ./ex03/ft_point.h
	-norminette ./ex04/ft_stock_str.h
	-norminette ./ex04/ft_strs_to_tab.c
	-norminette ./ex05/ft_stock_str.h
	-norminette ./ex05/ft_show_tab.c

compile: norminette
	-gcc test_ex00.c -Wall -Werror -Wextra -o test_ex00
	-gcc test_ex01.c -Wall -Werror -Wextra -o test_ex01
	-gcc test_ex02.c -Wall -Werror -Wextra -o test_ex02
	-gcc test_ex03.c -Wall -Werror -Wextra -o test_ex03
	-gcc test_ex04_ft_strs_to_tab.c ./ex04/ft_strs_to_tab.c -Wall -Werror -Wextra -o test_ex04_ft_strs_to_tab
	-gcc test_ex05_ft_show_tab.c ./ex05/ft_str_length.c ./ex05/ft_show_tab.c -Wall -Werror -Wextra -o test_ex05_ft_show_tab

build-sample: compile
	-./test_ex00 > result_sample_ex00.txt
	-./test_ex01 > result_sample_ex01.txt
	-./test_ex02 > result_sample_ex02.txt
	-./test_ex03 > result_sample_ex03.txt
	-./test_ex04_ft_strs_to_tab > result_sample_ex04_ft_strs_to_tab.txt
	-./test_ex05_ft_show_tab > result_sample_ex05_ft_show_tab.txt

run:	compile
	-./test_ex00 > result_current_ex00.txt
	-./test_ex01 > result_current_ex01.txt
	-./test_ex02 > result_current_ex02.txt
	-./test_ex03 > result_current_ex03.txt
	-./test_ex04_ft_strs_to_tab > result_current_ex04_ft_strs_to_tab.txt
	-./test_ex05_ft_show_tab > result_current_ex05_ft_show_tab.txt

all:	norminette	compile run

test:	all
	-diff result_current_ex00.txt result_sample_ex00.txt
	-diff result_current_ex01.txt result_sample_ex01.txt
	-diff result_current_ex02.txt result_sample_ex02.txt
	-diff result_current_ex03.txt result_sample_ex03.txt
#		-diff result_current_ex04_${EX04}.txt result_sample_ex04_${EX04}.txt
#		-diff result_current_ex05_${EX05}.txt result_sample_ex05_${EX05}.txt

clean:
	-rm -rf */*.out
	-rm -rf result_current_ex*.txt
	-rm test_ex00
	-rm test_ex01
	-rm test_ex02
	-rm test_ex03
	-rm test_ex04_ft_strs_to_tab
	-rm test_ex05_ft_show_tab

clean-sample:
	-rm -rf result_sample_ex*.txt

clean-before-push-with-sample: clean
	-git add .
	-git commit -m "Build Sample Complete"
	-git push origin master

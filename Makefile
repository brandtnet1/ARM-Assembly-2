all:
	gcc -o problem1 problem1.s -Wall -Werror -I .
	gcc -o problem2 problem2.s -Wall -Werror -I .
	gcc -o problem3 problem3.s -Wall -Werror -I .


clean:
	rm problem1
	rm problem2
	rm problem3


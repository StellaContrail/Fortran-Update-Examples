call-fortran-from-c : binding-c.o binding-fortran.o
	gcc -o call-fortran-from-c binding-c.o binding-fortran.o -lgfortran
binding-c.o : binding-c.c
	gcc -c binding-c.c
binding-fortran.o : binding-fortran.f03
	gfortran -c binding-fortran.f03

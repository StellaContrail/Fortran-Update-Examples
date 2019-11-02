call-c-from-fortran : binding-c.o binding-fortran.o
	gfortran -o call-c-from-fortran binding-c.o binding-fortran.o
binding-fortran.o : binding-fortran.f03
	gfortran -ffree-form -c binding-fortran.f03
binding-c.o : binding-c.c
	gcc -c binding-c.c

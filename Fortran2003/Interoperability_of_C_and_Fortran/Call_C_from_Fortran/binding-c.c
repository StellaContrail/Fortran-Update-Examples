// Definitions of procedures to be called from Fortran

// The trailing underscore at the end of the procedure name is necessary when being called/calling in C (Some compilers do this automatically)
#include <stdio.h>

int multiply_fortran_(int *x, int *y)
{
    printf("multiply_fortran is called");
    return (*x) * (*y);
}
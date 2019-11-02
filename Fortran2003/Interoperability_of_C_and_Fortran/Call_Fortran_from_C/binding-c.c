// This example shows how to call a Fortran function/subroutine externally.
// - Fortran methods are always called by reference from C
// - The trailing underscore at the end of the procedure name is necessary(must be) when being called/calling in C (Some compilers do this automatically)
#include <stdio.h>

// Declaration of prototype of the Fortran procedure.
// Parameters of called Fortran procedures must be reference
int multiply_fortran_(int *, int *);

int main(void)
{
    int x, y;
    x = 2;
    y = 3;

    // Call Fortran method from C
    // Note the trailing underscore is necessary when being called/calling in C
    printf("%d", multiply_fortran_(&x, &y));

    return 0;
}
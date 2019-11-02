! This example shows how to call C methods externally.
! - C methods are called either by reference/value from Fortran
!-  The trailing underscore is not needed(must not be) in Fortran
program main
    use iso_c_binding
    ! Since procedure defined in C is undefined in Fortran, implicit none will cause compile error
    integer(c_int) :: x, y
    x = 2
    y = 3

    ! Call C method from Fortran
    ! Note the trailing underscore is not necessary(must not be) at the end of the procedure name
    write (*, *) multiply_fortran(x, y)
end program main
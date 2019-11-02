! Definitions of procedures to be called from C
! You don't have to write program main~end program in here
! since this is no more than definitions of procedures

! The trailing underscore is not necessary in Fortran
integer(c_int) function multiply_fortran(x, y)
    use iso_c_binding
    implicit none
    integer(c_int),intent(in) :: x, y

    write (*, *) "multiply_fortran is called"
    write (*, *) x * y
end function multiply_fortran
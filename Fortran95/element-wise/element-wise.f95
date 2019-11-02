program main
    implicit none
    integer x(2, 3), y(2, 3), ans(2,3)
    integer i, j
    ! Forall statement is used to substitute values into the arrays
    ! Forall statement does parallel manipulation
    ! Threfore, the substitute codes inside the Forall statement should be element-indenpendent (Order of substitution should be not concerned)
    ! Note that Forall statement substitution is done by line by line, so each line should be independent with each other
    forall (i=1:2, j=1:3)
        x(i,j)=i*j
        y(i,j)=2
    end forall
    write (*, *) "X="
    write (*, *) x(1,:)
    write (*, *) x(2,:)
    write (*, *) "Y="
    write (*, *) y(1,:)
    write (*, *) y(2,:)
    ans = multiply(x, y)
    write (*, *) "X .* Y="
    write (*, *) ans(1, :)
    write (*, *) ans(2, :)
contains
    ! Elemental function manipulates so-called elemental-wise calculation
    ! Since Fortran2013 elemental function should not necessarily be pure function
    ! When function is associated with Elemental attribute, calculation defined by the function adapt to its elemental-wise calculation
    ! User doesn't have to make any extra effort to implement elemental-wise calculation other than the normal scaler calculation
    pure elemental function multiply(a, b) result(c)
        integer,intent(in) :: a, b
        integer c
        c = a * b
    end function
end program main
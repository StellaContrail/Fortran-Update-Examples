program main
    implicit none
    type T
        integer a, b
    end type
    type(T) obj
    obj%a = 2
    obj%b = 3
    ! Type of the associated variable are guessed by the right-hand side of the expression
    associate(temp => 3, plus => obj%a+obj%b)
        write (*, *) temp
        write (*, *) plus
    end associate
end program
program main
    implicit none
    integer temp
    write (*, *) multiply(2)
contains
    ! Pure function works if dummy variables are only readable objects
    pure function multiply(a) result(b)
        integer,intent(in) :: a
        integer b
        b = a * 2
    end function
    ! Pure function doesn't work when it accesses beyond the limitation of local variables
    pure function divide(a) result(b)
        integer,intent(in) :: a
        integer b
        temp = 2
        b = a / 2
    end function
    ! Pure function can not have any IO statements because it can be regarded as accessing the outside of the pure function
    pure subroutine output()
        write (*, *) "test"
    end subroutine
end program
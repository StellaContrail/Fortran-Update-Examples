! PROCEDURE is used to bind a procedure variable with a procedure.
! The procedure defined by the procedure variable must be inside of INTERFACE or MODULE
! NOTE : Procedure has implicitly "pass" attribute which means when it's called, it passes the referenced object to the procedure.
module procedureModule
    type methods
        integer property
        ! Procedure Pointer is used to define a pointer associated with the same parameters of given procedure name (in this case "multiply")
        procedure(multiply),pointer :: p
    contains
        procedure :: manipulate => plus
        procedure :: fetchAnswer ! => func2
    end type
contains
    subroutine plus(this, a, b)
        class(methods),intent(inout) :: this
        integer,intent(in) :: a, b
        this%property = a + b
    end subroutine
    subroutine multiply(this, a, b)
        class(methods),intent(inout) :: this
        integer,intent(in) :: a, b
        this%property = a * b
    end subroutine
    integer function fetchAnswer(this)
        class(methods),intent(inout) :: this
        fetchAnswer = this%property
    end function
end module

program main
    use procedureModule
    implicit none
    type(methods) obj

    call obj%manipulate(1, 2)
    write (*, *) obj%fetchAnswer()
    obj%p => multiply
    call obj%p(2, 3)
    write (*, *) obj%fetchAnswer()
    obj%p => plus   ! procedure which has the same interface with multiply subroutine can be applied to procedure pointer p
    call obj%p(2, 3)
    write (*, *) obj%fetchAnswer()
end program
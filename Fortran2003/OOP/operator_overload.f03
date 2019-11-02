! Using GENERIC and PROCEDURE, user can implement "Operator Overload"
! In this example, the most basic operations (add, subtract, assignment) for 3 dimensional vectors are defined.
! Also, there's an example of constructor and destructor used mainly in OOP. 
module operator_overload
    implicit none
    type vector3
        integer x, y, z
    contains
        ! CONSTRUCTOR
        ! procedure :: <TYPE NAME> => <CONSTRUCTOR PROCEDURE NAME>
        procedure :: vector3 => constructor
        ! OPERATOR OVERLOAD
        procedure :: minus, plus, assign_vector
        generic :: operator(-) => minus
        generic :: operator(+) => plus
        ! ASSIGNMENT(=) is exceptional when it comes to defining overload
        generic :: assignment(=) => assign_vector
        ! DESTRUCTOR
        ! final :: <FINALIZE PROCEDURE NAME>
        final :: destructor
    end type
contains
    subroutine constructor(this, a, b, c)
        class(vector3) this
        integer a, b, c
        this%x = a
        this%y = b
        this%z = c
    end subroutine
    subroutine destructor(this)
        type(vector3) this
        write (*, *) "Destroyed   -> ", this
    end subroutine
    function minus(v, w) result(ans)
        class(vector3),intent(in) :: v, w
        type(vector3) ans   ! Return value must have specific type, not polymorphic type (class)
        ans%x = v%x - w%x
        ans%y = v%y - w%y
        ans%z = v%z - w%z
    end function
    function plus(v, w) result(ans)
        class(vector3),intent(in) :: v, w
        type(vector3) ans
        ans%x = v%x + w%x
        ans%y = v%y + w%y
        ans%z = v%z + w%z
    end function
    subroutine assign_vector(v, w)
        class(vector3),intent(out) :: v
        class(vector3),intent(in) :: w
        v%x = w%x
        v%y = w%y
        v%z = w%z
    end subroutine
end module

program main
    ! You can also rename the user-defined operator (not the intrinsic ones such as =, .or., .and., ...)
    ! In order to rename the operators, define it like "use <module name>, operator(<operator new name>) => operator(<operator old name>)"
    use operator_overload
    implicit none
    type(vector3) a, b
    a = vector3(1, 2, 3)
    write (*, *) "Substituted -> ", a
    b = vector3(4, 5, 6)
    write (*, *) "Substituted -> ", b
    write (*, *)

    write (*, *) "a - b = ", a - b
    write (*, *) "b - a = ", b - a
    write (*, *) "a + b = ", a + b
    
end program
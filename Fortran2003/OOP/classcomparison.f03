! Intrinsic functions, SAME_TYPE_AS and EXTENDS_TYPE_OF are NON-RECOMMENDED functions.
! User should NOT use these functions regularly.
! The reason why this is not recommemded is if a compared pair is type of TYPE(*), the function always returns TRUE no matter what.
! User should rather use SELECT TYPE instead.
program main
    implicit none
    type super_class
        integer super
    end type
    type,extends(super_class) :: sub_class
        integer sub
    end type

    type(super_class) super_object
    type(super_class) super_object2
    type(sub_class) sub_object

    write (*, '(A)', advance='no') "Are classes of SuperObject and SuperObject2 the same?        : "
    write (*, *) SAME_TYPE_AS(super_object, super_object2)
    write (*, '(A)', advance='no') "Are classes of SuperObject and SubObject the same?           : "
    write (*, *) SAME_TYPE_AS(super_object, sub_object)
    write (*, *)

    write (*, '(A)', advance='no') "Is the ancestor of SuperObject the same of SuperObject2's?   : "
    write (*, *) EXTENDS_TYPE_OF(super_object, super_object2)
    write (*, '(A)', advance='no') "Is the ancestor of SuperObject the same of SubObject's?      : "
    write (*, *) EXTENDS_TYPE_OF(sub_object, super_object)
end program
! When allocating a pointer or a allocatable unlimited polymophic class variable, user can specify a class to define as
program main
    implicit none
    type super_class
        integer super
    end type
    type,extends(super_class) :: sub_class
        integer sub
    end type
    ! Allocated variable should be either a pointer or allocatable.
    class(super_class),pointer :: a(:)
    class(*),allocatable :: temp(:)
    write (*, *) "Pointer declared"
    allocate(sub_class::a(100))
    write (*, *) "Allocated memory to the pointer with the instance of sub_class"
    select type (x => a)
        type is (sub_class)
            write (*, *) "TYPE(a) is sub_class"
    end select
    call genericVariable()
    ! Cloning
    ! Make a duplicate copy "temp" from the variable "a"
    allocate(temp, source=a)
contains
    ! Intrinsic assignment into polymophic variables is allowed
    ! CAUTION : In gFortran 4.8.4, which is included in the present (2019) software package of Ubuntu, this is NOT allowed.
    subroutine genericVariable()
        class(*),allocatable :: b
        allocate(integer::b)
        b = 5
        select type (b)
            type is (integer)
                write (*, *) "a = ", b
        end select
    end subroutine
end program
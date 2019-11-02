! CLASS(*) : Unlimited Polymorhismic Class. This Class can have any TYPE(some_class)
program main
    implicit none
    ! Definition of TYPE structures
    type super_class
        integer super
    end type
    type,extends(super_class) :: sub_class
        integer sub
    end type
    ! Definition of variables using user-made type structures
    type(super_class) superObject
    type(sub_class) subObject
    ! Initializing the variables
    superObject = super_class(1)
    subObject = sub_class(2, 3)
    write (*, *) fetchSuper(superObject)
    write (*, *) fetchSuper(subObject)
contains
    integer function fetchSuper(obj)
        class(*) obj
        ! User must use SELECT TYPE construct to use any members of obj
        ! This is because obj can be any type of class i.e. obj may not be even TYPE(super_class)
        select type (obj)
            class is (super_class)
                fetchSuper = obj%super
        end select
    end function
end program
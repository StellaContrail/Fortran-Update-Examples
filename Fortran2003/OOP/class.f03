! Class keyword is used to define a variable compatible with polymorphism
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
        class(super_class) obj
        ! obj%sub cannot be used since obj variable may doesn't have a member of sub.
        ! user can avoid this problem by using SELECT TYPE construct.
        fetchSuper = obj%super
    end function
end program
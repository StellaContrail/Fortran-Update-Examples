! Select Type is used to specify which class the given parameter is.
! User can now be able to specify the member of given sub class using SELECT TYPE construct.
! This can be done because SELECT TYPE construct specify only one type of class.
program main
    implicit none
    ! Definition of TYPE structures
    type super_class
        integer super
    end type
    type,extends(super_class) :: sub_class1
        integer sub
    end type
    type,extends(super_class) :: sub_class2
        integer sub
    end type
    type,extends(super_class) :: sub_class3
        integer sub
    end type
    ! Definition of variables using user-made type structures
    type(super_class) superObject
    type(sub_class1) subObject1
    type(sub_class2) subObject2
    type(sub_class3) subObject3
    ! Initializing the variables
    superObject = super_class(0)
    subObject1 = sub_class1(1, 4)
    subObject2 = sub_class2(2, 5)
    subObject3 = sub_class3(3, 6)
    write (*, *) "SelectType Method ( SuperClass )"
    call selectType(superObject)
    write (*, *) "SelectType Method ( SubClass 1 )"
    call selectType(subObject1)
    write (*, *) "SelectType Method ( SubClass 2 )"
    call selectType(subObject2)
    write (*, *)
    ! [ OUTPUT ]
    ! SelectType Method ( SuperClass )
    ! Super :            0  Sub : None
    ! SelectType Method ( SubClass 1 )
    ! Super :            1  Sub :            4
    ! SelectType Method ( SubClass 2 )
    ! Super :            2  Sub :            5


    write (*, *) "SelectClass Method ( SuperClass )"
    call selectClass(superObject)
    write (*, *) "SelectClass Method ( SubClass 1 )"
    call selectClass(subObject1)
    write (*, *) "SelectClass Method ( SubClass 2 )"
    call selectClass(subObject2)
    ! [ OUTPUT ]
    ! SelectClass Method ( SuperClass )
    ! Super :            0  Sub : None
    ! SelectClass Method ( SubClass 1 )
    ! Super :            1  Sub : None
    ! SelectClass Method ( SubClass 2 )
    ! Super :            2  Sub :            5
contains
    ! TYPE IS context is called only if given x is exactly specified TYPE(some_class)
    subroutine selectType(obj)
        class(super_class) obj
        select type (x => obj)
            type is (super_class)
                write (*, *) "Super : ", x%super, " Sub : None"
            type is (sub_class1)
                write (*, *) "Super : ", x%super, " Sub : ", x%sub
            type is (sub_class2)
                write (*, *) "Super : ", x%super, " Sub : ", x%sub
            type is (sub_class3)
                write (*, *) "Super : ", x%super, " Sub : ", x%sub
        end select
    end subroutine
    ! CLASS IS context is called if given x is (exactly)/(derived of) specified TYPE(some_class)
    ! NOTE : In SELECT TYPE construct, stricter statement has priority when selecting of which given parameter's class derived.
    !        For instance, in this selectClass subroutine below, if x is TYPE(sub_class2), the second statement (which is CLASS IS (sub_class2)) is called
    !        even though there's another statement that may be called, in this context, more specifically, CLASS IS (super_class)
    subroutine selectClass(obj)
        class(super_class) obj
        select type (x => obj)
            class is (super_class)
                write (*, *) "Super : ", x%super, " Sub : None"
            ! class is (sub_class1) is skipped on purpose
            class is (sub_class2)
                write (*, *) "Super : ", x%super, " Sub : ", x%sub
            class is (sub_class3)
                write (*, *) "Super : ", x%super, " Sub : ", x%sub
            ! CLASS DEFAULT is called when there's no class to select for
            class default
                write (*, *) "Other class"
        end select
    end subroutine
end program
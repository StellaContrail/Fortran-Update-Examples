! ABSTRACT attribute is the key to implement override in Fortran
! To implement override in Fortran, you have to...
! - Implement type construct (class in other programming language) with abstract attribute
! - Implement interface of procedures which are going to be overridden
! - Define overridden procedures in your abstract type construct with the specific interface and deferred attiribute
! - Implement the procedures to override the abstract procedure
module override
    implicit none
    ! This is abstract TYPE construct. Often called as abstract class in other programming languages.
    type,abstract :: gorakubu
    contains
        ! Define procedures to be overridden. These procedures have to have deferred attirbute
        procedure(IHello),deferred :: hello
    end type

    ! This is interface to apply to the overridden procedures in abstract TYPE construct.
    abstract interface
        subroutine IHello(this)
            ! import to import TYPE construct information, otherwise it fails to define the class/type
            import gorakubu
            class(gorakubu),intent(inout) :: this
        end subroutine
    end interface

    ! These TYPE constructs and procedures are the implementation of bindings with abstract TYPE construct
    ! For Kyoko
    type,extends(gorakubu) :: Kyoko
    contains
        procedure :: hello => hello_Kyoko
    end type
    ! For Yui
    type,extends(gorakubu) :: Yui
    contains
        procedure :: hello => hello_Yui
    end type
    ! For Chinatsu
    type,extends(gorakubu) :: Chinatsu
    contains
        procedure :: hello => hello_Chinatsu
    end type

contains
    ! These procedures are the implementation for abstruct TYPE construct
    ! For Kyoko
    subroutine hello_Kyoko(this)
        class(kyoko),intent(inout) :: this
        write (*, *) "I'm Kyōko Toshinō!"
    end subroutine
    ! For Yui
    subroutine hello_Yui(this)
        class(yui),intent(inout) :: this
        write (*, *) "I'm Yui Funami!"
    end subroutine
    ! For Chinatsu
    subroutine hello_Chinatsu(this)
        class(chinatsu),intent(inout) :: this
        write (*, *) "I'm Chinatsu Yoshikawa!"
    end subroutine
end module

program main
    use override
    implicit none
    ! Abstract procedure/TYPE construct can not be declared since it doesn't have any content in it
    type(Kyoko) kyoko_obj
    type(Yui) yui_obj
    type(Chinatsu) chinatsu_obj
    ! The implementation of called procedure is selected by the type of instances.
    call kyoko_obj%hello()
    call yui_obj%hello()
    call chinatsu_obj%hello()
end program
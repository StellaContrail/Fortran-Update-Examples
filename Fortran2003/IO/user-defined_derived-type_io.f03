! User-Defined Derived-Type I/O
! By default, when an type construct is in a formatted READ/WRITE statement, it is treated as if all of its components were specified in its definition order.
! On the other hand, when an type construct is in a unformatted READ/WRITE statement, it is treated as if it were a single value in a processer-dependent form.
! This examples shows user-defined derived-type I/O which replaces the default I/O processing with an user-defined I/O procedure for the derived-type construct.
! User can specify a procedure for each of the READ/WRITE statements with either formatted/unformatted mode.

module ud_types
    implicit none
    ! Declaration of derived-type construct
    type ud_type
        integer :: a, b
    contains
        ! User-defined derived-type I/O procedures bindings
        procedure :: ud_read
        generic :: read(formatted) => ud_read
    end type

    ! You can also bind the procedures with interface
    interface write(formatted)
        module procedure ud_write
    end interface

contains
    ! The implementation of user-defined derived-type I/O procedures
    subroutine ud_read(dtv, unit, iotype, v_list, iostat, iomsg)
        class(ud_type),intent(inout)  :: dtv        ! read input is saved into dtv which has type of ud_type
        integer,intent(in)            :: unit       ! unit number
        character(*),intent(in)       :: iotype     ! specify written data format ('LISTDIRECTED'/'NAMELIST'/character-literal of 'DT')
        integer,intent(in)            :: v_list(:)  ! specification of DT edit descriptor e.g. 'DT"test"(0)' -> character-liratel = "test", v_list(1) = 0
        integer,intent(out)           :: iostat     ! iostat=0 : Success, iostat<0 : Failure
        character(*),intent(inout)    :: iomsg      ! failure explanation when iostat<0, leave it when iostat=0

        read (unit, fmt=*, iostat=iostat, iomsg=iomsg) dtv%a, dtv%b
    end subroutine

    subroutine ud_write(dtv, unit, iotype, v_list, iostat, iomsg)
        class(ud_type),intent(in)  :: dtv           ! Note that in write procedure, dtv should be set to intent(in) only.
        integer,intent(in)         :: unit
        character(*),intent(in)    :: iotype
        integer,intent(in)         :: v_list(:)
        integer,intent(out)        :: iostat
        character(*),intent(inout) :: iomsg
        
        write (unit, fmt='(*(I0, x))', iostat=iostat, iomsg=iomsg) dtv%a, dtv%b
    end subroutine
end module

program main
    use ud_types
    implicit none
    type(ud_type) obj, obj_copy
    obj%a = 2
    obj%b = 3

    open(10, file="test.txt", form="formatted")
    ! DT edit descriptor indicates that the data is derived-type construct.
    write(10, fmt='(DT)') obj
    close(10)
    open(11, file="test.txt", form="formatted")
    read(11, fmt='(DT)', advance='no') obj_copy
    close(11)
    write (*, '(DT)') obj_copy
end program
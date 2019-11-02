! GENERIC is used to define so-called overload.
! The most suitable procedure with the exact given parameters would be called when the generic name is called.
module generic
    implicit none
    type object
    contains
        ! NOPASS keyword is meant not to pass over the information of the referenced object. See procedure.f03
        procedure,nopass :: output_none, output_int, output_real
        generic :: output => output_none, output_int, output_real
    end type
contains
    subroutine output_none()
        write (*, *) "NONE"
    end subroutine
    subroutine output_int(x)
        integer,intent(in) :: x
        write (*, *) "INTEGER"
    end subroutine
    subroutine output_real(x)
        double precision,intent(in) :: x
        write (*, *) "DOUBLE PRECISION (REAL)"
    end subroutine
end module

program main
    use generic
    implicit none
    type(object) obj

    call obj%output()
    call obj%output(1)
    call obj%output(1d0)
end program
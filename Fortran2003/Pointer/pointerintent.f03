program main
    implicit none
    integer,target :: a
    integer,pointer :: p
    p => a
    call proc(p)
    write (*, *) a
contains
    subroutine proc(p_)
        integer,pointer,intent(in) :: p_
        ! Even though pointer p_ is defined as intent(in), you can substitute value into p_
        ! This means for pointer, intent(in) only means the pointer is readonly for "pointer" substituion
        ! Therefore, you cannot assign an address to a pointer with an attibute of intent(in)
        ! [ERROR]:p => <Some variable (including NULL())>
        p_ = 3
    end subroutine
end program
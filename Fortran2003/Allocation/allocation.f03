! Allocatable (dummy) variables now instinctively easy to understand how they work.
! Same manipulation can be done for a scaler variable ( CLASS(*) / Cloning / etc.. ).
! Using automatic allocation feature, user can implement any-size character variable like a string.
! e.g. character(:),allocatable :: string
program main
    implicit none
    integer,allocatable :: a(:), b(:)
    allocate(a(3))
    a = (/1, 2, 3/)
    ! Before the substituion, only a is allocated
    write (*, *) "Before Substitution : "
    write (*, *) "a = ", a
    write (*, *) "b = ", b
    write (*, *) "If Allocated(a) = ", allocated(a)
    write (*, *) "If Allocated(b) = ", allocated(b)
    write (*, *)
    b = a
    ! However, after the substituion, b is automatically allocated and resized to be substituted by a
    write (*, *) "After Substitution : "
    write (*, *) "a = ", a
    write (*, *) "b = ", b
    write (*, *) "If Allocated(a) = ", allocated(a)
    write (*, *) "If Allocated(b) = ", allocated(b)
    write (*, *)
    ! instinct subroutine move_alloc literally moves one allocatable variable into another, not copy.
    ! Notice by copying, b (source) is deallocated and a (target) is automatically allocated and substituted
    call move_alloc(b, a)
    write (*, *) "After move_alloc(from=b, to=a): "
    write (*, *) "a = ", a
    write (*, *) "b = ", b
    write (*, *) "If Allocated(a) = ", allocated(a)
    write (*, *) "If Allocated(b) = ", allocated(b)
    write (*, *)
    ! copy is user-made subroutine which copies a to b
    ! this example shows dummy variable can be also automatically allocated and resized to be substituted
    call copy(a, b)
    write (*, *) "After copy(from=a, to=b) : "
    write (*, *) "a = ", a
    write (*, *) "b = ", b
    write (*, *) "If Allocated(a) = ", allocated(a)
    write (*, *) "If Allocated(b) = ", allocated(b)
    write (*, *)
    ! It seems like a pieace of cake manipulation, but things get weirder when element-by-element substitution is executed...
    ! To make things clear, first deallocate a and b
    deallocate(a, b)
    a(:) = (/1, 2, 3/)
    b = (/1, 2, 3, 4/)
    ! a = b,b = a,a(:) = b(:) or b(:) = a(:) [ERROR]:Using element-wise substitution (:), size of a is determined.
contains
    subroutine copy(from, to)
        integer,allocatable :: from(:), to(:)
        to = from
    end subroutine
end program
! You can map the elements of an array onto an another pointer array which has different ranks
! This operation doesn't including substituion, which means it doesn't take so long to execute.
program main
    implicit none
    integer,target :: a(1:9)
    integer,pointer :: b(:,:)
    integer i
    a = (/(i,i=1,9)/)
    ! Mapping
    b(1:3,1:3) => a(:)
    write (*, *) "a = "
    write (*, *) a
    write (*, *)
    write (*, *) "b = "
    do i = 1, 3
        write (*, *) b(i, :)
    end do
end program
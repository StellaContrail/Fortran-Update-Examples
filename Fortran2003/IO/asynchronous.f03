! Asynchronous keyword in Fortran enables other statements to execute while an I/O statement is executing.
program main
    implicit none
    integer i
    integer :: nums(1:65535) = (/(i, i=1, 65535)/)
    logical pending
    ! If you want to use asynchronous operation, first specify asynchronous="YES" keyward in your open statement.
    open(10, file="test.txt", asynchronous="yes")
    ! And then use also asnchronous="YES" keyword in each READ and WRITE statement.
    write (*, *) "I/O process started"
    write (10, '(*(I0, /))', asynchronous="yes") nums
    ! You can get a status of whether asynchronous I/O process is over or not by specifying pending keyword
    inquire(10, pending=pending)
    write (*, *) pending
    do i = 1, 3
        call sleep(1)
        inquire(10, pending=pending)
        write (*, *) pending
    end do
    ! You can wait until the asynchronous I/O process is over
    wait(10)
    ! Close the asynchronous I/O unit
    close(10)
end program
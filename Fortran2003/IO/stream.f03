! ACCESS="STREAM" Mode enables to open file with no information of data length
! When this is applied, data length is automatically specified when program writes/reads to/from file
program main
    implicit none
    integer :: a = 1
    integer recl
    double precision :: b = 2d0
    character(len=14) :: string = "Hello, World!"
    ! Open a file with STREAM Access Mode
    open(10, file = "streamaccess.txt", form="formatted", access="stream")
    ! Open a file with SEQUENTIAL Access Mode
    open(11, file = "sequentialaccess.txt", form="formatted", access="sequential")
    ! Write multiple data using STREAM Access Mode
    write (10, *) a, b, string
    ! Inquire about size of the data size when opened file with SEQUENTIAL Access Mode
    inquire(11, recl=recl)
    ! Close all used units
    close(10)
    close(11)
    ! Write out the default data size allocated when a file is opened with SEQUENTIAL Access mode
    write (*, *) recl
end program
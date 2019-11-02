! Fortran can write/read binary data since version of 2003
! The form attribute with "UNFORMATTED" is the key to manipulate IO in binary
program main
    implicit none
    integer a, b, c, d
    character(:),allocatable :: string
    character(:),allocatable :: output
    a = 2
    b = 3
    string = "Hello, World!"
    allocate(character(len=len(string)) :: output)

    open(10, file="test.bin", form="unformatted", access="stream", status="replace")
    write (10) a, b, string
    close(10)

    open(11, file="test.bin", form="unformatted", access="stream", status="old")
    read (11) c, d, output
    close(11)

    write (*, *) c, d, output
end program
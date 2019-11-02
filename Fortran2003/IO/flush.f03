! Flush statement specifies a file which other program wants to use OR you want to read a file which other program is using
program main
    implicit none
    open(10, file="test.txt")
    write (10, *) "This is flush test"
    flush(10)
    close(10)
end program
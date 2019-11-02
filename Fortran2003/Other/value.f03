! Value keyword is used to give variables to procedures by value
! There's also Volatile keyword, which indicates the variable can be changed by external programs
program main
    implicit none
    integer num
    num = 3
    write (*, *) num, " in main"
    call refer_procedure(num)
    write (*, *) num, " in main"
    call value_procedure(num)
    write (*, *) num, " in main"
contains
    subroutine refer_procedure(a)
        integer a
        a = 1
        write (*, *) a, " in refer_procedure"
    end subroutine
    subroutine value_procedure(a)
        integer,value :: a
        a = 2
        write (*, *) a, " in value_procedure"
    end subroutine
end program
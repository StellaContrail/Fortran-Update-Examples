program main
    implicit none
    integer i
    integer x(3)
    ! DO CONCURRENT statement is a limited version of do statement
    ! The calculation inside the DO CONCURRENT statement should be independent of loop order.
    ! Unlike FORALL statement, do concurrent handles each loop as one block, so lines should be not necessarily independent
    ! As same with forall, DO CONCURRENT statement behaves parallelly.
    do concurrent (i = 1:3)
        ! Block statement is used to define a scope for variables
        ! In this example, integer a can be alive only inside this block
        ! This statement shows an effect especially when using DO CONCURRENT statement
        ! It's because DO CONCURRENT statement has to handle each loop as independent, which also means variables inside the do concurrent should be also independent of each thread
        block
            integer a
            a = i * 2
            x(i) = a
        end block
    end do
    write (*, *) x
end program
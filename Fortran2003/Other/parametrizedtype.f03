! You can implement more generic TYPE construct with parametrized TYPE construct
program main
    implicit none
    ! Parameterized TYPE Construct
    ! kind and size can be specified when the TYPE construct declared.
    type matrix(kind, n, m)
        ! Properties of this TYPE construct
        integer,kind :: kind = kind(0e0)
        integer,len  :: n, m
        ! Data contents of this TYPE construct using the above properties
        real(kind)   :: A(1:n, 1:m) 
    end type
    ! Declaration of the user-made parametrized TYPE construct
    type(matrix(kind(0e0), row_size, column_size)) Obj
    ! You can omit the parameters which have been initialized in the TYPE construct
    type(matrix(n=row_size, m=column_size)) Obj2
    ! type(matrix) Obj3  [ERROR]:You cannot omit the non-initialized parameter
    ! You can make TYPE construct allocatable and some parameters to be deferred
    ! If you want to use this variable, you are to somehow allocate this varaible specifying the third parameter
    type(matrix(kind(0e0), row_size, :)),allocatable :: Obj4
    ! Other usual variables to use 
    integer i, j
    integer,parameter :: row_size = 5, column_size = 5
    ! Example codes
    do concurrent (i = 1:row_size, j = 1:column_size)
        Obj%A(i, j) = i + j
    end do
    do i = 1, row_size
        write (*, *) Obj%A(i, :)
    end do
contains
    subroutine some_program(a)
        ! Dummy parametrized TYPE construct can be simplified using (*)
        ! This enables to derive parameter information of matrix from the dummy variable
        type(matrix(*)) :: a
    end subroutine
    ! A subroutine which receives only objects whose interface is as same as Obj4
    subroutine some_program2(a)
        type(matrix(*, *, :)) a
        ! type(matrix(*, *, *)) a [ERROR]:The third parameter is deferred, * should be replaced with :
        ! type(matrix(:, *, *)) a [ERROR]:The first parameter is not deferred, : should be replaced with *
    end subroutine
end program
! Intrinsic procesures : command_argument_count(), get_command(), get_command_argument() to get command input data
program main
    implicit none
    integer :: args_num, com_length, com_status
    character(:),allocatable :: command, arg
    integer i, arg_length, arg_status
    ! Returns how many arguments are given
    args_num = command_argument_count()
    ! First get length of command name
    call get_command(length=com_length, status=com_status)
    ! Allocate character variable size to get command name
    allocate(character(len=com_length) :: command)
    ! Re-execute get_command procedure to get command name
    call get_command(command, com_length, com_status)
    ! Output
    write (*, '(2A)') "Command        : ", command          ! Command name and arguments
    write (*, '(A, I0)') "Command Length : ", com_length    ! Length of input command
    write (*, '(A, I0)') "Command Status : ", com_status    ! Status of get_command procedure. -1 if command variable memory is too short, >0 if command is not specified, 0 if success or other problem
    write (*, '(A, I0)') "Argument count : ", args_num      ! Number of arguments
    write (*, *)

    ! Arguments data
    do i = 1, args_num
        ! First get length of argument name
        call get_command_argument(i, length=arg_length, status=arg_status)
        ! Allocate character variable size to get argument name
        allocate(character(len=arg_length) :: arg)
        ! Re-execute get_command_argument procedure to get specified argument name
        call get_command_argument(i, arg(:), arg_length, arg_status)
        ! Output
        write (*, '(A, I0, 2A)') "Arguments[", i, "]    : ", arg
        write (*, '(A, I0)') "Argument Length : ", arg_length
        write (*, '(A, I0)') "Argument Status : ", arg_status
        write (*, *)
        ! Deallocate so that in next loop arg can be allocated
        deallocate(arg)
    end do
end program
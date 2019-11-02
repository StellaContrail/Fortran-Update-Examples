! Intrinsic procedure : get_environment_variable() to get environment variable
program main
    implicit none
    character(:),allocatable :: value               ! environment variable name
    integer                  :: length, status      ! length of the envionment variable name, status of the procedure
    logical                  :: trim_name = .true.  ! whether to trim the environment variable name or not

    call get_environment_variable("USER", length=length, status=status, trim_name=trim_name)
    allocate(character(len=length) :: value)
    call get_environment_variable("USER", value, length, status, trim_name)
    write (*, *) "USER : ", value
end program
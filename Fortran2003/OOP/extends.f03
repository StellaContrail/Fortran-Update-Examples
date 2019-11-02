program main
    implicit none
    type person
        character(len=10) :: name
        integer age
    end type
    ! extends keyword can literally extend extend an existing type variable
    type,extends(person) :: extendedPerson
        integer BMI
    end type
    ! extends keyword can also be used to define another same type variable with empty definition
    type,extends(person) :: person_copy
    end type
    type(extendedPerson) info
    info%name = "Contrail"
    info%age = 21
    info%BMI = 18
    write (*, *) info
end program
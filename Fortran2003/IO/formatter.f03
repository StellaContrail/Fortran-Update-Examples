program main
    implicit none
    write (*, *) "Decimal Format"
    ! DC Format (Decimal = "Comma")
    write (*, '(DC, F0.3, X, A)') 1.234d0, "Yen" 
    ! DP Format (Decimal = "Point")
    write (*, '(DP, F0.3, X, A)') 1.234d0, "Yen"
    ! Scope of DC/DP format
    write (*, '(DC, F0.3, X, F0.3, X, DP, F0.3)') 1.234d0, 1.234d0, 1.234d0
    write (*, *)

    write (*, *) "DELIM Attribute"
    ! DELIM Attribute mode = none
    write (*, *, delim="none") "The quick brown fox jumps over the lazy dog"
    ! DELIM Attribute mode = apostrophe
    write (*, *, delim="apostrophe") "The quick brown fox jumps over the lazy dog"
    ! DELIM Attribute mode = quote
    write (*, *, delim="quote") "The quick brown fox jumps over the lazy dog"
end program
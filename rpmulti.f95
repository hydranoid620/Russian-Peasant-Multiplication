!   Name: Nicholas Rosati
!   Student ID: 1037025
!   Email: nrosati@uoguelph.ca

program rpmulti
    implicit none
    integer*8 :: m, n, input
    integer*8 :: rmultiply, multiply
    
    !Get input
    print *, "Please select which version you want to use:"
    print *, "1. Recursive"
    print *, "2. Non-recursive"
    write(*, '("> ")', advance = 'no');
    read(*, *) input
    write(*, '("Enter the first number: ")', advance = 'no');
    read(*,*) m
    write(*, '("Enter the second number: ")', advance = 'no');
    read(*,*) n
    print *, ""

    if (input == 1) then
        !Calculate recursively
        print *, m, " * ", n, " = ", rmultiply(m, n)
    else if (input == 2) then
        !Calculate non-recursively
        print *, m, " * ", n, " = ", multiply(m, n)
    end if
end

!Recursive method for the calculation
recursive function rmultiply(m, n) result(o)
    integer*8, intent(in) :: m, n
    integer*8 o
    
    !Algorithm as per assignment outline
    if (m == 0) then
        o = 0
        return
    else if (m == 1) then
        o = n
        return
    else if (m > 1 .and. (mod(m, 2) == 0)) then
        o = rmultiply((m / 2), (n + n))
        return
    else if (m > 1 .and. (mod(m, 2) == 1)) then
        o = n + rmultiply((m / 2), (n + n))
        return
    end if
end function rmultiply

!Non-recursive method for the calculation
function multiply(m, n) result(o)
    integer*8, intent(in) :: m, n
    integer*8 o, p, q

    !This makes it so I don't break the "intent(in)" promise
    p = m
    q = n

    if (a == 0) then
        o = 0
        return
    else if (a == 1) then
        o = n
        return
    end if    

    do while (q > 0)
        if (mod(q, 2) .ne. 0) then
            o = o + p
        end if
        
        p = p * 2
        q = q / 2
    end do

    return
end function multiply


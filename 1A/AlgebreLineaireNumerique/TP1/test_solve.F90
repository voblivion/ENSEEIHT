program test_solve
	implicit none

	real :: start, finish
	integer :: i, j, ierr, n
	double precision, allocatable :: L(:,:), x(:), b(:)
	double precision :: relative_error

	write(*,*) 'n?'
	read(*,*) n

	! Initialization: L is spd
	write(*,*) 'Initialization...'
	write(*,*)

	allocate(L(n,n), stat=ierr)
	if(ierr.ne.0) then
		write(*,*)'Could not allocate L(n,n) with n=',n
		stop
	end if

	allocate(x(n), stat=ierr)
	if(ierr.ne.0) then
		write(*,*)'Could not allocate x(n) with n=',n
		stop
	end if

	allocate(b(n), stat=ierr)
	if(ierr.ne.0) then
		write(*,*)'Could not allocate b(n) with n=',n
		stop
	end if

	L = 0.D0
	do i=1,n  
		L(i,i) = n+1D0
		do j=1,i-1
			L(i,j) = 1
		end do
	end do
	b = 1D0
	
	! Left-looking triangular solve of Lx=b
	write(*,*) 'Solving with a left-looking method...'
	call cpu_time(start)
	call left_looking_solve(L,x,b,n)
	call cpu_time(finish)
	write(*,*) 'Time : ', finish-start
	write(*,*) 'Relative error : ', relative_error(L,x,b,n)
	
	! Right-looking triangular solve of Lx=b
	write(*,*) 'Solving with a right-looking method...'
	call cpu_time(start)
	call right_looking_solve(L,x,b,n)
	call cpu_time(finish)
	write(*,*) 'Time : ', finish-start
	write(*,*) 'Relative error : ', relative_error(L,x,b,n)
	
	deallocate(L,x,b)
	
end program test_solve

subroutine left_looking_solve(L,x,b,n)
	implicit none
	
	! Paramètres
	integer, intent(in) :: n
	double precision, intent(in), dimension(n,n) :: L
	double precision, intent(in), dimension(n) :: b
	double precision, intent(out), dimension(n) :: x
	
	! Variables
	integer :: i, j
	
	x = b
	do j=1, n
		do i=1, j-1
			x(j) = x(j) - L(j,i)*x(i)
		end do
		x(j) = x(j) / L(j,j)
	end do
	
	return
	
end subroutine left_looking_solve

subroutine right_looking_solve(L,x,b,n)
	implicit none
	
	! Paramètres
	integer, intent(in) :: n
	double precision, intent(in), dimension(n,n) :: L
	double precision, intent(in), dimension(n) :: b
	double precision, intent(out), dimension(n) :: x
	
	! Variables
	integer :: i, j
	
	x = b
	do j=1, n
		x(j) = x(j) / L(j,j)
		do i=j+1, n
			x(i) = x(i) - L(i,j)*x(j)
		end do
	end do
	
	return
	
end subroutine right_looking_solve

double precision function relative_error(L,x,b,n)
	implicit none
	
	! Paramètres
	integer, intent(in) :: n
	double precision, intent(in), dimension(n,n) :: L
	double precision, intent(in), dimension(n) :: b
	double precision, intent(in), dimension(n) :: x
	
	! Variable
	double precision :: sum_square
	
	relative_error = sqrt(sum_square(matmul(L,x)-b,n)/sum_square(b,n))
	
	return
	
end function relative_error

double precision function sum_square(x,n)
	implicit none
	
	! Paramètres
	integer, intent(in) :: n
	double precision, intent(in), dimension(n) :: x
	
	! Variable
	integer :: i
	
	sum_square = 0.D0
	do i=1, n
		sum_square = sum_square + x(i)*x(i)
	end do
	
	return
end function sum_square
	
	
	
	

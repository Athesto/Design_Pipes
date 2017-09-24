!Instrucciones para correrlo Online
!1) Compile
!2) Execute
!Si no corre, coloca esta linea en Project/Compile Options/Compilation Command 
! -> "printf \\33c; gfortran -std=f2003 *.f90 -o main"
! Y repite los pasos 1) y 2)

program HIDRAULICA
    use messages
    use metodosLineales
    
    implicit none
    real :: x
    !real, external :: test
    
    integer :: selection
    do while (.true.)
       
        print mensajeOpciones
        
        write (*,'(a)',ADVANCE="NO") ">Seleccione una opcion y presione ENTER (1 + ENTER): "
        read(*,*) selection
        !selection = 4; write(*,*) selection

        select case (selection)
        case (1)
            call cTuberiaSimple()
        case (2)
            call pTuberiaSimple()
        case (3)
            call EjemploFriccion()
        case (4)
            call dTuberiaSimple()
        case (0)
            stop;
        
        case default 
            print *, "caso no contemplado"
        end select

    end do
    
    end program HIDRAULICA
    
 
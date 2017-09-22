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

        select case (selection)
        case (1)
            call cTuberiaSimple()
        case (2)
            call pTuberiaSimple()
        case (3)
            call EjemploFriccion()
        case (4)
            call test()
        case (0)
            stop;
        
        case default 
            print *, "caso no contemplado"
        end select

    end do
    
    end program HIDRAULICA
    
    subroutine test
        implicit none
        !Variables dentro de del diagrama de flujo
        real:: Qd, ks, d_delta, H, z2, E, l
        
        !Variables fuera del diagrama
        !!Variables Externas
        real:: Sigma_km,p,u,nu
        
        real, parameter, dimension(3)::d_comercial=(/6,8,12/)
        
        !Leer las variables
        !l=150; ks=0.00015;Qd=0.12; H=2.2;Sigma_km=0.5+0.8+10*0.1+1; H=4 d_delta=3; z2=5; E=6; 
        
    end subroutine test
    
   
    
    
    
    

 
    
   





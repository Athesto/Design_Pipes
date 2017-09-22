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
        !read(*,*) selection
        selection = 4; write(*,*) selection

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
    
    subroutine dTuberiaSimple
        implicit none
        !Variables dentro de del diagrama de flujo
        !!Variables Externas
        real:: Qd, ks, d_delta, H, z2, l
        !!Variables Internas
        real:: hs, v,d,Q,Hfi
        integer ::j= 0
        real, parameter, dimension(3)::d_comercial=(/6,8,12/)
        
        !Variables fuera del diagrama
        !!Variables Externas
        real:: Sigma_km,p,u,nu
        !!Variables internas
        real:: Hfi_1
        integer:: k,i
        real, parameter :: pi = 4 * atan (1.0), g = 9.81, p_agua = 999.1, E = 1.0E-8
        
        
        
        print *, char(10),"         <<<<1: disenio de tuberia simple>>>>",char(10) 
        
        
        
        !Leer las variables
        l=17; ks=0.00015;Qd=0.12; H=2.2;Sigma_km=0.5+0.8+10*0.1+1; H=4; d_delta=0.001; z2=5; nu = 1.17E-6
        
        !Suponer hs = H-z2
        hs= H-z2
        
        !Suponer d pequeño
        d=1E-8
        
        !Loop
        do i = 0, 20, 1
            !Calcular velocidad ec 2.3
            v = cal_vi(ks,nu,g,d,hs)

            !Calcular Q
            Q=v*pi/4 * d ** 2
            if (Q < Qd) then
                if (d>=d_comercial(j)*0.0254)then
                    j=j+1
                else
                    d=d+d_delta 
                endif
                cycle
            endif
            
            do k = 0, 20, 1
                Hfi_1 = cal_hfi_1(Hfi,z2,Sigma_km,v,g)

                if (abs(Hfi_1 - Hfi)>E) then
                    Q=v*pi/4 * d ** 2
                else
                    exit
                end if
            end do
            
            if (Q < Qd) then
                if (d>=d_comercial(j)*0.0254)then
                    j=j+1
                else
                    d=d+d_delta 
                endif
                Hfi= Hfi_1-z2
                cycle
            endif
            exit
        
        end do 
        
        
            
        
        
        
        !Respuesta
        write(*,*) "Respuesta: ",d
        read(*,*)
        
        contains
        
        function cal_vi(ks,nu,g,d,hf1) !velocidad ec 2.3
            implicit none
            real :: cal_vi,ks,nu,g,d,hf1

            cal_vi = (2.51 * nu * sqrt(l)) / (d * sqrt(2 * g * d * hf1))
            cal_vi = (ks / (3.7 * d)) + cal_vi
            cal_vi = (-2 * sqrt(2 * g * d * hf1) / sqrt(l)) * log10(cal_vi)

        end function cal_vi



        function cal_hfi_1(H,zy,Sigma_km,vi,g) 
            implicit none
            real ::cal_hfi_1,H,zy,Sigma_km,vi,g
            cal_hfi_1 = H - zy - Sigma_km * ((vi ** 2) / (2 * g))
        end function cal_hfi_1
    end subroutine dTuberiaSimple
    
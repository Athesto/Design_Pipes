subroutine cTuberiaSimple()
    use messages
        implicit none
        !Variables independietes
        real :: d,ks,H,E,Sigma_km,p,nu,zy,l
        
        !Variables dependietes
        real :: hf1,ksd,vi, hfi_1, Q
        integer :: i
        character :: option !es la opción par cambiar los ejemplos (y/n)
        
        !Constantes
        real, parameter :: pi = 4 * atan (1.0), g = 9.81
        
        print *, char(10),"         <<<<1: Comprobacion de disenio de tuberia simple>>>>",char(10)
        
        !Paso 1: Etapa de lectura
        
       
        d=0.293; ks=1.5e-6; H=43.5; E=1e-8; Sigma_km=11.8; p=998.2; nu=1.007e-6; zy=0; l=730 !DEBUG
        print"('Por defecto, se cargaran datos del ejemplo 2.1'/)"
        do i = 1,10
            
        print datosEjercicio1, l,H,d,ks,Sigma_km,p,nu,zy,E   
        
        write(*,'(a)',ADVANCE="NO") "Desea continuar con estos datos (y/n)? "
        read(*,*) option
        if (option == 'y')then            
            exit
        else
            write(*,*) char(10),"introduzca los valores(9) como un vector con el sgte formato: "
            print*,"l, H, d, ks, Sigma_Km, p, nu, z, E"
            read(*,*)l, H, d, ks, Sigma_Km, p, nu, zy, E  !DEBUG
            print*, char(10)
        end if
        end do
            
        
        
        
        !Paso 2: Primera suposicion Suponer hf1
        hf1 = H-zy
        
        
        !Paso 3: Segunda operacion Calcular Ksd
        ksd = ks/d

        
        print"(a6,a18,a12,a15,a18)", "H", "ks/d", "hf1", "v", "hfi_1"
        
        !Paso 4: Inicializar la iteracion
        do i = 1,100
                

        !Paso 4: 1ra subrutina Calcular vi ec 2.3

        vi = cal_vi(ks,nu,g,d,hf1)

        
        !Paso 5: 2da subrutina calcular hfi_1
        hfi_1 = cal_hfi_1(H,zy,Sigma_km,vi,g)
        !print *, "hfi_1 = ", hfi_1, char(10)
        
        !Paso 6: Condicion ERROR
        
        
        print*, H,ksd,hf1,vi,hfi_1
        
        if (abs(hf1 - hfi_1)<E) then
            exit
        else
            hf1 = hfi_1
        end if
        end do
        
        
        !Paso 7: Calcular Q
        Q = vi * pi/4 * d ** 2
        print *, char(10)
        print *, "Q = ", Q, "m3/s"
        print *, "Q = ", Q*1000, "l/s"
        print *, char(10)
        Print *, "FIN"
        read(*,*)
        
        
        
    
    contains
        
    function cal_vi(ks,nu,g,d,hf1)
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
        
    end subroutine cTuberiaSimple
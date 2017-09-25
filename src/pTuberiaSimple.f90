subroutine pTuberiaSimple()
    use metodosLineales
    use messages
    implicit none
    !variables externas
    real:: Q, l, zy, ks, d, Sigma_km, nu
    !Variables externas no en el diagrama
    real:: H, p, E
    
    !variables internas
    integer :: i, Re, selection
    real:: v,Sigma_hm,ksd, f,hf, Pot,A
    character :: option
    !Parametros
    real, parameter :: pi = 4 * atan (1.0), g = 9.81, p_agua = 999.1
    
    
    print *, char(10),"         <<<<2: Potencia de Tuberia Simple>>>>",char(10)
    
    !Etapa de lectura
    Q = 0.042;l=970;zy =16;ks=1.5e-6; d=6*0.0254;Sigma_km=9.4;nu = 1.14e-6
     write(*,*) "Por defecto, se cargaran datos del ejemplo 2.2",char(10)
        do i = 1,10
         print datosEjercicio2, Q, l, zy, ks, d, Sigma_km, nu
         
        write (*,'(a)',ADVANCE="NO") "Desea continuar con estos datos (y/n)? "
        read(*,*) option
        if (option == 'y')then            
            exit
        else
            write(*,*) char(10),"introduzca los valores(7) como un vector con el sgte formato: "
            print*,"Q, l, zy, ks, d, Sigma_km, nu"
            read(*,*)Q, l, zy, ks, d, Sigma_km, nu  !DEBUG
            print*, char(10)
        end if
        end do
        
        
        !Calcular v, velocidad
         A = pi/4 * d**2
         v = Q /A
        
        !Calcular Sigma_hm, perdidas menores
         Sigma_hm = Sigma_km * ((v ** 2) / (2 * g))
        
        !Calcular Re y ksd
        Re = v * d / nu
        
        ksd = Ks / d
        
        !Calcular f con metodo numerico ecuacion 1.67
        print "(a6,a18,a18,a12,a12)","A","v","Sigma_hm","Re","ksd"
        write(*,*)A,v,Sigma_hm,Re,ksd,char(10)
        
        print *, "1- Newton"
        print *, "2- Newton-Rapson"
        
        do while (.true.)
            write (*,'(a)',ADVANCE="NO") ">Seleccione una opcion y presione ENTER (1 + ENTER): "
            read(*,*) selection
            select case (selection)
                case (1)
                    f= friccion1Pto(ksd,Re,0.001)
                    exit
                case (2)
                    f = friccionNewtonRapshon(ksd,Re,0.001)
                    exit
                case default 
                    print *, "caso no contemplado"
            end select     
        
        end do
        
        
        
        
        !Calcular h con 1.36
         hf = f * (l / d) * ((v ** 2) / (2 * g))
        
        !Calcular Htotal
        H = zy + hf + Sigma_hm
        
        print *, char(10)       
        print "(a6,a18,a12,a12)","f","hf","H"
        write(*,*)f,hf,H,char(10)
        !Potencia
        Pot = p_agua * Q * g * H
        
        !Imprimir
        write(*,*) "P= ",Pot," W"
        write(*,*) "P= ",Pot/1000," kW"
        read(*,*)
        
        
    
    end subroutine pTuberiaSimple
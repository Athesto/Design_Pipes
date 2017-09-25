
    module metodosLineales

    
    
    contains
    
    !-------------------------------------------------------------
    !--------Friccion1Pto-----------------------------------------
    !-------------------------------------------------------------
    function friccion1Pto(ksd, Re,semilla_f)
        implicit none
        !variables externas
        real :: friccion1Pto, ksd, semilla_f
        integer::Re

        !variables internas
        real :: fi, fi_1
        integer :: i

        !parameters
        real, parameter :: E = 1e-8

        if (Re > 2200) then
            fi= semilla_f
            print"(a10,a15,a18,a18)", "fi","x","g(x)","fi_1"

            do i = 1,15

                fi_1 = (-2 * log10((ksd / (3.7)) + (2.51 / (Re * sqrt(fi))))) ** (-2) !ksd es ks/d, por esta razon no esta d en la formula

                print *, fi, 1/sqrt(fi),1/sqrt(fi_1),fi_1
                if (abs(fi - fi_1)<E) then
                    exit
                else
                    fi = fi_1
                end if
            end do

            friccion1Pto = fi    
        else 
            friccion1Pto = 64/Re

        end if
    
    end function friccion1Pto
    
    
    !-------------------------------------------------------------
    !--------friccionNewtonRapshon--------------------------------
    !-------------------------------------------------------------
    function friccionNewtonRapshon(ksd, Re,semilla_f)
        implicit none
        !variables externas
        real :: friccionNewtonRapshon, ksd, semilla_f
        integer::Re

        !variables internas
        real :: fi, xi, xi_1, Fx, dFx
        integer :: i

        !parameters
        real, parameter :: E = 1e-8

        if (Re > 2200) then
            fi = semilla_f
            print"(a10,a15,a18,a18,a18)", "fi","x","x+1","F(x)","dF(x)"
            
            xi = 1/sqrt(fi)

            do i = 1,15

                Fx = -2 * log10((ksd / 3.7) + (2.51 * xi / Re)) !ksd es ks/d, por esta razon no esta d en la formula
                dFx = (-2 / log(10.0)) * (2.51/Re)
                dFx = dFx /((ksd/3.7)+(2.51*xi/Re))
                
                
                xi_1 = xi - (Fx - xi)/(dFx - 1)
                
                print *, fi, xi,xi_1,Fx,dFx
                if (abs(xi - xi_1)<E) then
                    exit
                else
                    xi = xi_1
                end if
            end do

            friccionNewtonRapshon = 1/(xi_1 ** 2)    
        else 
            friccionNewtonRapshon = 64/Re

        end if
    end function
    
    
    !-------------------------------------------------------------
    !--------EjemploFriccion--------------------------------------
    !-------------------------------------------------------------
    subroutine EjemploFriccion()
        use messages
        implicit none 
        real:: f, ksd
        integer:: Re, i, methodSelection
        character :: option !es la opción par cambiar los ejemplos (y/n)
        print mensajeSeleccionFriccion
        
        ksd=0.0001; Re=20000; f=0.001;
        
        print"('Por defecto, se cargaran datos del ejemplo 2.1'/)"
        do i = 1,10
            
        print datosEjercicio3, ksd, Re, f  
        
        write(*,'(a)',ADVANCE="NO") "Desea continuar con estos datos (y/n)? "
        read(*,*) option
        if (option == 'y')then            
            exit
        else
            write(*,*) char(10),"introduzca los valores(3) como un vector con el sgte formato: "
            print*,"ksd, Re, f"
            read(*,*)ksd, Re, f  !DEBUG
            print*, char(10)
        end if
        end do
        do while (.true.)
            print *, ""
            print *, "1: Metodo 1 punto  (Newton)"
            print *, "2: Metodo derivada (Newton Raphson)"
            write(*,'(a)',ADVANCE="NO") "Seleccione una opcion  (1 o 2)? "
            read(*,*) methodSelection

            select case (methodSelection)
                case (1)
                    print *, "Metodo Newton punto: "
                    f = friccion1Pto(ksd,Re,f)
                    print "(/'f= ', es10.3/)", f
                    print *, "FIN"
                    read(*,*)   
                    exit

                case (2)
                    print *, "Metodo NewtonPapshon punto: "
                    f= friccionNewtonRapshon(ksd,Re,f)
                    print "(/'f= ', es10.3/)", f
                    print *, "FIN"
                    read(*,*)
                    exit
                case default
                    print *, "opcion invalida"
            end select
        end do
        
        

    end subroutine EjemploFriccion
    
    end module
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
            print"(a10,a15,a18,a18)", "fi","x","g(x)","fi_1"
            
            xi = 1/sqrt(fi)

            do i = 1,15

                Fx = -2 * log10((ksd / 3.7) + (2.51 * xi / Re)) !ksd es ks/d, por esta razon no esta d en la formula
                dFx = (-2 / log(10.0)) * (2.51/Re)
                dFx = dFx /((ksd/3.7)+(2.51*xi/Re))
                
                
                xi_1 = xi - (Fx - xi)/(dFx - 1)
                
                !print *, fi, 1/sqrt(fi),1/sqrt(fi_1),fi_1
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
        integer:: Re, selection
        print mensajeSeleccionFriccion
        
        ksd=0.0001; Re=20000; f=0.001;
        print datosEjercicio3, ksd, Re, f
        
        
        
        do while (.true.)
            write (*,'(a)',ADVANCE="NO") ">Seleccione una opcion y presione ENTER (1 + ENTER): "
            read(*,*) selection
            
            
            select case (selection)
                case(0)
                    return
                case(1)
                    f = friccion1Pto(ksd,Re,f)
                    exit
                case(2)
                    f= friccionNewtonRapshon(ksd,Re,f)
                    exit
                case default
                    print *,"Invalid option"
            end select
        end do
        
        print "(/'f= ', es10.3/)", f
        print *, "FIN"
        read(*,*)
    end subroutine EjemploFriccion
    
    end module
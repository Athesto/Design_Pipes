subroutine dTuberiaSimple
    use messages
     implicit none
     !!Variables Externas
     real:: Qd, ks, d_delta, H, z2, l, nu,sigma_km

     !!Variables Internas
     real:: di, hfi, vi, Qi, Hfi_1,sigma_hm
     real, parameter, dimension(1:6)::d_comercial=(/3,4,6,8,10,12/) !Tomados del ejemplo 2.5
     integer::i,j=1,k=0

     real, parameter :: pi = 4 * atan (1.0), g = 9.81, p_agua = 999.1, E = 1.0E-5



     print *, char(10),"         <<<<1: disenio de tuberia simple>>>>",char(10) 



     !Leer las variables
     l=150; ks=0.00015;Qd=0.12; H=2.2;Sigma_km=0.5+0.8+10*0.1+1; nu = 1.17E-6; d_delta=0.0254; z2=0
     print datosEjercicio4, l,ks,Qd,H,Sigma_km,nu,E,d_delta
     print "('Diametros comerciales(inch): ',6f10.0)",d_comercial(:)
     print "('Diametros comerciales( mts): ',6f10.4)",d_comercial(:)*0.0254

     !Suponer hs = H-z2
     hfi= H-z2

     !Suponer d pequeño
     di=5*0.0254

     print"(/,2x,'i',2x,'k',4x,'di',4x,'hfi',4x,'j',5x,'vi',5x,'Qi',4x,'Qi>Qd',2x,'Sigma_hm')"
     !Loop
     do i = 0, 10, 1
         vi = cal_vi(l,ks,nu,g,di,hfi)
         sigma_hm = sigma_km* vi**2 /(2*g)

         !Calcular Q
         Qi=vi*pi/4 * di ** 2

         !Visualizacion 1ra convergencia
         print "(i3,1x,i2,2x,f6.4,2x,f4.2,2x,f3.0,2x,f5.3,2x,f6.4,4x,L1,5x,f5.3)",&
                 i,k, di,hfi,d_comercial(j), vi,Qi,Qi>Qd,sigma_hm


         if (Qi < Qd) then
             if (di>=d_comercial(1)*0.0254)then
                 di = d_comercial(j+1)*0.0254                    
                 if (j<size(d_comercial))then
                     j=j+1
                 endif                    
             else
                 di=di+d_delta 
             endif


             cycle
         endif

         do k = 1, 100, 1
             Hfi_1 = cal_hfi_1(H,z2,Sigma_km,vi,g)
             if (abs(Hfi_1 - hfi)<E) then
                 exit
             else
                 hfi = Hfi_1
                 vi = cal_vi(l,ks,nu,g,di,hfi)
                 sigma_hm = sigma_km* vi**2 /(2*g)
                 Qi=vi*pi/4 * di ** 2
                 !Visualizacion 2da convergencia
                 print "(i3,1x,i2,2x,f6.4,2x,f4.2,2x,f3.0,2x,f5.3,2x,f6.4,4x,L1,5x,f5.3,'_')",&
                 i,k, di,hfi,d_comercial(j), vi,Qi,Qi>Qd,sigma_hm
             end if

         end do



         if (Qi > Qd) then
             exit
         else
             if (di>=d_comercial(1)*0.0254)then
                 di = d_comercial(j+1)*0.0254                    
                 if (j<size(d_comercial))then
                     j=j+1
                 endif                    
             else
                 di=di+d_delta 
             endif
             hfi= H-z2
         endif

     end do 






     !Respuesta
     print "(/,'Tuberia de: ', f5.0, ' inchs ('f6.4 ' mts)')",di/0.0254,di
     print "(' Caudal de: ', f7.2, ' l/s ('f6.4 ' m3/s)')",Qi*1000,Qi

     read(*,*)

     contains


     function cal_vi(l,ks,nu,g,d,hf1) !velocidad ec 2.3
         implicit none
         real :: cal_vi,l,ks,nu,g,d,hf1

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

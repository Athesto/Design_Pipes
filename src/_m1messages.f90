module messages
    implicit none
    !Mensaje principal
    character(len = *), parameter:: mensajeOpciones = "(&
    '<-----------------------Proyecto de Hidraulica----------------------------------->'/&
    '| 1: Comprobacion de disenio de tuberia simple'/&
    '| 2: Calculo de potencia de tuberia simple'/&
    '| 3: Calculo del factor de friccion f, por el metodo de iteracion de un punto'/&
    '| 4: Disenio de tuberia simple'/&
    '| 5: Disenio de tuberia simple con bombeo'/&
    '| '/&
    '| 0: Terminar'/&
    '<-------------------------------------------------------------------------------->')"
    
    character(len = *), parameter:: mensajeSeleccionFriccion = "(&
    //&
    '<<<<3: Calculo del factor de friccion f, por el metodo de iteracion de un punto>>>>'/&
    '| 1: Friccion por metodo Newton (1 punto)'/&
    '| 2: Friccion por metodo Newton-Raphson'/&
    '| '/&
    '| 0: Terminar'/&
    '<-------------------------------------------------------------------------------->')"
    
    character(len=*), parameter:: datosEjercicio1 = "(&
    22x,'Longitud (l): ',f5.1, 6x,' m'/&
    11x,'Diferencia de nivel (H): ',f7.3, 4x,' m'/&
    08x,'Diametro de la tuberia (d): ',f7.3, 4x,' m'/&
    11x,'Rugosidad Absoluta (ks): ',es11.3,' m'/&
    01x,'Suma de Coef. Perdidas (Sigma_km): ',f7.3/&
    18x,'Densidad rho (p): ',es11.3,' kg/m3'/&
    07x,'Viscosidad cinematica (nu): ',es11.3,' m2/s'/&
    25x,'Cota (zy): ',f7.3, 4x,' m'/&
    25x,'ERROR (E): ',es11.3,' m'/)"
    
    character(len=*), parameter:: datosEjercicio2 = "(& 
    24x, 'Caudal (Q): ', f7.3, 4x, ' m3/s'/&
    22x, 'Longitud (l): ',f7.3, 4x,' m'/&
    25x, 'Cota (zy): ',f7.3, 4x,' m'/&
    11x, 'Rugosidad Absoluta (ks): ',es11.3,' m'/&
    08x, 'Diametro de la tuberia (d): ',f7.3, 4x,' m'/&
    01x, 'Suma de Coef. Perdidas (Sigma_km): ',f7.3/&
    08x, 'Viscosidad cinematica (nu): ',es11.3,' m/s2'/)"
    
    character(len=*), parameter:: datosEjercicio3 = "(&
    01x, 'Relacion entre rugosidad y longitud (ks/d): ',es10.3,' '/&
    20x, 'Numero de Reynolds (Re):', i7.1/&
    19x, 'Semilla de iteracion (f): ',es10.3/&
    /)"
    
    character(len=*), parameter:: datosEjercicio4 = "(&
    22x,'Longitud (l): ',f5.1, 6x,' m'/&
    11x,'Rugosidad Absoluta (ks): ',f9.5, 2x,' m'/&
    12x,'Caudal de disenio (Qd): ', f7.3, 4x, ' m3/s'/&
    11x,'Diferencia de nivel (H): ',f7.3, 4x,' m'/&
    01x,'Suma de Coef. Perdidas (Sigma_km): ',f7.3/&
    08x,'Viscosidad cinematica (nu): ',es11.3,' m2/s'/&
    25x,'ERROR (E): ',es11.3,' m'/&
    23x,'delta_d (E): ',f7.3,' m'/)"

end module messages


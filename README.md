# Desing_Pipes  [![lic](https://img.shields.io/badge/Licence-MIT-blue.svg)](LICENSE)
> Algoritmos en FORTRAN para el diseño de tuberías propuestos por *Juan G. Saldarraiga* en el libro de *Hidráulica de Tuberías*

## Descarga
 En [Release] se encuentra `design_pipes.zip`  que contiene el último archivo `exe` compilado, diviértanse
 
## Instrucciones de Compilación
Si lo que quieres es descargar y compilar codigo fuente, revisa primero los prerrequisitos

### Prerrequisitos
 - Tener Java instalado, por ejemplo [Java JRE] (requerimiento de [Netbeans])
 - Instalar `gcc`, `gFortran` y `MSYS` a través del instalador de [MinGW]
 - Instalar [Netbeans C++]
 - [Skin] de Netbeans (Opcional)
 
### Descarga y Compilación
 1. Ir a la sección de [Release]
 2. Descarga el codigo de fuente `Source code (zip)`
 2. Descomprime la capeta `Design_Pipes-X.X.zip`
 3. En el Netbeans, `Files/Open Project`
 4. Abres el proyecto `Design_Pipes-x.x`
 8. `Shift`+`F11` (Clean and Build Project)
 9. `F6` Run project

### Compilación StandAlone (Sin dependencias a MinGW)
Si se quiere correr el ejecutable en un computador que no tenga instalado el MinGW. Hay que asociar las librerias de `gcc` y `gfrotran` al ejecutable. 

 - Abre la ubicación

		Files/Project Properties/Build/Linker/Aditional Options

 - Copia el siguiente comando
 
		-static C:\MinGW\bin\libgfortran-3.dll C:\MinGW\bin\libgcc_s_dw2-1.dll

## Sugerencias
Este repositorio nace del deseo de abandonar la arcaica idea de realizar proyectos y que se pierdan justo cuando se acaba una materia. por lo que pido que compartan, aprendan y comenten si no les funciona o si tienen algún problema en compilar [aquí](https://github.com/Athesto/Desing_Pipes/issues)

[Release]: https://github.com/Athesto/Desing_Pipes/releases
[Netbeans]: https://netbeans.org/community/releases/82/install.html#requiredsoftware
[licence]: http://google.com
[Java JRE]: http://www.oracle.com/technetwork/java/javase/downloads/index.html
[MinGW]: http://www.mingw.org/
[Netbeans C++]: https://netbeans.org/downloads/
[Skin]: http://plugins.netbeans.org/plugin/62424/darcula-laf-for-netbeans

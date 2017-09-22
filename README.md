# Desing_Pipes  [![lic](https://img.shields.io/badge/Licence-MIT-blue.svg)](LICENSE)
> Algoritmos en FORTRAN para el diseño de tuberías propuestos por *Juan G. Saldarraiga* en el libro de *Hidráulica de Tuberías*


## Prerequisitos
 - Tener Java, por ejemplo [Java JRE] (requerimiento de [Netbeans])
 - Instalar gcc, gFortran y MSYS a través del instalador de [MinGW]
 - Instalar [Netbeans C++]
 - [Skin] de Netbeans (Opcional)
 
## Descarga
 En [Release] se encuentra el último ejecutable, diviertanse

##Para compilar

 1. Creas un proyecto nuevo (**File/New Project/C C++ Application**)
 2. Desmarca el checkbox de `Create a new Main File` (no lo necesitas)
 3. Descargas el repositorio
 4. Descomprime la capeta Source en la raiz de la aplicación
 5. En el Netbeans, en la ventana de `Projects/<Tu projecto>/Source Files`, le das clic derecho y elije `Add Existing Items from Folder...` y `Add Folder`
 6. selecciona la misma carpeta raíz para que actualice la carpeta src
 7. mueves los archivos a la carpeta `Source Files`
 8. `Shift`+`F11` (Clean and Build Project)
 9. `F6` Run project

### Compilación StandAlone (Sin dependencias a MinGW)
Si se quiere correr el ejecutable en un computador que no tenga instalado el MinGW. Hay que asociar las librerias de `gcc` y `gfrotran` al ejecutable. 

 - Ves a la dirección y copia el comando

**Files/Project Properties/Build/Linker/Aditional Options**

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

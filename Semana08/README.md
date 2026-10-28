# Calculadora de CTS
 
App en SwiftUI que calcula la CTS (Compensación por Tiempo de Servicios) de un trabajador, siguiendo la normativa peruana. Se llena paso a paso y al final muestra el monto con su detalle.
 
## Requerimientos funcionales
 
| Código | Requerimiento |
|--------|---------------|
| RF01 | Registrar los datos del trabajador y del periodo: nombre, horas diarias, depósito (mayo o noviembre) y año. |
| RF02 | Registrar el tiempo trabajado (todo el periodo, ingreso después o cese) y calcular los meses y días que se cuentan. |
| RF03 | Registrar la remuneración: sueldo, asignación familiar (10 % de la RMV) y 1/6 de la última gratificación. |
| RF04 | Registrar horas extras y comisiones de los 6 meses y calcular su promedio. Solo cuentan si hubo pagos en 3 meses o más. |
| RF05 | Registrar faltas, licencia sin goce y descanso médico (solo se descuenta lo que pase de 60 días) y calcular los días computables. |
| RF06 | Validar los datos obligatorios antes de avanzar y comprobar si hay derecho a CTS (mínimo 4 horas diarias y 30 días computables). |
| RF07 | Mostrar una revisión con todos los datos antes de calcular, con opción de volver atrás para corregir. |
| RF08 | Calcular la CTS y mostrar el monto con su detalle (periodo, días, remuneración computable y fórmula), con opción de hacer un nuevo cálculo. |
 
## Fórmula usada
 
```
Remuneración computable = sueldo + asignación familiar + 1/6 de gratificación
                          + promedio de horas extras + promedio de comisiones
 
CTS = remuneración computable ÷ 360 × días computables
```
 
## Pasos de la app
 
1. Trabajador y periodo
2. Tiempo trabajado
3. Sueldo
4. Pagos variables
5. Días que no cuentan
6. Revisión
7. Resultado
## Estructura del proyecto
 
```
CTSApp/
├── Models/    DatosCTS, ResultadoCTS
├── Logic/     CalculadoraCTS
└── Views/     ContentView, Estilos, Paso1View ... Paso7View
```
 
## Tecnologías
 
- Swift y SwiftUI
- Xcode
 

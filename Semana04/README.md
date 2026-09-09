# Sistema de Información — Metro de Lima 2026

## 1. Introducción y Alcance

El **Sistema de Información del Metro de Lima** es una herramienta de consulta que permite a cualquier usuario acceder a información oficial sobre las estaciones, líneas, tarifas, horarios y conexiones de la red de transporte, tomando como fuente los datos publicados en el portal oficial [metrolima.net](https://metrolima.net).

El sistema cubre las cuatro líneas de la red (**Línea 1, Línea 2, Línea 3 y Línea 4**), diferenciando entre estaciones actualmente **operativas** y estaciones **proyectadas** que aún no cuentan con tarifa u horario definitivo.

## 2. Requerimientos Funcionales

| Código | Requerimiento |
|--------|----------------|
| RF-01  | Búsqueda de estación |
| RF-02  | Ficha de información de estación |
| RF-03  | Filtrado de estaciones por línea |
| RF-04  | Consulta de conexiones entre líneas |
| RF-05  | Consulta de tarifas y horarios |

### RF-01: Búsqueda de Estación

El sistema permite al usuario buscar una estación ingresando su nombre. La búsqueda reconoce el nombre correctamente sin importar si se escribe en mayúsculas, minúsculas, con espacios adicionales o con tildes, de modo que el usuario no necesita escribir el nombre de forma exacta para obtener un resultado.

Cuando el nombre ingresado corresponde a una estación que existe en más de una línea, el sistema le presenta al usuario las opciones encontradas para que elija cuál desea consultar.

### RF-02: Ficha de Información de Estación

Una vez identificada la estación, el sistema muestra una ficha con la siguiente información:

- Línea a la que pertenece y estado (operativa o proyectada).
- Disponibilidad de ascensores y servicios higiénicos.
- Tarifa y medio de pago correspondiente.
- Horario de atención.
- Estaciones o líneas con las que tiene conexión, cuando aplica.
- Avenidas principales de acceso.
- Sedes deportivas cercanas, en los casos donde exista dicha relación.

En el caso de estaciones proyectadas, el sistema indica explícitamente que la tarifa y el horario aún no están definidos, en lugar de mostrar información incorrecta o inventada.

### RF-03: Filtrado de Estaciones por Línea

El sistema permite visualizar el listado completo de estaciones de una línea específica, seleccionada por el usuario. El listado se presenta ordenado alfabéticamente e indica si cada estación se encuentra operativa o proyectada.

### RF-04: Consulta de Conexiones entre Líneas

El sistema ofrece una vista dedicada donde se listan todas las estaciones que funcionan como punto de transbordo entre dos o más líneas de la red, indicando con qué otra línea o servicio se conecta cada una.

### RF-05: Consulta de Tarifas y Horarios

El sistema muestra un resumen general de las tarifas y horarios de atención vigentes para las líneas operativas, así como una indicación de que las líneas proyectadas aún no cuentan con esta información oficial.

## 3. Fuente de Datos

La información mostrada por el sistema se basa en los datos publicados en el portal oficial **metrolima.net**.

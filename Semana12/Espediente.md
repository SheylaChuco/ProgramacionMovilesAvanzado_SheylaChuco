# Expediente – Lab 12: Compras (SwiftUI + SwiftData)

**Curso:** Programación en Móviles Avanzado  
**Docente:** Juan León  
**Tema:** Manejo de datos con Core Data y SwiftData  
**Caso:** Grupo B – Compras  
**Rama de trabajo:** `main`

## 1. Integrantes

| Nombre | Usuario GitHub |
|---|---|
| Sheyla Chuco Bravo | SheylaChuco |


## 2. Descripción

App de compras para una empresa. Un comprador registra compras a proveedores y un supervisor aprueba las compras grandes y paga las compras a crédito. Todo se guarda en el dispositivo con SwiftData.

## 3. Modelo de datos

**Usuario**

| Campo | Tipo |
|---|---|
| nombre | String |
| usuario | String |
| clave | String |
| rol | String (Comprador o Supervisor) |

**Proveedor**

| Campo | Tipo |
|---|---|
| nombre | String |
| ruc | String |

**Producto**

| Campo | Tipo |
|---|---|
| nombre | String |
| categoria | String |
| stock | Int |
| costoPromedio | Double |

**Compra**

| Campo | Tipo |
|---|---|
| fecha | Date |
| cantidad | Int |
| costoUnitario | Double |
| igv | Double |
| total | Double |
| alCredito | Bool |
| vence | Date |
| estado | String (Pendiente, Aprobada o Rechazada) |
| pagada | Bool |
| motivoRechazo | String (opcional) |

**Relaciones:** una Compra pertenece a un Usuario (comprador), a un Proveedor y a un Producto. A su vez, un Usuario, un Proveedor y un Producto pueden tener muchas Compras.
Las relaciones usan `@Relationship(deleteRule: .deny)`: no se puede borrar un usuario, proveedor o producto que ya tenga compras.

## 4. Registro, login y roles

- **Registro:** usuario único (sin distinguir mayúsculas), clave de mínimo 6 caracteres y confirmación igual.
- **Login:** si falla muestra "Usuario o clave incorrectos", sin decir qué dato falló.
- **Sesión:** un objeto `@Observable` guarda al usuario conectado. Si está vacío se ve el login, si no, las pestañas.

| Rol | Pestañas |
|---|---|
| Comprador | Productos, Proveedores, Compra, Mis compras |
| Supervisor | Resumen, Aprobar, Por pagar, Productos, Proveedores |

Permisos: solo el supervisor aprueba, rechaza y paga. Solo el supervisor crea, edita y borra productos y proveedores. El comprador solo ve sus propias compras.

## 5. Reglas de negocio

Todas están en `Reglas.swift`.

1. **IGV:** 18 % del subtotal (cantidad × costo unitario). Total = subtotal + IGV.
2. **Aprobación:** si el total es S/ 5,000 o más, la compra queda **Pendiente** y no cambia stock, costo promedio ni cuentas por pagar. Si es menor, queda **Aprobada**.
3. **Costo promedio ponderado** (al aprobar): `(stock × costo promedio + cantidad × costo unitario) / (stock + cantidad)`.
4. **Pago:** contado queda pagada; crédito vence a los 30 días.
5. **Vencida:** compra a crédito, aprobada, sin pagar y con fecha de vencimiento anterior a hoy.
6. **Rechazo:** exige un motivo y no modifica el producto.

Ejemplo: stock 40 a S/ 110, compra de 10 a S/ 120 a crédito. Subtotal 1,200, IGV 216, total 1,416, queda Aprobada, stock 50, costo promedio 112.00.

## 6. Pantallas

| Código | Pantalla | Rol |
|---|---|---|
| B1 | Login | Todos |
| B2 | Registro | Todos |
| B3 | Productos | Ambos (edita solo supervisor) |
| B4 | Proveedores | Ambos (edita solo supervisor) |
| B5 | Nueva compra | Comprador |
| B6 | Mis compras | Comprador |
| B7 | Aprobar | Supervisor |
| B8 | Por pagar | Supervisor |
| B9 | Resumen | Supervisor |


## 7. Casos de prueba

Datos iniciales: producto con stock 40 y costo promedio 110.

| # | Prueba | Resultado esperado |
|---|---|---|
| 1 | Registrar `mschuco` y repetirlo | La segunda vez se rechaza |
| 2 | Login con clave incorrecta | "Usuario o clave incorrectos" |
| 3 | Comprar 10 a S/ 120 a crédito | Subtotal 1,200, IGV 216, total 1,416, Aprobada, stock 50, costo 112.00 |
| 4 | Lo mismo al contado | Queda pagada |
| 5 | Comprar 50 a S/ 120 | Total 7,080, Pendiente, stock sigue en 40 |
| 6 | Supervisor aprueba la anterior | Stock 90, costo 115.56 |
| 7 | Rechazar sin motivo y con motivo | Sin motivo no deja; con motivo queda Rechazada |
| 8 | Compra a crédito vencida y pagarla | Aparece VENCIDA; al pagar sale de Pendientes |
| 9 | Comprador intenta pagar | No tiene la pestaña Por pagar |
| 10 | Borrar proveedor con compras | Se bloquea |
| 11 | Comprador abre Mis compras | Solo ve las suyas |

## 8. Commits

Un commit por pantalla, con el formato `Lab11 Compras: ...`, todo en `main`:
modelos, sesión y reglas, registro, productos, proveedores, nueva compra, mis compras, aprobar, por pagar, resumen, login, navegación por rol y limpieza del proyecto.

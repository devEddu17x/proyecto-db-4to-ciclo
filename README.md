# Proyecto de Base de Datos - 4to Ciclo

## Descripción del Proyecto

Este proyecto consiste en la creación de una base de datos para una pollería. La base de datos incluye tablas para almacenar información sobre platillos, bebidas, extras, clientes, mozos, pedidos y comprobantes. Además, se han creado triggers para calcular el total de los comprobantes y se han proporcionado scripts para la inserción de datos, la eliminación de tablas y la obtención de datos.

## Características del Proyecto

- Creación de tablas para almacenar información sobre platillos, bebidas, extras, clientes, mozos, pedidos y comprobantes.
- Creación de triggers para calcular el total de los comprobantes.
- Scripts para la inserción de datos en las tablas.
- Scripts para la eliminación de tablas.
- Scripts para la obtención de datos de las tablas.

## Instrucciones para Configurar la Base de Datos

1. Crear un usuario para la base de datos:
   ```sql
   ALTER SESSION SET "_ORACLE_SCRIPT" = TRUE;

   CREATE USER <YOUR_USER> IDENTIFIED BY <YOUR_PASSWORD>;

   ALTER USER <YOUR_USER> QUOTA UNLIMITED ON USERS;

   GRANT CONNECT, RESOURCE TO <YOUR_USER>;
   ```

2. Conectar con el usuario creado:
   ```sql
   CONNECT polleria_db/polleria_db;
   ```

## Instrucciones para Ejecutar los Scripts SQL

1. Ejecutar el script de creación de tablas:
   ```sql
   @creacion-tablas.sql
   ```

2. Ejecutar el script de creación de triggers:
   ```sql
   @creacion-triggers.sql
   ```

3. Ejecutar el script de inserción de datos:
   ```sql
   @inserseccion-datos.sql
   ```

4. Ejecutar el script de consultas útiles:
   ```sql
   @consultas-utiles.sql
   ```

5. Ejecutar el script de obtención de datos:
   ```sql
   @obtencion-datos.sql
   ```

6. Para eliminar las tablas, ejecutar el script de eliminación de tablas:
   ```sql
   @eliminacion-tablas.sql
   ```

7. Para eliminar los triggers, ejecutar el script de eliminación de triggers:
   ```sql
   @eliminar-triggers.sql
   ```

8. Para limpiar las tablas, ejecutar el script de limpieza de tablas:
   ```sql
   @limpiar-tablas.sql
   ```

## Explicación de Cada Script SQL en el Repositorio

- `consultas-utiles.sql`: Contiene consultas para obtener información útil de la base de datos, como el total de clientes, el total de ventas por tipo de comprobante, el total de ventas por mozo y el total de ventas por día.
- `creacion-tablas.sql`: Contiene las instrucciones para crear las tablas de la base de datos.
- `creacion-triggers.sql`: Contiene las instrucciones para crear los triggers que calculan el total de los comprobantes.
- `eliminacion-tablas.sql`: Contiene las instrucciones para eliminar las tablas de la base de datos.
- `eliminar-triggers.sql`: Contiene las instrucciones para eliminar los triggers de la base de datos.
- `inserseccion-datos.sql`: Contiene las instrucciones para insertar datos en las tablas de la base de datos.
- `limpiar-tablas.sql`: Contiene las instrucciones para limpiar las tablas de la base de datos.
- `obtencion-datos.sql`: Contiene las instrucciones para obtener datos de las tablas de la base de datos.

## Información de Contacto para Asistencia Adicional

Para obtener más información o asistencia adicional, por favor contacta a:

- @devEddu17x
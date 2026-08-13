import 'dart:io';

void main() {
  List<Map<String, dynamic>> productos = [];

  bool continuar = true;
  while (continuar) {

    print('CATÁLOGO DE PRODUCTOS');

    print('1. Agregar producto');
    print('2. Listar productos');
    print('3. Actualizar producto');
    print('4. Eliminar producto');
    print('5. Salir');
    print('===============================');
    stdout.write('Selecciona una opción: ');
    
    String? opcion = stdin.readLineSync();

    switch (opcion) {
      case '1':
        // Agregar producto
        print('\n--- Agregar nuevo producto ---');
        stdout.write('Nombre del producto: ');
        String? nombre = stdin.readLineSync();
        
        if (nombre == null || nombre.trim().isEmpty) {
          print('Error: El nombre no puede estar vacío.');
          break;
        }

        stdout.write('Precio: ');
        double? precio = double.tryParse(stdin.readLineSync() ?? '');
        if (precio == null || precio < 0) {
          print('Error: Debes ingresar un precio válido y no negativo.');
          break;
        }

        stdout.write('Cantidad disponible: ');
        int? cantidad = int.tryParse(stdin.readLineSync() ?? '');
        if (cantidad == null || cantidad < 0) {
          print('Error: Debes ingresar una cantidad válida y no negativa.');
          break;
        }

        Map<String, dynamic> nuevoProducto = {
          'nombre': nombre.trim(),
          'precio': precio,
          'cantidad': cantidad,
        };
        productos.add(nuevoProducto);
        print(' Producto "${nombre.trim()}" agregado correctamente.');
        break;

      case '2':
        // Listar productos
        print('\n--- Listado de productos ---');
        if (productos.isEmpty) {
          print('No hay productos registrados.');
        } else {
          for (int i = 0; i < productos.length; i++) {
            Map<String, dynamic> p = productos[i];
            print('${i + 1}. ${p['nombre']} | Precio: \$${p['precio']} | Cantidad: ${p['cantidad']}');
          }
        }
        break;

      case '3':
        // Actualizar producto
        print('\n--- Actualizar producto ---');
        if (productos.isEmpty) {
          print('No hay productos para actualizar.');
          break;
        }

        for (int i = 0; i < productos.length; i++) {
          Map<String, dynamic> p = productos[i];
          print('${i + 1}. ${p['nombre']} | Precio: \$${p['precio']} | Cantidad: ${p['cantidad']}');
        }

        stdout.write('\nIngresa el número del producto a actualizar: ');
        int? indiceActualizar = int.tryParse(stdin.readLineSync() ?? '');
        
        if (indiceActualizar == null || indiceActualizar < 1 || indiceActualizar > productos.length) {
          print('Error: Número fuera de rango.');
          break;
        }

        int idx = indiceActualizar - 1;
        Map<String, dynamic> productoActual = productos[idx];

        print('Deja vacío (presiona Enter) para mantener el valor actual.');

        stdout.write('Nuevo nombre (actual: ${productoActual['nombre']}): ');
        String? nuevoNombre = stdin.readLineSync();
        if (nuevoNombre != null && nuevoNombre.trim().isNotEmpty) {
          productoActual['nombre'] = nuevoNombre.trim();
        }

        stdout.write('Nuevo precio (actual: ${productoActual['precio']}): ');
        String? nuevoPrecioStr = stdin.readLineSync();
        if (nuevoPrecioStr != null && nuevoPrecioStr.trim().isNotEmpty) {
          double? nuevoPrecio = double.tryParse(nuevoPrecioStr.trim());
          if (nuevoPrecio != null && nuevoPrecio >= 0) {
            productoActual['precio'] = nuevoPrecio;
          } else {
            print('Precio inválido, se conserva el anterior.');
          }
        }

        stdout.write('Nueva cantidad (actual: ${productoActual['cantidad']}): ');
        String? nuevaCantidadStr = stdin.readLineSync();
        if (nuevaCantidadStr != null && nuevaCantidadStr.trim().isNotEmpty) {
          int? nuevaCantidad = int.tryParse(nuevaCantidadStr.trim());
          if (nuevaCantidad != null && nuevaCantidad >= 0) {
            productoActual['cantidad'] = nuevaCantidad;
          } else {
            print('Cantidad inválida, se conserva la anterior.');
          }
        }

        print(' Producto actualizado correctamente.');
        break;

      

      default:
        print(' Opción inválida. Por favor selecciona una opción del 1 al 5.');
    }
  }
}
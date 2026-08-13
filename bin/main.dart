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

      

      default:
        print(' Opción inválida. Por favor selecciona una opción del 1 al 5.');
    }
  }
}
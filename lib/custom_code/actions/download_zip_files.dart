// Automatic FlutterFlow imports
// Imports other custom actions
// Begin custom action code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

import 'package:dio/dio.dart';
import 'package:path_provider/path_provider.dart';
import 'package:open_file/open_file.dart';

Future<void> downloadZipFiles(String category, String? subcategory) async {

  try {
    // URL de tu función de Google Cloud
    const String url =
        'https://us-central1-ethereal-runway-444323-a5.cloudfunctions.net/download_zip';

    // Agregar el parámetro de categoría
    print('Nombre de la categoría enviada: $category');
    final String fullUrl = subcategory == null
        ? '$url?category=$category'
        : '$url?category=$category&subcategory=$subcategory';

    // Obtener el directorio de almacenamiento local
    final directory = await getApplicationDocumentsDirectory();
    final filePath = '${directory.path}/$category.zip';

    // Descargar el archivo ZIP
    final Dio dio = Dio();
    final response = await dio.download(fullUrl, filePath);
    final result = await OpenFile.open(filePath);

    if (result.type == ResultType.done) {
      print('Archivo abierto exitosamente');
    } else {
      print('Error al abrir el archivo: ${result.message}');
    }
    // Verificar el estado de la descarga
    if (response.statusCode == 200) {
      print('Archivo descargado con éxito: $filePath');
    } else {
      throw Exception('Error al descargar el archivo: ${response.statusCode}');
    }
  } catch (e) {
    print('Error en la descarga: $e');
  }
}

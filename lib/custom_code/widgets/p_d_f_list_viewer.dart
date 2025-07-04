// Automatic FlutterFlow imports
// Imports other custom widgets
// Imports custom actions
import 'package:flutter/material.dart';
// Begin custom widget code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

import 'package:flutter_cached_pdfview/flutter_cached_pdfview.dart';
import 'package:flutter/services.dart';
import 'package:cloud_firestore/cloud_firestore.dart';



class PDFListViewer extends StatefulWidget {
  const PDFListViewer({
    super.key,
    this.width,
    this.height,
    required this.pdfUrls,
    required this.pdfNames,
    required this.pdfTimestamps, // Agregar pdfTimestamps

  });

  final double? width;
  final double? height;
  final List<String> pdfUrls;
  final List<String> pdfNames;
  final List<Timestamp> pdfTimestamps; // Este será el tipo de datos de las fechas


  @override
  State<PDFListViewer> createState() => _PDFListViewerState();
}

class _PDFListViewerState extends State<PDFListViewer> {
  late List<Map<String, dynamic>> sortedPdfList;

  @override
  void initState() {
    super.initState();

    // Ahora recibimos 'timestamp' correctamente, que debe ser un Timestamp de Firestore
    sortedPdfList = List.generate(
      widget.pdfNames.length,
          (index) => {
        'name': widget.pdfNames[index],
        'url': widget.pdfUrls[index],
        'timestamp': widget.pdfTimestamps[index],  // Asegúrate de pasar el campo 'timestamp' correcto
      },
    );
    print("Datos ordenados y recibidos en PDFListViewer: $sortedPdfList");
    // Elimina el ordenamiento aquí, ya que el orden ya se realiza antes de pasar los datos.
    // Si realmente necesitas ordenar dentro de este widget, asegúrate de tener el campo 'timestamp' de Firestore bien representado.

    // Si aún necesitas ordenar por 'timestamp', y ya estás recibiendo el campo 'timestamp' como un Timestamp, realiza la conversión a DateTime
    sortedPdfList.sort((a, b) {
      DateTime dateA;
      DateTime dateB;

      // Verifica que 'timestamp' sea un Timestamp de Firestore
      if (a['timestamp'] is Timestamp) {
        dateA = (a['timestamp'] as Timestamp).toDate();
      } else {
        dateA = DateTime.now();  // Si no es un Timestamp, usa una fecha predeterminada
      }

      if (b['timestamp'] is Timestamp) {
        dateB = (b['timestamp'] as Timestamp).toDate();
      } else {
        dateB = DateTime.now();  // Si no es un Timestamp, usa una fecha predeterminada
      }

      // Imprime los valores de fecha antes de la comparación
      //print("Timestamp A: $dateA");
      //print("Timestamp B: $dateB");

      return dateB.compareTo(dateA); // Orden descendente por fecha
    });

    // Imprimir la lista ordenada
    //print("Lista ordenada de PDFs por fecha (descendente): ");
    //sortedPdfList.forEach((pdf) {
    // print(pdf['name']);  // Imprime el nombre del archivo PDF
    // });
  }


  // Método para extraer el número del nombre del PDF
  int _extractNumber(String name) {
    final regex = RegExp(r'\d+'); // Busca números en el string
    final match = regex.firstMatch(name);
    return match != null
        ? int.parse(match.group(0)!)
        : 0; // Retorna 0 si no hay número
  }
  // Función para copiar el texto al portapapeles
  void _copyToClipboard(String text) {
    Clipboard.setData(ClipboardData(text: text));
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text('Texto copiado: $text')),
    );
  }
  @override
  Widget build(BuildContext context) {
    print("Número de archivos PDF a mostrar: ${sortedPdfList.length}");
    return ListView.builder(
      itemCount: sortedPdfList.length,
      itemBuilder: (context, index) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                children: [
                  // Nombre del PDF - envuelto en un Expanded para ocupar el espacio restante
                  Expanded(
                    child: Text(
                      sortedPdfList[index]['name']!, // Nombre ordenado
                      style: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                      overflow: TextOverflow.ellipsis,  // Agregar para manejar el desbordamiento
                    ),
                  ),
                  // Icono para copiar el nombre al portapapeles
                  IconButton(
                    icon: const Icon(Icons.copy),
                    onPressed: () {
                      _copyToClipboard(sortedPdfList[index]['name']!);  // Llama a la función para copiar el texto
                    },
                  ),
                ],
              ),
            ),

            // Mostrar el PDF con botón de pantalla completa
            Stack(
              children: [
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.8,
                  child: const PDF(
                    swipeHorizontal: true,
                    autoSpacing: true,
                    pageFling: true,
                    enableSwipe: true,
                  ).cachedFromUrl(
                    sortedPdfList[index]['url']!,
                    placeholder: (progress) => Center(
                      child: CircularProgressIndicator(
                          value: progress / 100), // Indicador de progreso
                    ),
                    errorWidget: (error) => Center(
                      child: Text(
                          "Error al cargar el PDF: $error"), // Manejo de errores
                    ),
                  ),
                ),
                // Botón de pantalla completa
                Positioned(
                  top: 10,
                  right: 10,
                  child: IconButton(
                    icon: const Icon(Icons.fullscreen, color: Colors.blue),
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => FullScreenPDFViewer(
                            pdfUrl: sortedPdfList[index]['url']!,
                          ),
                        ),
                      );
                    },
                  ),
                ),
              ],
            ),
          ],
        );
      },
    );
  }
}

// Widget para la vista de pantalla completa con controles adicionales
class FullScreenPDFViewer extends StatelessWidget {
  final String pdfUrl;

  const FullScreenPDFViewer({super.key, required this.pdfUrl});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Vista Completa"),
        actions: [
          IconButton(
            icon: const Icon(Icons.zoom_in),
            onPressed: () {
              // Implementa lógica avanzada de zoom si es necesario
            },
          ),
          IconButton(
            icon: const Icon(Icons.zoom_out),
            onPressed: () {
              // Implementa lógica para alejar zoom
            },
          ),
        ],
      ),
      body: const PDF(
        swipeHorizontal: true,
        autoSpacing: true,
        pageFling: true,
        enableSwipe: true,
      ).cachedFromUrl(
        pdfUrl,
        placeholder: (progress) =>
            Center(child: CircularProgressIndicator(value: progress / 100)),
        errorWidget: (error) => const Center(child: Text('Error al cargar PDF')),
      ),
    );
  }
}

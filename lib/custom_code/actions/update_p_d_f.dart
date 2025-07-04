// Automatic FlutterFlow imports
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_util.dart';
// Imports other custom actions
// Begin custom action code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

import 'package:pdf/widgets.dart' as pw;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:pdf/pdf.dart';
import 'package:http/http.dart' as http;
import 'dart:io'; // Para manejo de archivos y directorios
import 'package:path_provider/path_provider.dart'; // Para obtener directorios
import 'package:permission_handler/permission_handler.dart'; // Para manejar permisos en Android

Future<void> updatePdfData({
  required String pdfId,
  required Map<String, dynamic> updatedData,
}) async {
  try {
    await FirebaseFirestore.instance.collection('pdf_update').doc(pdfId).update(updatedData);
    print("Documento actualizado correctamente en `pdf_update/$pdfId`.");
  } catch (e) {
    print("Error al actualizar el documento en Firestore: $e");
  }
}


// Función global para construir el contenido del PDF
pw.Widget buildPdfContent({
  required Uint8List? logoImage,
  required String formattedNumrerpot,
  required String? clientname,
  required String? namebuisness,
  required String? addressname,
  required String? phone,
  required DateTime? iconday,
  required String? team,
  required String? brand,
  required String? model,
  required String? serie,
  required String? code,
  required String? location,
  required List<String>? workStatusCheckboxes,
  required String? workstatusother,
  required String? observations,
  required String? recommendations,
  required int? startworkhours,
  required int? endtworkhours,
  required int? totalworkhours,
  required int? maintenancecontract,
  required int? numberofvisits,
  required Uint8List? checkIcon,
  required bool includeSignatureSpace,
}) {
  return pw.Column(
    crossAxisAlignment: pw.CrossAxisAlignment.start,
    children: [
      // Logo y encabezado
      pw.Row(
        mainAxisAlignment: pw.MainAxisAlignment.spaceBetween,
        children: [
          pw.Column(
            crossAxisAlignment: pw.CrossAxisAlignment.start,
            children: [
              if (logoImage != null)
                pw.Image(
                  pw.MemoryImage(logoImage),
                  width: 200,
                  height: 200,
                ),
              pw.SizedBox(height: 5),
              pw.Text(
                'MANTENIMIENTO CALIBRACIÓN DE EQUIPO MÉDICO',
                style: pw.TextStyle(
                  fontSize: 9,
                  fontWeight: pw.FontWeight.bold,
                  color: PdfColor.fromHex('#292d96'),
                ),
              ),
              pw.Text(
                'Dirección: Pedro Dorado S9-289 y Diego de Guevara',
                style: pw.TextStyle(
                  fontSize: 9,
                  color: PdfColor.fromHex('#292d96'),
                ),
              ),
              pw.Text(
                'Telefax: (02) 2647 635 Cel. 099 2603 795 - 099 5885 589',
                style: pw.TextStyle(
                  fontSize: 9,
                  color: PdfColor.fromHex('#292d96'),
                ),
              ),
            ],
          ),
          pw.Column(
            crossAxisAlignment: pw.CrossAxisAlignment.end,
            children: [
              pw.Text(
                'R.U.C.: 1710243559001',
                style: pw.TextStyle(
                  fontSize: 12,
                  fontWeight: pw.FontWeight.bold,
                  color: PdfColor.fromHex('#292d96'),
                ),
              ),
              pw.SizedBox(height: 5),
              pw.Container(
                width: 150,
                height: 25,
                alignment: pw.Alignment.center,
                decoration: pw.BoxDecoration(
                  border: pw.Border.all(color: PdfColor.fromHex('#292d96')),
                ),
                child: pw.Text(
                  formattedNumrerpot, // Mostrará algo como 1,2,3,4,etc
                  style: pw.TextStyle(
                    fontSize: 12,
                    fontWeight: pw.FontWeight.bold,
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
      pw.SizedBox(height: 10),

      // Título centrado
      pw.Center(
        child: pw.Text(
          'MANTENIMIENTO PREVENTIVO DE EQUIPOS MÉDICOS',
          style: pw.TextStyle(
            fontSize: 12,
            fontWeight: pw.FontWeight.bold,
            color: PdfColor.fromHex('#FF0000'),
          ),
        ),
      ),
      pw.SizedBox(height: 10),

      // Columnas informacion cliente con padding individual
      pw.Container(
        decoration: pw.BoxDecoration(
          border: pw.Border.all(
              color:
                  PdfColor.fromHex('#292d96')), // Borde general del contenedor
        ),
        child: pw.Column(
          crossAxisAlignment: pw.CrossAxisAlignment.start,
          children: [
            // Fila 1: Identificación del cliente
            pw.Container(
              decoration: pw.BoxDecoration(
                border: pw.Border(
                  top: pw.BorderSide(
                      color: PdfColor.fromHex('#292d96'),
                      width: 1), // Borde superior
                  bottom: pw.BorderSide(
                      color: PdfColor.fromHex('#292d96'),
                      width: 1), // Borde inferior
                ),
              ),
              child: pw.Row(
                children: [
                  pw.Padding(
                    padding: const pw.EdgeInsets.only(
                        top: 5, left: 5, bottom: 5), // Padding para el título
                    child: pw.Text(
                      'IDENTIFICACIÓN DEL CLIENTE:',
                      style: pw.TextStyle(
                        fontSize: 9,
                        color: PdfColor.fromHex('#292d96'),
                      ),
                    ),
                  ),
                  pw.SizedBox(width: 10),
                  pw.Padding(
                    padding: const pw.EdgeInsets.only(
                        top: 5, bottom: 5), // Padding para la variable
                    child: pw.Text(
                      clientname ?? '',
                      style: pw.TextStyle(
                        fontSize: 9,
                        color: PdfColor.fromHex('#000000'),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            // Fila 2: Empresa
            pw.Container(
              decoration: pw.BoxDecoration(
                border: pw.Border(
                  top: pw.BorderSide(
                      color: PdfColor.fromHex('#292d96'),
                      width: 1), // Borde superior
                  bottom: pw.BorderSide(
                      color: PdfColor.fromHex('#292d96'),
                      width: 1), // Borde inferior
                ),
              ),
              child: pw.Row(
                children: [
                  pw.Padding(
                    padding: const pw.EdgeInsets.only(
                        top: 5, left: 5, bottom: 5), // Padding para el título
                    child: pw.Text(
                      'EMPRESA:',
                      style: pw.TextStyle(
                        fontSize: 9,
                        color: PdfColor.fromHex('#292d96'),
                      ),
                    ),
                  ),
                  pw.SizedBox(width: 10),
                  pw.Padding(
                    padding: const pw.EdgeInsets.only(
                        top: 5, bottom: 5), // Padding para la variable
                    child: pw.Text(
                      namebuisness ?? '',
                      style: pw.TextStyle(
                        fontSize: 9,
                        color: PdfColor.fromHex('#000000'),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            // Fila 3: Dirección
            pw.Container(
              decoration: pw.BoxDecoration(
                border: pw.Border(
                  top: pw.BorderSide(
                      color: PdfColor.fromHex('#292d96'),
                      width: 1), // Borde superior
                  bottom: pw.BorderSide(
                      color: PdfColor.fromHex('#292d96'),
                      width: 1), // Borde inferior
                ),
              ),
              child: pw.Row(
                children: [
                  pw.Padding(
                    padding: const pw.EdgeInsets.only(
                        top: 5, left: 5, bottom: 5), // Padding para el título
                    child: pw.Text(
                      'DIRECCIÓN:',
                      style: pw.TextStyle(
                        fontSize: 9,
                        color: PdfColor.fromHex('#292d96'),
                      ),
                    ),
                  ),
                  pw.SizedBox(width: 10),
                  pw.Padding(
                    padding: const pw.EdgeInsets.only(
                        top: 5, bottom: 5), // Padding para la variable
                    child: pw.Text(
                      addressname ?? '',
                      style: pw.TextStyle(
                        fontSize: 9,
                        color: PdfColor.fromHex('#000000'),
                      ),
                    ),
                  ),
                ],
              ),
            ),
// Fila 4: Teléfonos y Fecha
            pw.Container(
              decoration: pw.BoxDecoration(
                border: pw.Border(
                  top: pw.BorderSide(color: PdfColor.fromHex('#292d96'), width: 1), // Borde superior
                  bottom: pw.BorderSide(color: PdfColor.fromHex('#292d96'), width: 1), // Borde inferior
                ),
              ),
              child: pw.Row(
                mainAxisAlignment: pw.MainAxisAlignment.spaceBetween, // Espaciado entre los elementos
                children: [
                  // Teléfonos
                  pw.Row(
                    children: [
                      pw.Padding(
                        padding: const pw.EdgeInsets.only(
                            top: 5, left: 5, bottom: 5), // Padding para el texto "TELÉFONOS:"
                        child: pw.Text(
                          'TELÉFONOS:',
                          style: pw.TextStyle(
                            fontSize: 9,
                            color: PdfColor.fromHex('#292d96'), // Azul para el texto "TELÉFONOS:"
                          ),
                        ),
                      ),
                      pw.Padding(
                        padding: const pw.EdgeInsets.only(top: 5, left: 5, bottom: 5),
                        child: phone != null
                            ? pw.Text(
                          phone!, // Convierte el número a cadena si no es null
                          style: pw.TextStyle(
                            fontSize: 9,
                            color: PdfColor.fromHex('#000000'), // Negro para el texto del número
                          ),
                        )
                            : pw.SizedBox(), // No muestra nada si phone es null
                      ),


                    ],
                  ),
                  // Fecha
                  pw.Row(
                    children: [
                      pw.Padding(
                        padding: const pw.EdgeInsets.only(top: 5, right: 2, bottom: 5),
                        child: pw.Text(
                          'FECHA:',
                          style: pw.TextStyle(
                            fontSize: 9,
                            color: PdfColor.fromHex('#292d96'), // Azul para el texto "FECHA:"
                          ),
                        ),
                      ),
                      iconday != null
                          ? pw.Padding(
                        padding: const pw.EdgeInsets.only(top: 5, right: 15, bottom: 5),
                        child: pw.Text(
                          iconday.toLocal().toString().split(' ')[0],
                          style: pw.TextStyle(
                            fontSize: 9,
                            color: PdfColor.fromHex('#000000'), // Negro para la variable de la fecha
                          ),
                        ),
                      )
                          : pw.SizedBox(width: 50), // Espacio a la izquierda si no hay fecha
                    ],
                  ),
                ],
              ),
            ),



          ],
        ),
      ),

      pw.SizedBox(height: 9),
// Columna informacion equipo con padding individual
      pw.Container(
        decoration: pw.BoxDecoration(
          border: pw.Border.all(color: PdfColor.fromHex('#292d96')),
        ),
        child: pw.Column(
          crossAxisAlignment: pw.CrossAxisAlignment.start,
          children: [
            // Fila 1: Equipo
            pw.Container(
              decoration: pw.BoxDecoration(
                border: pw.Border(
                  top: pw.BorderSide(
                      color: PdfColor.fromHex('#292d96'),
                      width: 1), // Borde superior
                  bottom: pw.BorderSide(
                      color: PdfColor.fromHex('#292d96'),
                      width: 1), // Borde inferior
                ),
              ),
              child: pw.Row(
                children: [
                  pw.Padding(
                    padding: const pw.EdgeInsets.only(
                        top: 5, left: 5, bottom: 5), // Padding para el título
                    child: pw.Text(
                      'EQUIPO:',
                      style: pw.TextStyle(
                        fontSize: 9,
                        color: PdfColor.fromHex('#292d96'),
                      ),
                    ),
                  ),
                  pw.SizedBox(width: 10),
                  pw.Padding(
                    padding: const pw.EdgeInsets.only(
                        top: 5, bottom: 5), // Padding para la variable
                    child: pw.Text(
                      team ?? '',
                      style: pw.TextStyle(
                        fontSize: 9,
                        color: PdfColor.fromHex('#000000'),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            // Fila 2: Marca
            pw.Container(
              decoration: pw.BoxDecoration(
                border: pw.Border(
                  top: pw.BorderSide(
                      color: PdfColor.fromHex('#292d96'),
                      width: 1), // Borde superior
                  bottom: pw.BorderSide(
                      color: PdfColor.fromHex('#292d96'),
                      width: 1), // Borde inferior
                ),
              ),
              child: pw.Row(
                children: [
                  pw.Padding(
                    padding: const pw.EdgeInsets.only(
                        top: 5, left: 5, bottom: 5), // Padding para el título
                    child: pw.Text(
                      'MARCA:',
                      style: pw.TextStyle(
                        fontSize: 9,
                        color: PdfColor.fromHex('#292d96'),
                      ),
                    ),
                  ),
                  pw.SizedBox(width: 10),
                  pw.Padding(
                    padding: const pw.EdgeInsets.only(
                        top: 5, bottom: 5), // Padding para la variable
                    child: pw.Text(
                      brand ?? '',
                      style: pw.TextStyle(
                        fontSize: 9,
                        color: PdfColor.fromHex('#000000'),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            // Fila 3: Modelo
            pw.Container(
              decoration: pw.BoxDecoration(
                border: pw.Border(
                  top: pw.BorderSide(
                      color: PdfColor.fromHex('#292d96'),
                      width: 1), // Borde superior
                  bottom: pw.BorderSide(
                      color: PdfColor.fromHex('#292d96'),
                      width: 1), // Borde inferior
                ),
              ),
              child: pw.Row(
                children: [
                  pw.Padding(
                    padding: const pw.EdgeInsets.only(
                        top: 5, left: 5, bottom: 5), // Padding para el título
                    child: pw.Text(
                      'MODELO:',
                      style: pw.TextStyle(
                        fontSize: 9,
                        color: PdfColor.fromHex('#292d96'),
                      ),
                    ),
                  ),
                  pw.SizedBox(width: 10),
                  pw.Padding(
                    padding: const pw.EdgeInsets.only(
                        top: 5, bottom: 5), // Padding para la variable
                    child: pw.Text(
                      model ?? '',
                      style: pw.TextStyle(
                        fontSize: 9,
                        color: PdfColor.fromHex('#000000'),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            // Fila 4: Serie
            pw.Container(
              decoration: pw.BoxDecoration(
                border: pw.Border(
                  top: pw.BorderSide(
                      color: PdfColor.fromHex('#292d96'),
                      width: 1), // Borde superior
                  bottom: pw.BorderSide(
                      color: PdfColor.fromHex('#292d96'),
                      width: 1), // Borde inferior
                ),
              ),
              child: pw.Row(
                children: [
                  pw.Padding(
                    padding: const pw.EdgeInsets.only(
                        top: 5, left: 5, bottom: 5), // Padding para el título
                    child: pw.Text(
                      'SERIE:',
                      style: pw.TextStyle(
                        fontSize: 9,
                        color: PdfColor.fromHex('#292d96'),
                      ),
                    ),
                  ),
                  pw.SizedBox(width: 10),
                  pw.Padding(
                    padding: const pw.EdgeInsets.only(
                        top: 5, bottom: 5), // Padding para la variable
                    child: pw.Text(
                      serie ?? '',
                      style: pw.TextStyle(
                        fontSize: 9,
                        color: PdfColor.fromHex('#000000'),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            // Fila 5: Código y Ubicación
            pw.Container(
              decoration: pw.BoxDecoration(
                border: pw.Border(
                  top: pw.BorderSide(
                      color: PdfColor.fromHex('#292d96'),
                      width: 1), // Borde superior
                  bottom: pw.BorderSide(
                      color: PdfColor.fromHex('#292d96'),
                      width: 1), // Borde inferior
                ),
              ),
              child: pw.Row(
                children: [
                  pw.Padding(
                    padding: const pw.EdgeInsets.only(
                        top: 5, left: 5, bottom: 5), // Padding para el título
                    child: pw.Text(
                      'CÓDIGO:',
                      style: pw.TextStyle(
                        fontSize: 9,
                        color: PdfColor.fromHex('#292d96'), // Azul para el texto "CÓDIGO:"
                      ),
                    ),
                  ),
                  pw.Padding(
                    padding: const pw.EdgeInsets.only(
                        top: 5, left: 5, bottom: 5), // Padding para la variable del código
                    child: pw.Text(
                      code != null ? code : 'No especificado',
                      style: pw.TextStyle(
                        fontSize: 9,
                        color: PdfColor.fromHex('#000000'), // Negro para la variable del código
                      ),
                    ),
                  ),
                  pw.SizedBox(width: 20),
                  pw.Spacer(),
                  pw.Padding(
                    padding: const pw.EdgeInsets.only(top: 5, right: 2, bottom: 5),
                    child: pw.Text(
                      'UBICACIÓN:',
                      style: pw.TextStyle(
                        fontSize: 9,
                        color: PdfColor.fromHex('#292d96'), // Azul para el texto "UBICACIÓN:"
                      ),
                    ),
                  ),
                  location != null
                      ? pw.Padding(
                    padding: const pw.EdgeInsets.only(top: 5, right: 15, bottom: 5),
                    child: pw.Text(
                      location, // Muestra la ubicación si no es null
                      style: pw.TextStyle(
                        fontSize: 9,
                        color: PdfColor.fromHex('#000000'), // Negro para la variable de ubicación
                      ),
                    ),
                  )
                      : pw.SizedBox(width: 50), // Espacio fijo si no hay ubicación
                ],
              ),
            ),
          ],
        ),
      ),
      pw.SizedBox(height: 9),

      // Sección de verificaciones
      _createSection('', workStatusCheckboxes, workstatusother, checkIcon),

      // Observaciones
      _createBoxedSection('OBSERVACIONES', observations),

      // Recomendaciones
      _createBoxedSection('RECOMENDACIONES', recommendations),

      // Horas Trabajadas y Mantenimiento
      _createWorkAndMaintenanceSection(
        startworkhours,
        endtworkhours,
        totalworkhours,
        maintenancecontract,
        numberofvisits,
        includeSignatureSpace,
      ),
    ],
  );
}

// Sub-función: Construir filas reutilizables
pw.Widget _buildRow(String title, String value) {
  return pw.Container(
    decoration: pw.BoxDecoration(
      border: pw.Border(
        top: pw.BorderSide(color: PdfColor.fromHex('#292d96'), width: 1),
        bottom: pw.BorderSide(color: PdfColor.fromHex('#292d96'), width: 1),
      ),
    ),
    child: pw.Row(
      children: [
        pw.Padding(
          padding: const pw.EdgeInsets.all(5),
          child: pw.Text(
            title,
            style: pw.TextStyle(
              fontSize: 9,
              color: PdfColor.fromHex('#292d96'),
            ),
          ),
        ),
        pw.SizedBox(width: 10),
        pw.Text(
          value,
          style: pw.TextStyle(
            fontSize: 9,
            color: PdfColor.fromHex('#292d96'),
          ),
        ),
      ],
    ),
  );
}

// Crear una fila con dos columnas de texto
pw.TableRow _customRow(String key, String value) {
  return pw.TableRow(
    children: [
      pw.Padding(
        padding: const pw.EdgeInsets.all(4),
        child: pw.Text(
          key,
          style: pw.TextStyle(
            fontSize: 9,
            color: PdfColor.fromHex('#292d96'),
          ),
        ),
      ),
      pw.Padding(
        padding: const pw.EdgeInsets.all(4),
        child: pw.Text(
          value,
          style: pw.TextStyle(
            fontSize: 9,
            color: PdfColor.fromHex('#292d96'),
          ),
        ),
      ),
    ],
  );
}

pw.Widget _createSection(
    String title, List<String>? items, String? other, Uint8List? checkIcon) {
  final List<String> allOptions = [
    'VERIFICACIÓN VISUAL Y FUNCIONAMIENTO DEL EQUIPO',
    'REVISIÓN DE SISTEMA MECÁNICO (LUBRICACIÓN, AJUSTES, MOVIMIENTOS, OTROS).',
    'REVISIÓN DE SISTEMA ELECTRÓNICO (TARJETAS ELECTRÓNICAS, DISPOSITIVOS, OTROS).',
    'REVISIÓN DE SISTEMA ELÉCTRICO (FUSIBLES, CABLE DE PODER, OTROS).',
    'REVISIÓN DE SISTEMA HIDRÁULICO (FUGAS, PRESIÓN, AJUSTES, OTROS).',
    'REVISIÓN DE SISTEMA NEUMÁTICO (FUGAS, PRESIÓN, AJUSTES, OTROS).',
    'REVISIÓN DE SOFTWARE Y PROTOCOLOS (VERSIONES, ACTUALIZACIONES, OTROS).',
    'REVISIÓN DE CARCASA Y ACCESORIOS (AJUSTES, OTROS).',
    'REVISIÓN DE DISPOSITIVOS (CABEZALES, CABLES, APLICACIONES, OTROS).',
    'CALIBRACIÓN',
    'PRUEBAS DE FUNCIONAMIENTO.',
    'LIMPIEZA GENERAL.',
  ];

  return pw.Container(
    decoration: pw.BoxDecoration(
        border: pw.Border.all(color: PdfColor.fromHex('#292d96'))),
    padding: const pw.EdgeInsets.only(
        left: 10, right: 10, bottom: 5, top: 5), // Sin espacio arriba
    child: pw.Column(
      crossAxisAlignment: pw.CrossAxisAlignment.start,
      children: [
        pw.Text(
          title,
          style: pw.TextStyle(
            fontSize: 9,
            fontWeight: pw.FontWeight.bold,
            color: PdfColor.fromHex('#292d96'),
          ),
        ),
        pw.SizedBox(height: 5),

        // Generar las filas de las opciones estándar
        ...allOptions.map((option) {
          bool isSelected = items != null && items.contains(option);
          return pw.Row(
            children: [
              pw.Container(
                width: 10,
                height: 10,
                decoration: pw.BoxDecoration(
                  border: pw.Border.all(
                    color: PdfColor.fromHex('#292d96'),
                  ),
                ),
                child: isSelected && checkIcon != null
                    ? pw.Padding(
                        padding: const pw.EdgeInsets.all(
                            1), // Asegura espacio entre el borde y el ícono
                        child: pw.Image(
                          pw.MemoryImage(checkIcon),
                          fit: pw.BoxFit
                              .contain, // Ajusta el ícono dentro del cuadrado
                        ),
                      )
                    : null, // El contenedor queda vacío si no está seleccionado
              ),
              pw.SizedBox(width: 5),
              pw.Text(
                option,
                style: pw.TextStyle(
                  fontSize: 9,
                  color: PdfColor.fromHex('#292d96'),
                ),
              ),
            ],
          );
        }),

        // Siempre agregar la fila "OTROS", pero solo mostrar el ícono de check si 'other' tiene valor
        pw.Row(
          crossAxisAlignment: pw.CrossAxisAlignment.start,
          children: [
            pw.Container(
              width: 10,
              height: 10,
              decoration: pw.BoxDecoration(
                border: pw.Border.all(
                  color: PdfColor.fromHex('#292d96'),
                ),
              ),
              child: other != null && other.isNotEmpty && checkIcon != null
                  ? pw.Image(pw.MemoryImage(
                      checkIcon)) // Mostrar ícono si 'other' tiene valor
                  : null,
            ),
            pw.SizedBox(width: 5),
            pw.Text(
              'OTROS: ',
              style: pw.TextStyle(
                fontSize: 9,
                fontWeight: pw.FontWeight.bold,
                color: PdfColor.fromHex('#292d96'),
              ),
            ),
            pw.Expanded(
              child: pw.Text(
                ' ${other ?? ''}',
                style: pw.TextStyle(
                  fontSize: 9,
                  color: PdfColor.fromHex('#000000'),
                ),
                maxLines: 2,
              ),
            ),
          ],
        ),
      ],
    ),
  );
}

pw.Widget _createBoxedSection(String title, String? content) {
  return pw.Container(
    decoration: pw.BoxDecoration(
      border: pw.Border.all(color: PdfColor.fromHex('#292d96')),
    ),
    child: pw.Column(
      crossAxisAlignment: pw.CrossAxisAlignment.start,
      children: [
        pw.Padding(
          padding: const pw.EdgeInsets.only(left: 5),
          child: pw.Text(
            title,
            style: pw.TextStyle(
              fontSize: 9,
              fontWeight: pw.FontWeight.bold,
              color: PdfColor.fromHex('#292d96'),
            ),
          ),
        ),
        pw.SizedBox(height: 2),
        pw.Container(
          height: 0.5,
          color: PdfColor.fromHex('#292d96'),
          width: double.infinity,
        ),
        pw.SizedBox(height: 5),
        pw.Container(
          width: double.infinity,
          height: 60,
          padding: const pw.EdgeInsets.only(
              left: 5, right: 5, bottom: 2, top: 2), // Sin espacio arriba
          child: pw.Text(
            content ?? '',
            style: pw.TextStyle(
              fontSize: 9,
              color: PdfColor.fromHex('#000000'),
            ),
            softWrap: true,
            overflow: pw.TextOverflow.clip,
          ),
        ),
      ],
    ),
  );
}

// Funcion Hora y Mantenimiento
pw.Widget _createWorkAndMaintenanceSection(
  int? startworkhours,
  int? endtworkhours,
  int? totalworkhours,
  int? maintenancecontract,
  int? numberofvisits,
  bool includeSignatureSpace,
) {
  return pw.Container(
    padding: const pw.EdgeInsets.all(8), // Padding ajustado para ahorro de espacio
    decoration: pw.BoxDecoration(
      border: pw.Border.all(
        color: PdfColor.fromHex('#292d96'),
        width: 1, // Grosor ajustado
      ),
    ),
    child: pw.Column(
      crossAxisAlignment: pw.CrossAxisAlignment.start,
      children: [
        // Sección de Horas Trabajadas
        pw.Row(
          mainAxisAlignment: pw.MainAxisAlignment.start,
          children: [
            pw.Text(
              'Horas Trabajadas:',
              style: pw.TextStyle(
                fontSize: 9, // Reducido el tamaño de la fuente
                color: PdfColor.fromHex('#292d96'),
              ),
            ),
            pw.SizedBox(width: 8),
            pw.Text(
              'Inicio:',
              style: pw.TextStyle(
                fontSize: 9,
                color: PdfColor.fromHex('#292d96'),
              ),
            ),
            pw.SizedBox(width: 8),
            pw.Container(
              width: 70, // Ajustado el ancho para mantener tamaño fijo
              height: 15, // Altura fija para uniformidad
              alignment: pw.Alignment.centerLeft, // Alineación del texto
              padding: const pw.EdgeInsets.all(4),
              decoration: pw.BoxDecoration(
                border: pw.Border.all(
                  color: PdfColor.fromHex('#292d96'),
                  width: 1,
                ),
              ),
              child: pw.Text(
                startworkhours != null && startworkhours.toString().isNotEmpty
                    ? startworkhours.toString()
                    : " ", // Espacio vacío para mantener el tamaño
                style: pw.TextStyle(
                  fontSize: 9,
                  color: PdfColor.fromHex('#000000'),
                ),
              ),
            ),
            pw.SizedBox(width: 15),
            pw.Text(
              'Final:',
              style: pw.TextStyle(
                fontSize: 9,
                color: PdfColor.fromHex('#292d96'),
              ),
            ),
            pw.SizedBox(width: 8),
            pw.Container(
              width: 70,
              height: 15, // Altura fija
              alignment: pw.Alignment.centerLeft,
              padding: const pw.EdgeInsets.all(4),
              decoration: pw.BoxDecoration(
                border: pw.Border.all(
                  color: PdfColor.fromHex('#292d96'),
                  width: 1,
                ),
              ),
              child: pw.Text(
                endtworkhours != null && endtworkhours.toString().isNotEmpty
                    ? endtworkhours.toString()
                    : " ", // Espacio vacío
                style: pw.TextStyle(
                  fontSize: 9,
                  color: PdfColor.fromHex('#000000'),
                ),
              ),
            ),
            pw.SizedBox(width: 15),
            pw.Text(
              'Total:',
              style: pw.TextStyle(
                fontSize: 9,
                color: PdfColor.fromHex('#292d96'),
              ),
            ),
            pw.SizedBox(width: 8),
            pw.Container(
              width: 70,
              height: 15, // Altura fija
              alignment: pw.Alignment.centerLeft,
              padding: const pw.EdgeInsets.all(4),
              decoration: pw.BoxDecoration(
                border: pw.Border.all(
                  color: PdfColor.fromHex('#292d96'),
                  width: 1,
                ),
              ),
              child: pw.Text(
                totalworkhours != null && totalworkhours.toString().isNotEmpty
                    ? totalworkhours.toString()
                    : " ", // Espacio vacío
                style: pw.TextStyle(
                  fontSize: 9,
                  color: PdfColor.fromHex('#000000'),
                ),
              ),
            ),
          ],
        ),
        pw.SizedBox(height: 8), // Reducido el espacio
        pw.Row(
          mainAxisAlignment: pw.MainAxisAlignment.start,
          children: [
            pw.Text(
              'Contrato Mantenimiento Nº:',
              style: pw.TextStyle(
                fontSize: 9,
                color: PdfColor.fromHex('#292d96'),
              ),
            ),
            pw.SizedBox(width: 8),
            pw.Container(
              width: 70,
              height: 15, // Altura fija
              alignment: pw.Alignment.centerLeft,
              padding: const pw.EdgeInsets.all(4),
              decoration: pw.BoxDecoration(
                border: pw.Border.all(
                  color: PdfColor.fromHex('#292d96'),
                  width: 1,
                ),
              ),
              child: pw.Text(
                maintenancecontract != null &&
                    maintenancecontract.toString().isNotEmpty
                    ? maintenancecontract.toString()
                    : " ", // Espacio vacío
                style: pw.TextStyle(
                  fontSize: 9,
                  color: PdfColor.fromHex('#000000'),
                ),
              ),
            ),
            pw.SizedBox(width: 15),
            pw.Text(
              'Nº de Visitas:',
              style: pw.TextStyle(
                fontSize: 9,
                color: PdfColor.fromHex('#292d96'),
              ),
            ),
            pw.SizedBox(width: 8),
            pw.Container(
              width: 70,
              height: 15, // Altura fija
              alignment: pw.Alignment.centerLeft,
              padding: const pw.EdgeInsets.all(4),
              decoration: pw.BoxDecoration(
                border: pw.Border.all(
                  color: PdfColor.fromHex('#292d96'),
                  width: 1,
                ),
              ),
              child: pw.Text(
                numberofvisits != null && numberofvisits.toString().isNotEmpty
                    ? numberofvisits.toString()
                    : " ", // Espacio vacío
                style: pw.TextStyle(
                  fontSize: 9,
                  color: PdfColor.fromHex('#000000'),
                ),
              ),
            ),
          ],
        ),

        pw.SizedBox(height: 8), // Reducido el espacio
        // Sección de Firma
        if (includeSignatureSpace) ...[
          pw.Row(
            mainAxisAlignment: pw.MainAxisAlignment.spaceBetween,
            children: [
              // Espacio para la firma del "Técnico" y el texto debajo
              pw.Column(
                crossAxisAlignment: pw.CrossAxisAlignment.center,
                children: [
                  // Espacio encima de la línea (sin espacio debajo)
                  pw.SizedBox(height: 50),
                  pw.Padding(
                    padding: const pw.EdgeInsets.only(left: 70), // Padding agregado
                    child: pw.Text(
                      '----------------------------------------',
                      style: pw.TextStyle(
                        fontSize: 10,
                        color: PdfColor.fromHex('#292d96'),
                        fontWeight: pw.FontWeight.bold,
                      ),
                    ),
                  ),
                  pw.Padding(
                    padding: const pw.EdgeInsets.only(left: 70), // Padding agregado
                    child: pw.Text(
                      'Técnico TECHNI-HELP', // Texto con "Técnico" + "TECHNI-HELP"
                      style: pw.TextStyle(
                        fontSize: 10,
                        color: PdfColor.fromHex('#292d96'),
                        fontWeight:
                            pw.FontWeight.bold, // Negrita solo "TECHNI-HELP"
                      ),
                    ),
                  ),
                ],
              ),
              // Espacio para la firma del "Responsable del Servicio"
              pw.Column(
                crossAxisAlignment: pw.CrossAxisAlignment.center,
                children: [
                  // Espacio encima de la línea (sin espacio debajo)
                  pw.SizedBox(height: 50),
                  pw.Padding(
                    padding: const pw.EdgeInsets.only(right: 70), // Padding agregado
                    child: pw.Text(
                      '----------------------------------------',
                      style: pw.TextStyle(
                        fontSize: 10,
                        color: PdfColor.fromHex('#292d96'),
                        fontWeight: pw.FontWeight.bold,
                      ),
                    ),
                  ),
                  pw.Padding(
                    padding: const pw.EdgeInsets.only(right: 70), // Padding agregado
                    child: pw.Text(
                      'Responsable del Servicio',
                      style: pw.TextStyle(
                        fontSize: 10,
                        color: PdfColor.fromHex('#292d96'),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
          pw.SizedBox(height: 2), // Espacio entre la firma y el texto
        ],
      ],
    ),
  );
}

Future updatePDF(
  String? clientname,
  String? namebuisness,
  String? addressname,
  String? phone,
  DateTime? iconday,
  String? team,
  String? brand,
  String? model,
  String? serie,
  String? code,
  String? location,
  List<String>? workStatusCheckboxes,
  String? workstatusother,
  String? observations,
  String? recommendations,
  int? startworkhours,
  int? endtworkhours,
  int? totalworkhours,
  int? maintenancecontract,
  int? numberofvisits,
  String? logoUrl,
  String? pdfId, // ID del documento a editar
  bool includeSignatureSpace,
  String category,
  String subcategory,
) async {
  print("=== INICIANDO updatePDF ===");
  print("pdfId recibido: $pdfId");
  print("Categoría seleccionada: $category");
  print("Subcategoría seleccionada: $subcategory");


  Uint8List? logoImage; // Definir la variable logoImage
  if (logoUrl != null && logoUrl.isNotEmpty) {
    try {
      logoImage = await _downloadImage(logoUrl); // Descargar la imagen
      print("Logo descargado correctamente.");
    } catch (e) {
      print("Error al descargar el logo: $e");
    }
  }

  try {
    if (pdfId == null || pdfId.isEmpty) {
      throw Exception("El ID del PDF es nulo o está vacío.");
    }

    print("Buscando el documento específico en Firestore...");
    final docSnapshot = await FirebaseFirestore.instance
        .collection('pdf_files')
        .where('name', isEqualTo: pdfId) // Usa el campo 'name' en lugar de buscar por ID
        .limit(1)
        .get();



    if (docSnapshot.docs.isEmpty) {
      throw Exception("El documento con el nombre $pdfId no existe en Firestore.");
    }
// Usar la referencia del documento encontrado
    final docRef = docSnapshot.docs.first.reference;

    final docData = docSnapshot.docs.first.data(); // Accede a los datos del documento
    final int numrerpot = (docData['numrerpot'] as int?) ?? 0; // Usa docData para acceder a los campos
    final String formattedNumrerpot = '000$numrerpot'; // Asegurar siempre 3 ceros a la izquierda

    print("Número autoincremental recuperado del documento: $numrerpot");


    // Descargar el ícono de check
    final Uint8List checkIcon = await _downloadImage(
        'https://storage.googleapis.com/flutterflow-io-6f20.appspot.com/projects/techni-help-r01zjm/assets/tzcgrc4uehfq/correct-symbol_icon-icons.com_73609.png');

    // Crear el PDF usando buildPdfContent
    final pdf = pw.Document();
    pdf.addPage(
      pw.Page(
        pageFormat: PdfPageFormat.a4,
        margin: const pw.EdgeInsets.all(20),
        build: (pw.Context context) {
          return buildPdfContent(
            logoImage: logoImage,
            formattedNumrerpot: formattedNumrerpot, // Usar el número formateado aquí
            clientname: clientname,
            namebuisness: namebuisness,
            addressname: addressname,
            phone: phone,
            iconday: iconday,
            team: team,
            brand: brand,
            model: model,
            serie: serie,
            code: code,
            location: location,
            workStatusCheckboxes: workStatusCheckboxes,
            workstatusother: workstatusother,
            observations: observations,
            recommendations: recommendations,
            startworkhours: startworkhours,
            endtworkhours: endtworkhours,
            totalworkhours: totalworkhours,
            maintenancecontract: maintenancecontract,
            numberofvisits: numberofvisits,
            checkIcon: checkIcon,
            includeSignatureSpace: includeSignatureSpace,
          );
        },
      ),
    );
    try {
      print("Procesando subcategorías anteriores para eliminar archivos PDF...");

      if (docData.containsKey('listsubcategorys')) {
        final previousSubcategories = List<String>.from(docData['listsubcategorys']);
        final List<String> selectedSubcategories = subcategory.split(',').map((e) => e.trim()).toList();

        // Verifica y elimina archivos que no estén en las nuevas subcategorías
        for (final prevSubcategory in previousSubcategories) {
          if (!selectedSubcategories.contains(prevSubcategory)) {
            final oldPath = 'pdfs/${docData['category']}/$prevSubcategory/$pdfId.pdf';

            try {
              final oldStorageRef = FirebaseStorage.instance.ref().child(oldPath);

              // Intenta eliminar el archivo en la ubicación antigua
              await oldStorageRef.delete();
              print("Archivo PDF eliminado correctamente de: $oldPath");
            } catch (e) {
              print("Error al eliminar archivo en: $oldPath. Detalle: $e");
            }
          }
        }
      } else {
        print("No se encontraron subcategorías anteriores para procesar.");
      }
    }catch (e) {
      print("Error al procesar subcategorías anteriores: $e");
    }




// Guardar el PDF actualizado en Firebase Storage
    print("Guardando el PDF actualizado en Firebase Storage...");
    final Uint8List pdfBytes = await pdf.save();

// Validar que las categorías no estén vacías
    if (category.isEmpty || subcategory.isEmpty) {
      throw Exception("Las categorías no pueden estar vacías.");
    }

    // Subir archivos a las subcategorías seleccionadas
    final List<String> selectedSubcategories = subcategory.split(',').map((e) => e.trim()).toList();

    for (final selectedSubcategory in selectedSubcategories) {
      final path = 'pdfs/$category/$selectedSubcategory/$pdfId.pdf';
      print("Ruta de almacenamiento del PDF: $path");
      final storageRef = FirebaseStorage.instance.ref().child(path);

      // Subir el archivo a la carpeta correspondiente
      await storageRef.putData(pdfBytes);
      print("Archivo subido correctamente a: $path");
    }



// Obtener la nueva URL del archivo desde la primera subcategoría seleccionada
    final String newDownloadURL = await FirebaseStorage.instance
        .ref()
        .child('pdfs/$category/${selectedSubcategories.first}/$pdfId.pdf')
        .getDownloadURL();

    final Map<String, dynamic> updatedData = {
      'clientname': clientname ?? '',
      'namebuisness': namebuisness ?? '',
      'addressname': addressname ?? '',
      'phone': phone ?? '',
      'iconday': iconday?.toIso8601String(),
      'team': team ?? '',
      'brand': brand ?? '',
      'model': model ?? '',
      'serie': serie ?? '',
      'code': code ?? '',
      'location': location ?? '',
      'workStatusCheckboxes': workStatusCheckboxes ?? [],
      'workstatusother': workstatusother ?? '',
      'observations': observations ?? '',
      'recommendations': recommendations ?? '',
      'startworkhours': startworkhours ?? '',
      'endtworkhours': endtworkhours ?? '',
      'totalworkhours': totalworkhours ?? '',
      'maintenancecontract': maintenancecontract ?? '',
      'numberofvisits': numberofvisits ?? '',
          };

    await updatePdfData(pdfId: pdfId!, updatedData: updatedData);


    await docRef.update({
      'url': newDownloadURL,
      'category': category,
      'listsubcategorys': selectedSubcategories, // Actualiza con las subcategorías seleccionadas
    });
    print("Firestore actualizado correctamente con la nueva información.");



// Actualizar categoría y subcategoría en la colección Categorys
    print("Actualizando categoría y subcategoría en la colección Categorys...");

    try {
      final String newPath = 'pdfs/$category/${selectedSubcategories.join("/")}/$pdfId.pdf';

      await docRef.update({
        'path': newPath, // Actualiza el campo path
      });

      print("Campo `path` actualizado correctamente en `pdf_files/$pdfId`: $newPath");
    } catch (e) {
      print("Error al actualizar el campo `path` en `pdf_files/$pdfId`: $e");
    }

    try {
      final categorySnapshot = await FirebaseFirestore.instance
          .collection('Categorys')
          .where('category', isEqualTo: category)
          .limit(1)
          .get();

      if (categorySnapshot.docs.isNotEmpty) {
        final categoryDocRef = categorySnapshot.docs.first.reference;
        final existingSubcategories =
        List<String>.from(categorySnapshot.docs.first.data()['listsubcategorys'] ?? []);
        final updatedSubcategories = existingSubcategories.toSet()..addAll(selectedSubcategories);

        await categoryDocRef.update({
          'listsubcategorys': updatedSubcategories.toList(),
        });

        print("Categoría y subcategorías actualizadas correctamente en la colección Categorys.");
      } else {
        await FirebaseFirestore.instance.collection('Categorys').add({
          'category': category,
          'listsubcategorys': selectedSubcategories,
        });
        print("Nueva categoría creada con subcategorías en la colección Categorys.");
      }
    } catch (e) {
      print("Error al actualizar la categoría y subcategoría: $e");
    }

    // Descargar el archivo en el dispositivo móvil
    await _downloadPdfInMobile(
        pdfBytes, 'reporte_mantenimiento_actualizado.pdf');

    print("PDF actualizado correctamente con el número de reporte: $numrerpot");
  } catch (e) {
    print("Error al actualizar el PDF: $e");
  }
}

Future<void> _downloadPdfInMobile(Uint8List data, String fileName) async {
  try {
    // Solicitar permisos de almacenamiento (solo necesario en Android)
    if (Platform.isAndroid) {
      final status = await Permission.storage.request();
      if (!status.isGranted) {
        print("Permiso de almacenamiento denegado.");
        return; // Salir si el permiso es denegado
      }
    }

    // Obtener el directorio adecuado para guardar el archivo
    Directory? directory;
    if (Platform.isAndroid) {
      directory =
          await getExternalStorageDirectory(); // Directorio de almacenamiento externo
    } else if (Platform.isIOS) {
      directory =
          await getApplicationDocumentsDirectory(); // Directorio para iOS
    }

    if (directory == null) {
      print("No se pudo obtener el directorio para guardar el archivo.");
      return;
    }

    // Crear la ruta completa del archivo
    final filePath = '${directory.path}/$fileName';
    final file = File(filePath);

    // Escribir los datos en el archivo
    await file.writeAsBytes(data);

    print("PDF guardado en: $filePath");

    // Opcional: Notificar al usuario sobre la descarga completada
    // Podrías usar flutter_local_notifications para notificaciones
  } catch (e) {
    print("Error al guardar el PDF en el dispositivo: $e");
  }
} // Función para descargar una imagen desde una URL

Future<Uint8List> _downloadImage(String url) async {
  try {
    // Realizar la solicitud HTTP para obtener la imagen
    final response = await http.get(Uri.parse(url));
    if (response.statusCode == 200) {
      // Retornar los bytes de la imagen si la solicitud fue exitosa
      return response.bodyBytes;
    } else {
      throw Exception(
          "Error al descargar la imagen. Código de estado: ${response.statusCode}");
    }
  } catch (e) {
    throw Exception("Error al descargar la imagen desde $url: $e");
  }
}

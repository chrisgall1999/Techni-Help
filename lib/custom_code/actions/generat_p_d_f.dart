// Automatic FlutterFlow imports
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_util.dart';
// Imports other custom actions
import 'package:flutter/material.dart';
// Begin custom action code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;
import 'package:http/http.dart' as http;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'dart:io'; // Para Platform, Directory, File
import 'package:dio/dio.dart';
import 'package:open_file/open_file.dart';
import 'package:path_provider/path_provider.dart'; // Para obtener directorios
import 'package:permission_handler/permission_handler.dart'; // Para manejar permisos en Android

import 'package:cloud_functions/cloud_functions.dart';

Future<int> getNextNumrerpot() async {
  try {
    // Llamar a la función de Firebase
    final functions = FirebaseFunctions.instance;
    final result = await functions.httpsCallable('generateReport').call();

    // Obtener el número de reporte generado desde Firebase
    final nextNumber = result.data['nextNumber'];

    print('Número de reporte generado desde Firebase: $nextNumber');
    return nextNumber;
  } catch (e) {
    print('Error al obtener el siguiente número de reporte desde Firebase: $e');
    throw e; // Puedes manejar este error en la UI si es necesario
  }
}



Future<void> getNextNumrerpotAndStoreData(
    String category,
    List<String> listsubcategorys, {
      required String docName,  // 🔥 Recibe `docName` como parámetro
      Map<String, dynamic>? documentData,
    }) async {
  try {
    final firestore = FirebaseFirestore.instance;

    // Recuperar el número de reporte generado previamente
    final counterRef = firestore.collection('counters').doc('counter_pdf');
    final counterSnapshot = await counterRef.get();

    int nextNum = 1; // Valor predeterminado en caso de error

    if (counterSnapshot.exists) {
      nextNum = counterSnapshot.data()?['last_numrerpot'] ?? 1;
    }

    print("Usando numrerpot existente: $nextNum");

    // Guardar en `pdf_update` con el mismo `docName`
    if (documentData != null) {
      print('Fecha recibida en getNextNumrerpotAndStoreData (iconday): ${documentData['iconday']}');

      final pdfUpdateRef = firestore.collection('pdf_update').doc(docName);
      await pdfUpdateRef.set({
        'numrerpot': nextNum,
        'category': category,
        'listsubcategorys': listsubcategorys,
        ...documentData, // Agregar datos adicionales
        'iconday': documentData['iconday'], // Guarda la fecha directamente

      });
      print("Datos guardados en `pdf_update/$docName`.");
    } else {
      print("No se proporcionaron datos adicionales para guardar en `pdf_update`.");
    }
  } catch (e) {
    print('Error al guardar los datos en pdf_update: $e');
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
  required bool includeSignatureSpace, // Nuevo parámetro agregado
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
                          phone!,// Convierte el número a cadena si no es null
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
                    padding: const pw.EdgeInsets.only(top: 5, left: 5, bottom: 5), // Padding para el título
                    child: pw.Text(
                      'CÓDIGO:',
                      style: pw.TextStyle(
                        fontSize: 9,
                        color: PdfColor.fromHex('#292d96'), // Azul para el texto "CÓDIGO:"
                      ),
                    ),
                  ),
                  code != null
                      ? pw.Padding(
                    padding: const pw.EdgeInsets.only(top: 5, left: 5, bottom: 5),
                    child: pw.Text(
                      code, // Muestra el código si no es null
                      style: pw.TextStyle(
                        fontSize: 9,
                        color: PdfColor.fromHex('#000000'), // Negro para la variable del código
                      ),
                    ),
                  )
                      : pw.SizedBox(width: 50), // Espacio fijo si no hay código

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
        includeSignatureSpace, // Pasamos el valor aquí
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
    bool includeSignatureSpace, // Agregado como parámetro
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

// Funcion Principal
Future generatPDF(
    BuildContext context, // Agrega este parámetro
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
    String logoUrl,
    bool includeSignatureSpace,
    String category,
    List<String> listsubcategorys, // Lista de subcategorías seleccionada
    ) async {
  try {

    // Recolectar datos para enviar a Firestore
    final Map<String, dynamic> documentData = {
      'clientname': clientname ?? '',
      'namebuisness': namebuisness ?? '',
      'addressname': addressname ?? '',
      'phone': phone ?? '',
      'iconday': iconday?.toIso8601String() ?? DateTime.now().toIso8601String(), // Guarda como cadena
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

    // 1️⃣ **Obtener el próximo número de reporte antes de generar el `docName`**
    final nextNumrerpot = await getNextNumrerpot();

    // 2️⃣ **Generar `docName` antes de llamar a `getNextNumrerpotAndStoreData`**
    final String formattedNumber = nextNumrerpot.toString().padLeft(5, '0'); // Asegura 5 dígitos
    final String timestamp = DateTime.now().millisecondsSinceEpoch.toString();
    final String docName = 'reporte_mantenimiento_${formattedNumber}_$timestamp';

    print('Nombre del documento generado: $docName');



    // 3️⃣ **Guardar en `pdf_update` con el mismo `docName`**
    print('Fecha seleccionada por el usuario (iconday): $iconday');

    await getNextNumrerpotAndStoreData(
      category,
      listsubcategorys,
      docName: docName,  // Pasamos el `docName` generado
      documentData: documentData,
    );

    // Crea una ruta única para el PDF
    final String path = 'pdfs/$category/${listsubcategorys.join("/")}/$docName.pdf';
    print('Generando ruta para el PDF: $path');

    // Crear el PDF
    final pdf = pw.Document();
    workStatusCheckboxes ??= [];

//Crea una ruta en la carpeta pdfs con el nombre fijo reporte_mantenimiento.pdf.
    Future<void> uploadPdfToFirebaseStorage(
        Uint8List pdfData,
        String category, // Categoría principal
        List<String> listsubcategorys, // Lista de subcategorías
        String docName, // Nombre del documento
        ) async {
      try {
        // Construir la ruta basada en categorías y subcategorías
        final path = 'pdfs/$category/${listsubcategorys.join("/")}/$docName.pdf';

        // Crear una referencia al archivo en Firebase Storage
        final storageRef = FirebaseStorage.instance.ref().child(path);

        // Subir el archivo
        await storageRef.putData(pdfData);

        // Obtener la URL del archivo subido
        final downloadUrl = await storageRef.getDownloadURL();

        // Guardar los detalles del archivo en Firestore, ahora con la URL
        await FirebaseFirestore.instance.collection('pdf_files').doc(docName).set({
          'numrerpot': nextNumrerpot,
          'name': docName,
          'category': category,
          'listsubcategorys': listsubcategorys,
          'url': downloadUrl,
          'timestamp': FieldValue.serverTimestamp(),
          'path': path,
        }, SetOptions(merge: true));


        print('Documento guardado en pdf_files: $docName con numrerpot: $nextNumrerpot');
      } catch (e) {
        print('Error al subir el PDF o guardar en Firestore: $e');
      }
    }


    // Descargar logo y el ícono del check
    Uint8List? logoImage;
    Uint8List? checkIcon;
    if (logoUrl.isNotEmpty) {
      logoImage = await _downloadImage(logoUrl);
    }
    checkIcon = await _downloadImage(
        'https://storage.googleapis.com/flutterflow-io-6f20.appspot.com/projects/techni-help-r01zjm/assets/tzcgrc4uehfq/correct-symbol_icon-icons.com_73609.png');
    // LLamado a la funcion global de diseño
    pdf.addPage(
      pw.Page(
        pageFormat: PdfPageFormat.a4,
        margin: const pw.EdgeInsets.all(20),
        build: (pw.Context context) {
          return buildPdfContent(
            logoImage: logoImage,
            formattedNumrerpot: '000$nextNumrerpot', // Reemplazado aquí
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
            includeSignatureSpace:
            includeSignatureSpace, // Aquí pasamos el valor
          );
        },
      ),
    );

    // Descargar el PDF
    final data = await pdf.save();

    // Móvil: guardar en almacenamiento local
    await _downloadPdfInMobile(context, data, '$docName.pdf');


    // Subir el PDF a Firebase Storage con la estructura jerárquica
    print('Subiendo archivo con nombre: $docName');
    await uploadPdfToFirebaseStorage(
      data,
      category,
      listsubcategorys, // Convierte la lista de subcategorías en una estructura de ruta
      docName, // Nombre del archivo
    );


    print('PDF generado, descargado y subido correctamente.');
  } catch (e) {
    print('Error al generar el PDF: $e');
  }
}

// Descargar la imagen (logo o ícono)
Future<Uint8List?> _downloadImage(String url) async {
  try {
    final response = await http.get(Uri.parse(url));
    if (response.statusCode == 200) {
      return response.bodyBytes;
    }
    return null;
  } catch (e) {
    print('Error al descargar imagen: $e');
    return null;
  }
}

Future<void> _downloadPdfInMobile(
    BuildContext context, Uint8List data, String filename) async {
  try {
    // Obtener permisos en Android
    if (Platform.isAndroid) {
      final status = await Permission.storage.request();

      if (status.isPermanentlyDenied) {
        // Mostrar un cuadro de diálogo si el permiso está permanentemente denegado
        showDialog(
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
              title: const Text("Permiso necesario"),
              content: const Text(
                  "Por favor, activa el permiso de almacenamiento en la configuración para guardar archivos."),
              actions: [
                TextButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  child: const Text("OK"),
                ),
              ],
            );
          },
        );
        return;
      } else if (!status.isGranted) {
        print("Permiso de almacenamiento denegado.");
        return;
      }
    }

    // Obtener el directorio donde guardar el archivo
    final directory = await getApplicationDocumentsDirectory();
    final filePath = "${directory.path}/$filename";

    // Escribir directamente los datos en el archivo local
    final file = File(filePath);
    await file.writeAsBytes(data);

    print("PDF guardado correctamente en: $filePath");

    // Abrir el archivo después de guardarlo
    await openDownloadedFile(filePath);
  } catch (e) {
    print("Error al guardar o abrir el PDF: $e");
  }
}

Future<void> openDownloadedFile(String filePath) async {
  final result = await OpenFile.open(filePath);
  if (result.type != ResultType.done) {
    print("Error al abrir el archivo: ${result.message}");
  }
}

Future<void> downloadPdfFromFirebase(String url, String fileName) async {
  try {
    final dio = Dio();
    final directory = await getApplicationDocumentsDirectory();
    final filePath = "${directory.path}/$fileName";

    // Descargar el archivo desde Firebase Storage
    print("Iniciando descarga desde Firebase...");
    await dio.download(url, filePath);

    print("PDF descargado correctamente en: $filePath");

    // Abrir el archivo después de la descarga
    await openDownloadedFile(filePath);
  } catch (e) {
    print("Error al descargar el PDF desde Firebase: $e");
  }
}

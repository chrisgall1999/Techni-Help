import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/custom_code/widgets/index.dart' as custom_widgets;
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'preview_p_d_f_model.dart';
export 'preview_p_d_f_model.dart';

class PreviewPDFWidget extends StatefulWidget {
  const PreviewPDFWidget({super.key});

  @override
  State<PreviewPDFWidget> createState() => _PreviewPDFWidgetState();
}

class _PreviewPDFWidgetState extends State<PreviewPDFWidget>
    with TickerProviderStateMixin {
  late PreviewPDFModel _model;

  // variables para los controladores del filtrado
  TextEditingController searchController = TextEditingController();
  DateTime? selectedDate;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  final animationsMap = <String, AnimationInfo>{};

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => PreviewPDFModel());

    animationsMap.addAll({
      'containerOnActionTriggerAnimation1': AnimationInfo(
        trigger: AnimationTrigger.onActionTrigger,
        applyInitialState: true,
        effectsBuilder: () => [
          FadeEffect(
            curve: Curves.easeInOut,
            delay: 0.0.ms,
            duration: 500.0.ms,
            begin: 1.0,
            end: 1.0,
          ),
          MoveEffect(
            curve: Curves.easeInOut,
            delay: 0.0.ms,
            duration: 600.0.ms,
            begin: const Offset(0.0, 0.0),
            end: const Offset(300.0, 0.0),
          ),
          ScaleEffect(
            curve: Curves.easeInOut,
            delay: 0.0.ms,
            duration: 500.0.ms,
            begin: const Offset(1.0, 1.0),
            end: const Offset(0.7, 0.7),
          ),
          TiltEffect(
            curve: Curves.easeInOut,
            delay: 0.0.ms,
            duration: 500.0.ms,
            begin: const Offset(0, 0),
            end: const Offset(0, 0.349),
          ),
        ],
      ),
      'containerOnActionTriggerAnimation2': AnimationInfo(
        trigger: AnimationTrigger.onActionTrigger,
        applyInitialState: true,
        effectsBuilder: () => [
          MoveEffect(
            curve: Curves.easeInOut,
            delay: 0.0.ms,
            duration: 600.0.ms,
            begin: const Offset(0.0, 0.0),
            end: const Offset(300.0, 0.0),
          ),
          ScaleEffect(
            curve: Curves.easeInOut,
            delay: 0.0.ms,
            duration: 500.0.ms,
            begin: const Offset(1.0, 1.0),
            end: const Offset(0.7, 0.7),
          ),
          TiltEffect(
            curve: Curves.easeInOut,
            delay: 0.0.ms,
            duration: 500.0.ms,
            begin: const Offset(0, 0),
            end: const Offset(0, 0.349),
          ),
        ],
      ),
    });
    setupAnimations(
      animationsMap.values.where((anim) =>
          anim.trigger == AnimationTrigger.onActionTrigger ||
          !anim.applyInitialState),
      this,
    );
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<List<PdfFilesRecord>>(
      stream: queryPdfFilesRecord(
        queryBuilder: (pdfFilesRecord) {
          // Filtro por texto solo si searchController tiene algún valor
          if (searchController.text.isNotEmpty) {
            print('Filtrando por texto: ${searchController.text}');
            pdfFilesRecord = pdfFilesRecord.where(
              'name',
              isGreaterThanOrEqualTo: searchController.text,
              isLessThanOrEqualTo: searchController.text + '\uf8ff',
            );
          } else {
            print('No se aplica filtro por texto, ya que searchController está vacío.');
          }

          // Filtro por fecha solo si selectedDate tiene un valor
          if (selectedDate != null) {
            // Normalizamos la fecha seleccionada para el inicio del día
            DateTime normalizedDate = DateTime(selectedDate!.year, selectedDate!.month, selectedDate!.day);
            DateTime endOfDay = normalizedDate.add(Duration(days: 1)).subtract(Duration(microseconds: 1)); // Fin del día

            print("Filtrando por fecha:");
            print("Desde: ${normalizedDate} hasta: ${endOfDay}");

            // Asegúrate de que el campo 'timestamp' sea un Timestamp
            pdfFilesRecord = pdfFilesRecord.where(
              'timestamp',
              isGreaterThanOrEqualTo: Timestamp.fromDate(normalizedDate),
              isLessThanOrEqualTo: Timestamp.fromDate(endOfDay),
            );
          } else {
            print('No se aplica filtro por fecha, ya que selectedDate está vacío.');
          }

          return pdfFilesRecord;
        },
      ),
      builder: (context, snapshot) {
        // Manejar los datos del snapshot
        if (!snapshot.hasData) {
          return Center(child: CircularProgressIndicator());
        }

        List<PdfFilesRecord> filteredList = snapshot.data!;

        print('Lista de PDFs filtrada y ordenada por fecha: $filteredList');

        return Scaffold(
          key: scaffoldKey,
          body: Stack(
            children: [
              Container(
                constraints: const BoxConstraints(
                  maxWidth: 500.0,
                ),
                decoration: const BoxDecoration(),
                child: InkWell(
                  splashColor: Colors.transparent,
                  focusColor: Colors.transparent,
                  hoverColor: Colors.transparent,
                  highlightColor: Colors.transparent,
                  onTap: () async {
                    if (animationsMap['containerOnActionTriggerAnimation1'] !=
                        null) {
                      animationsMap['containerOnActionTriggerAnimation1']!
                          .controller
                          .forward()
                          .whenComplete(animationsMap[
                                  'containerOnActionTriggerAnimation1']!
                              .controller
                              .reverse);
                    }
                    if (animationsMap['containerOnActionTriggerAnimation2'] !=
                        null) {
                      animationsMap['containerOnActionTriggerAnimation2']!
                          .controller
                          .forward()
                          .whenComplete(animationsMap[
                                  'containerOnActionTriggerAnimation2']!
                              .controller
                              .reverse);
                    }
                  },
                  child: Container(
                    width: MediaQuery.sizeOf(context).width * 1.0,
                    height: MediaQuery.sizeOf(context).height * 1.0,
                    decoration: const BoxDecoration(),
                    child: Padding(
                      padding:
                          const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 120.0, 0.0),
                      child: SingleChildScrollView(
                        child: Column(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(top: 40.0, left: 16.0, right: 16.0), // Padding solo arriba
                              child: SingleChildScrollView(
                                scrollDirection: Axis.horizontal,  // Permite el desplazamiento horizontal
                                child: Row(
                                  children: [
                                    AuthUserStreamWidget(
                                      builder: (context) => ClipRRect(
                                        borderRadius: BorderRadius.circular(30.0),
                                        child: Image.network(
                                          currentUserPhoto,
                                          width: 70.0,
                                          height: 70.0,
                                          fit: BoxFit.cover,
                                        ),
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsetsDirectional.fromSTEB(10.0, 0.0, 0.0, 0.0),
                                      child: Column(
                                        mainAxisSize: MainAxisSize.max,
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: [
                                          AuthUserStreamWidget(
                                            builder: (context) => Text(
                                              currentUserDisplayName,
                                              style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                fontFamily: 'Inter',
                                                color: Colors.black,
                                                fontSize: 20.0,
                                                fontWeight: FontWeight.bold,
                                              ),
                                            ),
                                          ),
                                          Text(
                                            'Bienvenido ',
                                            style: FlutterFlowTheme.of(context).bodyMedium.override(
                                              fontFamily: 'Inter',
                                              fontSize: 15.0,
                                              fontWeight: FontWeight.w500,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),

                            Align(
                              alignment: const AlignmentDirectional(-1.0, 0.0),
                              child: Padding(
                                padding: const EdgeInsets.all(16.0),
                                child: Text(
                                  'Navegador',
                                  style: FlutterFlowTheme.of(context)
                                      .bodyMedium
                                      .override(
                                        fontFamily: 'Inter',
                                        letterSpacing: 0.0,
                                        fontWeight: FontWeight.bold,
                                      ),
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsetsDirectional.fromSTEB(
                                  16.0, 16.0, 6.0, 16.0),
                              child: InkWell(
                                splashColor: Colors.transparent,
                                focusColor: Colors.transparent,
                                hoverColor: Colors.transparent,
                                highlightColor: Colors.transparent,
                                onTap: () async {
                                  context.pushNamed('Content');
                                },
                                child: Container(
                                  width: double.infinity,
                                  height: 70.0,
                                  decoration: const BoxDecoration(
                                    color: Color(0xFF8FB0ED),
                                    borderRadius: BorderRadius.only(
                                      bottomLeft: Radius.circular(8.0),
                                      bottomRight: Radius.circular(8.0),
                                      topLeft: Radius.circular(8.0),
                                      topRight: Radius.circular(8.0),
                                    ),
                                  ),
                                  child: Row(
                                    mainAxisSize: MainAxisSize.max,
                                    children: [
                                      const Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            16.0, 0.0, 16.0, 0.0),
                                        child: Icon(
                                          Icons.repeat_on_sharp,
                                          color: Colors.white,
                                          size: 24.0,
                                        ),
                                      ),
                                      Text(
                                        'Generar Reporte',
                                        style: FlutterFlowTheme.of(context)
                                            .bodyMedium
                                            .override(
                                              fontFamily: 'Inter',
                                              color: Colors.white,
                                              letterSpacing: 0.0,
                                            ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsetsDirectional.fromSTEB(
                                  16.0, 16.0, 6.0, 16.0),
                              child: InkWell(
                                splashColor: Colors.transparent,
                                focusColor: Colors.transparent,
                                hoverColor: Colors.transparent,
                                highlightColor: Colors.transparent,
                                onTap: () async {
                                  context.pushNamed('ViewPDF');
                                },
                                child: Container(
                                  width: double.infinity,
                                  height: 70.0,
                                  decoration: const BoxDecoration(
                                    color: Color(0xFF8FB0ED),
                                    borderRadius: BorderRadius.only(
                                      bottomLeft: Radius.circular(8.0),
                                      bottomRight: Radius.circular(8.0),
                                      topLeft: Radius.circular(8.0),
                                      topRight: Radius.circular(8.0),
                                    ),
                                  ),
                                  child: Row(
                                    mainAxisSize: MainAxisSize.max,
                                    children: [
                                      const Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            16.0, 0.0, 16.0, 0.0),
                                        child: Icon(
                                          Icons.picture_as_pdf_outlined,
                                          color: Colors.white,
                                          size: 24.0,
                                        ),
                                      ),
                                      Text(
                                        'Reportes PDF',
                                        style: FlutterFlowTheme.of(context)
                                            .bodyMedium
                                            .override(
                                              fontFamily: 'Inter',
                                              color: Colors.white,
                                              letterSpacing: 0.0,
                                            ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsetsDirectional.fromSTEB(
                                  16.0, 16.0, 6.0, 16.0),
                              child: InkWell(
                                splashColor: Colors.transparent,
                                focusColor: Colors.transparent,
                                hoverColor: Colors.transparent,
                                highlightColor: Colors.transparent,
                                onTap: () async {
                                  context.pushNamed('previewPDF');
                                },
                                child: Container(
                                  width: double.infinity,
                                  height: 70.0,
                                  decoration: const BoxDecoration(
                                    color: Color(0xFF8FB0ED),
                                    borderRadius: BorderRadius.only(
                                      bottomLeft: Radius.circular(8.0),
                                      bottomRight: Radius.circular(8.0),
                                      topLeft: Radius.circular(8.0),
                                      topRight: Radius.circular(8.0),
                                    ),
                                  ),
                                  child: Row(
                                    mainAxisSize: MainAxisSize.max,
                                    children: [
                                      const Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            16.0, 0.0, 16.0, 0.0),
                                        child: Icon(
                                          Icons.preview_rounded,
                                          color: Colors.white,
                                          size: 24.0,
                                        ),
                                      ),
                                      Text(
                                        'Previsualizaciones',
                                        style: FlutterFlowTheme.of(context)
                                            .bodyMedium
                                            .override(
                                              fontFamily: 'Inter',
                                              color: Colors.white,
                                              letterSpacing: 0.0,
                                            ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsetsDirectional.fromSTEB(
                                  16.0, 16.0, 6.0, 16.0),
                              child: InkWell(
                                splashColor: Colors.transparent,
                                focusColor: Colors.transparent,
                                hoverColor: Colors.transparent,
                                highlightColor: Colors.transparent,
                                onTap: () async {
                                  context.pushNamed('Category');
                                },
                                child: Container(
                                  width: double.infinity,
                                  height: 70.0,
                                  decoration: const BoxDecoration(
                                    color: Color(0xFF8FB0ED),
                                    borderRadius: BorderRadius.only(
                                      bottomLeft: Radius.circular(8.0),
                                      bottomRight: Radius.circular(8.0),
                                      topLeft: Radius.circular(8.0),
                                      topRight: Radius.circular(8.0),
                                    ),
                                  ),
                                  child: Row(
                                    mainAxisSize: MainAxisSize.max,
                                    children: [
                                      const Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            16.0, 0.0, 16.0, 0.0),
                                        child: Icon(
                                          Icons.category_rounded,
                                          color: Colors.white,
                                          size: 24.0,
                                        ),
                                      ),
                                      Text(
                                        'Categorias & Subcategorias',
                                        style: FlutterFlowTheme.of(context)
                                            .bodyMedium
                                            .override(
                                              fontFamily: 'Inter',
                                              color: Colors.white,
                                              letterSpacing: 0.0,
                                            ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsetsDirectional.fromSTEB(
                                  16.0, 16.0, 6.0, 16.0),
                              child: InkWell(
                                splashColor: Colors.transparent,
                                focusColor: Colors.transparent,
                                hoverColor: Colors.transparent,
                                highlightColor: Colors.transparent,
                                onTap: () async {
                                  context.pushNamed('Folder');
                                },
                                child: Container(
                                  width: double.infinity,
                                  height: 70.0,
                                  decoration: const BoxDecoration(
                                    color: Color(0xFF8FB0ED),
                                    borderRadius: BorderRadius.only(
                                      bottomLeft: Radius.circular(8.0),
                                      bottomRight: Radius.circular(8.0),
                                      topLeft: Radius.circular(8.0),
                                      topRight: Radius.circular(8.0),
                                    ),
                                  ),
                                  child: Row(
                                    mainAxisSize: MainAxisSize.max,
                                    children: [
                                      const Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            16.0, 0.0, 16.0, 0.0),
                                        child: Icon(
                                          Icons.picture_as_pdf_outlined,
                                          color: Colors.white,
                                          size: 24.0,
                                        ),
                                      ),
                                      Text(
                                        'Carpetas',
                                        style: FlutterFlowTheme.of(context)
                                            .bodyMedium
                                            .override(
                                              fontFamily: 'Inter',
                                              color: Colors.white,
                                              letterSpacing: 0.0,
                                            ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                            Align(
                              alignment: const AlignmentDirectional(-1.0, 0.0),
                              child: Padding(
                                padding: const EdgeInsets.all(16.0),
                                child: Text(
                                  'Configuraciones',
                                  style: FlutterFlowTheme.of(context)
                                      .bodyMedium
                                      .override(
                                        fontFamily: 'Inter',
                                        letterSpacing: 0.0,
                                        fontWeight: FontWeight.bold,
                                      ),
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsetsDirectional.fromSTEB(
                                  16.0, 16.0, 6.0, 16.0),
                              child: InkWell(
                                splashColor: Colors.transparent,
                                focusColor: Colors.transparent,
                                hoverColor: Colors.transparent,
                                highlightColor: Colors.transparent,
                                onTap: () async {
                                  context.pushNamed('Perfi');
                                },
                                child: Container(
                                  width: double.infinity,
                                  height: 70.0,
                                  decoration: const BoxDecoration(
                                    color: Color(0xFF8FB0ED),
                                    borderRadius: BorderRadius.only(
                                      bottomLeft: Radius.circular(8.0),
                                      bottomRight: Radius.circular(8.0),
                                      topLeft: Radius.circular(8.0),
                                      topRight: Radius.circular(8.0),
                                    ),
                                  ),
                                  child: Row(
                                    mainAxisSize: MainAxisSize.max,
                                    children: [
                                      const Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            16.0, 0.0, 16.0, 0.0),
                                        child: Icon(
                                          Icons.person,
                                          color: Colors.white,
                                          size: 24.0,
                                        ),
                                      ),
                                      Text(
                                        'Perfil',
                                        style: FlutterFlowTheme.of(context)
                                            .bodyMedium
                                            .override(
                                              fontFamily: 'Inter',
                                              color: Colors.white,
                                              letterSpacing: 0.0,
                                            ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                            Align(
                              alignment: const AlignmentDirectional(-1.0, 0.0),
                              child: Padding(
                                padding: const EdgeInsets.all(16.0),
                                child: FFButtonWidget(
                                  onPressed: () async {
                                    GoRouter.of(context).prepareAuthEvent();
                                    await authManager.signOut();
                                    GoRouter.of(context)
                                        .clearRedirectLocation();

                                    context.goNamedAuth(
                                        'Login', context.mounted);
                                  },
                                  text: 'Salir',
                                  icon: const Icon(
                                    Icons.exit_to_app,
                                    size: 15.0,
                                  ),
                                  options: FFButtonOptions(
                                    height: 40.0,
                                    padding: const EdgeInsetsDirectional.fromSTEB(
                                        16.0, 0.0, 16.0, 0.0),
                                    iconPadding: const EdgeInsetsDirectional.fromSTEB(
                                        0.0, 0.0, 0.0, 0.0),
                                    color: const Color(0xFF8FB0ED),
                                    textStyle: FlutterFlowTheme.of(context)
                                        .titleSmall
                                        .override(
                                          fontFamily: 'Inter Tight',
                                          color: Colors.white,
                                          letterSpacing: 0.0,
                                        ),
                                    elevation: 0.0,
                                    borderRadius: BorderRadius.circular(8.0),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              Stack(
                children: [
                  Container(
                    width: MediaQuery.sizeOf(context).width * 1.0,
                    decoration: const BoxDecoration(),
                  ).animateOnActionTrigger(
                    animationsMap['containerOnActionTriggerAnimation1']!,
                  ),
                  Container(
                    decoration: const BoxDecoration(
                      color: Colors.white,
                    ),
                    child: Align(
                      alignment: const AlignmentDirectional(0.0, 0.0),
                      child: SingleChildScrollView(
                       child: Column(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Row(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              Padding(
                                padding: const EdgeInsetsDirectional.fromSTEB(
                                    20.0, 60.0, 0.0, 10.0),
                                child: FlutterFlowIconButton(
                                  borderRadius: 8.0,
                                  buttonSize: 40.0,
                                  fillColor:
                                      FlutterFlowTheme.of(context).primary,
                                  icon: Icon(
                                    Icons.menu_sharp,
                                    color: FlutterFlowTheme.of(context).info,
                                    size: 24.0,
                                  ),
                                  onPressed: () async {
                                    if (animationsMap[
                                            'containerOnActionTriggerAnimation1'] !=
                                        null) {
                                      animationsMap[
                                              'containerOnActionTriggerAnimation1']!
                                          .controller
                                          .forward();
                                    }
                                    if (animationsMap[
                                            'containerOnActionTriggerAnimation2'] !=
                                        null) {
                                      animationsMap[
                                              'containerOnActionTriggerAnimation2']!
                                          .controller
                                          .forward();
                                    }
                                  },
                                ),
                              ),
                            ],
                          ),
                          Padding(
                            padding: const EdgeInsets.all(16.0),
                            child: Row(
                              children: [
                                Expanded(
                                  child: TextField(
                                    controller: searchController,
                                    decoration: InputDecoration(
                                      labelText: 'Buscar Reporte',
                                      border: OutlineInputBorder(),
                                      prefixIcon: Icon(Icons.search),
                                    ),
                                  ),
                                ),
                                // Icono para seleccionar la fecha
                                IconButton(
                                  icon: Icon(Icons.calendar_today),
                                  onPressed: () async {
                                    DateTime? picked = await showDatePicker(
                                      context: context,
                                      initialDate: DateTime.now(),
                                      firstDate: DateTime(2000),
                                      lastDate: DateTime(2101),
                                    );
                                  },
                                ),
                                if (selectedDate != null)
                                  Text(
                                    '${selectedDate?.toLocal()}'.split(' ')[0],
                                    style: TextStyle(fontSize: 16),
                                  ),
                              ],
                            ),
                          ),
                          SizedBox(
                            width: MediaQuery.sizeOf(context).width * 1.0,
                            height: MediaQuery.sizeOf(context).height * 1.0,
                            child: custom_widgets.PDFListViewer(
                              width: MediaQuery.sizeOf(context).width * 1.0,
                              height: MediaQuery.sizeOf(context).height * 1.0,
                              pdfUrls: filteredList.map((e) => e.url).toList(),
                              pdfNames: filteredList.map((e) => e.name).toList(),
                              // Convertir DateTime a Timestamp antes de pasarlos
                              pdfTimestamps: filteredList.map((e) => Timestamp.fromDate(e.timestamp!)).toList(),
                            ),
                          )
                        ],
                      ),
                     ),
                    ),
                  ).animateOnActionTrigger(
                    animationsMap['containerOnActionTriggerAnimation2']!,
                  ),
                ],
              ),
            ],
          ),
        );
      },
    );
  }
}

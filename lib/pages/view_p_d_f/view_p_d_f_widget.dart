import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'view_p_d_f_model.dart';
export 'view_p_d_f_model.dart';

class ViewPDFWidget extends StatefulWidget {
  const ViewPDFWidget({super.key});

  @override
  State<ViewPDFWidget> createState() => _ViewPDFWidgetState();
}

class _ViewPDFWidgetState extends State<ViewPDFWidget>
    with TickerProviderStateMixin {
  late ViewPDFModel _model;

  // Declaramos las variables para el filtro de búsqueda y fecha
  TextEditingController searchController = TextEditingController();
  DateTime? selectedDate;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  final animationsMap = <String, AnimationInfo>{};

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => ViewPDFModel());

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
                      .whenComplete(
                      animationsMap['containerOnActionTriggerAnimation1']!
                          .controller
                          .reverse);
                }
                if (animationsMap['containerOnActionTriggerAnimation2'] !=
                    null) {
                  animationsMap['containerOnActionTriggerAnimation2']!
                      .controller
                      .forward()
                      .whenComplete(
                      animationsMap['containerOnActionTriggerAnimation2']!
                          .controller
                          .reverse);
                }
              },
              child: Container(
                width: MediaQuery.sizeOf(context).width * 1.0,
                height: MediaQuery.sizeOf(context).height * 1.0,
                decoration: const BoxDecoration(),
                child: Padding(
                  padding: const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 120.0, 0.0),
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
                                      Icons.folder_copy,
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
                                GoRouter.of(context).clearRedirectLocation();

                                context.goNamedAuth('Login', context.mounted);
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
                              fillColor: FlutterFlowTheme.of(context).primary,
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
                            // Campo de texto para búsqueda
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
                                if (picked != null && picked != selectedDate) {
                                  setState(() {
                                    selectedDate = picked; // Actualizamos la fecha seleccionada
                                  });
                                }
                              },
                            ),
                            // Mostrar la fecha seleccionada
                            if (selectedDate != null)
                              Text(
                                '${selectedDate?.toLocal()}'.split(' ')[0],
                                style: TextStyle(fontSize: 16),
                              ),
                          ],
                        ),
                      ),

                      Expanded(
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Container(
                              width: MediaQuery.sizeOf(context).width * 1.0,
                              height: MediaQuery.sizeOf(context).height * 1.0,
                              decoration: const BoxDecoration(),
                              child: Column(
                                mainAxisSize: MainAxisSize.max,
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Expanded(
                                    child: ValueListenableBuilder(
                                      valueListenable: searchController,
                                      builder: (context, _, __) {
                                        // Cuando el texto de búsqueda cambia, se dispara la consulta
                                        return StreamBuilder<List<PdfFilesRecord>>(
                                          stream: queryPdfFilesRecord(
                                            queryBuilder: (pdfFilesRecord) {
                                              String searchText = searchController.text.trim();  // Elimina espacios extras

                                              // Logs para depurar el texto ingresado
                                              print("Texto de búsqueda ingresado: '$searchText'");
                                              print("Verificando si se está llamando a la base de datos");

                                              // Solo realizamos la búsqueda si el campo de texto no está vacío
                                              if (searchText.isNotEmpty) {
                                                print("Aplicando filtro exacto por nombre: '$searchText'");
                                                pdfFilesRecord = pdfFilesRecord.where(
                                                  'name',
                                                  isEqualTo: searchText,  // Realiza una búsqueda exacta
                                                );
                                              } else {
                                                print("No se ingresó texto para la búsqueda.");
                                              }

                                              // Si hay un filtro por fecha (solo se aplica cuando se ha seleccionado una fecha)
                                              if (selectedDate != null) {
                                                print("Aplicando filtro por fecha: $selectedDate");
                                                pdfFilesRecord = pdfFilesRecord.where(
                                                  'timestamp',
                                                  isGreaterThanOrEqualTo: Timestamp.fromDate(selectedDate!),
                                                );

                                                // Si hay un filtro por fecha, no aplicamos orden descendente
                                                print("Filtro por fecha aplicado, no aplicando orden descendente");
                                              } else {
                                                // Si no hay filtro por fecha, se aplica el orden descendente por fecha
                                                print("No hay filtro por fecha, aplicando orden descendente");
                                                pdfFilesRecord = pdfFilesRecord.orderBy('timestamp', descending: true);
                                              }

                                              return pdfFilesRecord;
                                            },
                                          ),
                                          builder: (context, snapshot) {
                                            if (!snapshot.hasData) {
                                              return Center(
                                                child: SizedBox(
                                                  width: 50.0,
                                                  height: 50.0,
                                                  child: CircularProgressIndicator(
                                                    valueColor: AlwaysStoppedAnimation<Color>(
                                                      FlutterFlowTheme.of(context).primary,
                                                    ),
                                                  ),
                                                ),
                                              );
                                            }

                                            List<PdfFilesRecord> listViewPdfFilesRecordList = snapshot.data!;

                                            // Verifica si hay resultados después de aplicar los filtros
                                            if (listViewPdfFilesRecordList.isEmpty) {
                                              print("No se encontraron reportes con los filtros aplicados.");
                                              return Center(child: Text("No se encontraron reportes con los filtros aplicados."));
                                            }

                                            // Si hay resultados, muestra los reportes
                                            return ListView.builder(
                                              padding: EdgeInsets.zero,
                                              primary: false,
                                              scrollDirection: Axis.vertical,
                                              itemCount: listViewPdfFilesRecordList.length,
                                              itemBuilder: (context, listViewIndex) {
                                                final listViewPdfFilesRecord = listViewPdfFilesRecordList[listViewIndex];
                                                return Card(
                                                  clipBehavior: Clip.antiAliasWithSaveLayer,
                                                  color: Colors.white,
                                                  elevation: 10.0,
                                                  shape: RoundedRectangleBorder(
                                                    borderRadius: BorderRadius.circular(8.0),
                                                  ),
                                                  child: Padding(
                                                    padding: const EdgeInsetsDirectional.fromSTEB(0.0, 10.0, 0.0, 10.0),
                                                    child: Column(
                                                      mainAxisSize: MainAxisSize.max,
                                                      children: [
                                                        Text(
                                                          listViewPdfFilesRecord.name,
                                                          style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                            fontFamily: 'Inter',
                                                            letterSpacing: 0.0,
                                                          ),
                                                        ),
                                                        Padding(
                                                          padding: const EdgeInsetsDirectional.fromSTEB(0.0, 10.0, 0.0, 10.0),
                                                          child: Text(
                                                            dateTimeFormat("d/M/y", listViewPdfFilesRecord.timestamp!),
                                                            style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                              fontFamily: 'Inter',
                                                              letterSpacing: 0.0,
                                                            ),
                                                          ),
                                                        ),
                                                        Row(
                                                          mainAxisSize: MainAxisSize.max,
                                                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                                                          children: [
                                                            FFButtonWidget(
                                                              onPressed: () async {
                                                                await launchURL(listViewPdfFilesRecord.url);
                                                              },
                                                              text: 'Descargar',
                                                              icon: const Icon(
                                                                Icons.visibility_rounded,
                                                                size: 15.0,
                                                              ),
                                                              options: FFButtonOptions(
                                                                height: 40.0,
                                                                padding: const EdgeInsetsDirectional.fromSTEB(16.0, 0.0, 16.0, 0.0),
                                                                iconPadding: const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                                                                color: FlutterFlowTheme.of(context).primary,
                                                                textStyle: FlutterFlowTheme.of(context).titleSmall.override(
                                                                  fontFamily: 'Inter Tight',
                                                                  color: Colors.white,
                                                                  letterSpacing: 0.0,
                                                                ),
                                                                elevation: 0.0,
                                                                borderRadius: BorderRadius.circular(8.0),
                                                              ),
                                                            ),
                                                            FFButtonWidget(
                                                              onPressed: () async {
                                                                context.pushNamed(
                                                                  'PDF',
                                                                  queryParameters: {
                                                                    'pdfId': serializeParam(
                                                                      listViewPdfFilesRecord.name,
                                                                      ParamType.String,
                                                                    ),
                                                                  }.withoutNulls,
                                                                );
                                                              },
                                                              text: 'Editar',
                                                              icon: const Icon(
                                                                Icons.edit,
                                                                size: 15.0,
                                                              ),
                                                              options: FFButtonOptions(
                                                                height: 40.0,
                                                                padding: const EdgeInsetsDirectional.fromSTEB(16.0, 0.0, 16.0, 0.0),
                                                                iconPadding: const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                                                                color: FlutterFlowTheme.of(context).primary,
                                                                textStyle: FlutterFlowTheme.of(context).titleSmall.override(
                                                                  fontFamily: 'Inter Tight',
                                                                  color: Colors.white,
                                                                  letterSpacing: 0.0,
                                                                ),
                                                                elevation: 0.0,
                                                                borderRadius: BorderRadius.circular(8.0),
                                                              ),
                                                            ),
                                                          ],
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                );
                                              },
                                            );
                                          },
                                        );
                                      },
                                    ),
                                  )

                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
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
  }
}

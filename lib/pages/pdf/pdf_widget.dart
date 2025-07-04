import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_checkbox_group.dart';
import '/flutter_flow/flutter_flow_drop_down.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/form_field_controller.dart';
import '/custom_code/actions/index.dart' as actions;
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:provider/provider.dart';
import 'pdf_model.dart';
export 'pdf_model.dart';

class PdfWidget extends StatefulWidget {
  const PdfWidget({
    super.key,
    this.pdfId,
  });

  final String? pdfId;

  @override
  State<PdfWidget> createState() => _PdfWidgetState();
}

class _PdfWidgetState extends State<PdfWidget> with TickerProviderStateMixin {
  late PdfModel _model;



  final scaffoldKey = GlobalKey<ScaffoldState>();

  final animationsMap = <String, AnimationInfo>{};

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => PdfModel());

    _model.clientnameTextController ??=
        TextEditingController(text: FFAppState().clientname);
    _model.clientnameFocusNode ??= FocusNode();

    _model.namebuisnessTextController ??=
        TextEditingController(text: FFAppState().namebuisness);
    _model.namebuisnessFocusNode ??= FocusNode();

    _model.addressnameTextController ??=
        TextEditingController(text: FFAppState().addressname);
    _model.addressnameFocusNode ??= FocusNode();

    _model.phoneTextController ??=
        TextEditingController(text: FFAppState().phone.toString());
    _model.phoneFocusNode ??= FocusNode();

    _model.teamTextController ??=
        TextEditingController(text: FFAppState().team);
    _model.teamFocusNode ??= FocusNode();

    _model.brandTextController ??=
        TextEditingController(text: FFAppState().brand);
    _model.brandFocusNode ??= FocusNode();

    _model.modelTextController ??=
        TextEditingController(text: FFAppState().model);
    _model.modelFocusNode ??= FocusNode();

    _model.serieTextController ??=
        TextEditingController(text: FFAppState().serie);
    _model.serieFocusNode ??= FocusNode();

    _model.codeTextController ??=
        TextEditingController(text: FFAppState().code);
    _model.codeFocusNode ??= FocusNode();

    _model.locationTextController ??=
        TextEditingController(text: FFAppState().location);
    _model.locationFocusNode ??= FocusNode();

    _model.workstatusotherTextController ??=
        TextEditingController(text: FFAppState().workstatusother);
    _model.workstatusotherFocusNode ??= FocusNode();

    _model.observationsTextController ??=
        TextEditingController(text: FFAppState().observations);
    _model.observationsFocusNode ??= FocusNode();

    _model.recommendationsTextController ??=
        TextEditingController(text: FFAppState().recommendations);
    _model.recommendationsFocusNode ??= FocusNode();

    _model.startworkhoursTextController ??=
        TextEditingController(text: FFAppState().startworkhours.toString());
    _model.startworkhoursFocusNode ??= FocusNode();

    _model.endtworkhoursTextController ??=
        TextEditingController(text: FFAppState().endtworkhours.toString());
    _model.endtworkhoursFocusNode ??= FocusNode();

    _model.totalworkhoursTextController ??=
        TextEditingController(text: FFAppState().totalworkhours.toString());
    _model.totalworkhoursFocusNode ??= FocusNode();

    _model.maintenancecontractTextController ??= TextEditingController(
        text: FFAppState().maintenancecontract.toString());
    _model.maintenancecontractFocusNode ??= FocusNode();

    _model.numberofvisitsTextController ??=
        TextEditingController(text: FFAppState().numberofvisits.toString());
    _model.numberofvisitsFocusNode ??= FocusNode();

    FirebaseFirestore.instance
        .collection('pdf_update') // Cambia 'pdf_update' si tu colección tiene otro nombre
        .doc(widget.pdfId) // Asegúrate de que widget.pdfId sea el ID correcto del documento
        .get()
        .then((snapshot) {
      if (snapshot.exists) {
        final data = snapshot.data();
        print('Datos cargados: $data'); // Verifica los datos cargados

        setState(() {
          _model.clientnameTextController?.text = data?['clientname'] ?? '';
          _model.namebuisnessTextController?.text = data?['namebuisness'] ?? '';
          _model.addressnameTextController?.text = data?['addressname'] ?? '';
          _model.phoneTextController?.text = data?['phone'] ?? '';
          _model.teamTextController?.text = data?['team'] ?? '';
          _model.brandTextController?.text = data?['brand'] ?? '';
          _model.modelTextController?.text = data?['model'] ?? '';
          _model.serieTextController?.text = data?['serie'] ?? '';
          _model.codeTextController?.text = data?['code'] ?? '';
          _model.locationTextController?.text = data?['location'] ?? '';
          _model.workstatusotherTextController?.text =
              data?['workstatusother'] ?? '';
          _model.observationsTextController?.text =
              data?['observations'] ?? '';
          _model.recommendationsTextController?.text =
              data?['recommendations'] ?? '';
          _model.startworkhoursTextController?.text =
              data?['startworkhours']?.toString() ?? '';
          _model.endtworkhoursTextController?.text =
              data?['endtworkhours']?.toString() ?? '';
          _model.totalworkhoursTextController?.text =
              data?['totalworkhours']?.toString() ?? '';
          _model.maintenancecontractTextController?.text =
              data?['maintenancecontract']?.toString() ?? '';
          _model.numberofvisitsTextController?.text =
              data?['numberofvisits']?.toString() ?? '';

// === Asignar `workStatusCheckboxes` al CheckboxGroup ===
          if (data?['workStatusCheckboxes'] != null) {
            List<String> selectedValues = List<String>.from(data!['workStatusCheckboxes']);

            // Asigna los valores seleccionados al modelo
            _model.workStatusCheckboxesValues = selectedValues;

            // Asegura que el controlador del formulario esté actualizado
            _model.workStatusCheckboxesValueController ??=
                FormFieldController<List<String>>(selectedValues);
          }


          // === Convertir la fecha almacenada y asignarla a `_model.datePicked` ===
          if (data?['iconday'] != null) {
            final DateTime iconday = DateTime.parse(data!['iconday']);
            _model.datePicked = iconday; // Almacena el valor en `_model.datePicked`
          }
        });
      } else {
        print('Documento no encontrado: ${widget.pdfId}');
      }
    }).catchError((error) {
      print('Error al cargar los datos desde Firestore: $error');
    });


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
            end: 0.0,
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
    context.watch<FFAppState>();

    return StreamBuilder<List<PdfFilesRecord>>(
      stream: queryPdfFilesRecord(
        queryBuilder: (pdfFilesRecord) => pdfFilesRecord.where(
          'name',
          isEqualTo: widget.pdfId,
        ),
        singleRecord: true,
      ),
      builder: (context, snapshot) {
        // Customize what your widget looks like when it's loading.
        if (!snapshot.hasData) {
          return Scaffold(
            body: Center(
              child: SizedBox(
                width: 50.0,
                height: 50.0,
                child: CircularProgressIndicator(
                  valueColor: AlwaysStoppedAnimation<Color>(
                    FlutterFlowTheme.of(context).primary,
                  ),
                ),
              ),
            ),
          );
        }
        List<PdfFilesRecord> pdfPdfFilesRecordList = snapshot.data!;
        final pdfPdfFilesRecord = pdfPdfFilesRecordList.isNotEmpty
            ? pdfPdfFilesRecordList.first
            : null;

        return GestureDetector(
          onTap: () {
            FocusScope.of(context).unfocus();
            FocusManager.instance.primaryFocus?.unfocus();
          },
          child: Scaffold(
            key: scaffoldKey,
            body: SafeArea(
              top: true,
              child: Stack(
                children: [
                  Container(
                    decoration: const BoxDecoration(),
                    child: InkWell(
                      splashColor: Colors.transparent,
                      focusColor: Colors.transparent,
                      hoverColor: Colors.transparent,
                      highlightColor: Colors.transparent,
                      onTap: () async {
                        if (animationsMap[
                        'containerOnActionTriggerAnimation1'] !=
                            null) {
                          animationsMap['containerOnActionTriggerAnimation1']!
                              .controller
                              .forward()
                              .whenComplete(animationsMap[
                          'containerOnActionTriggerAnimation1']!
                              .controller
                              .reverse);
                        }
                        if (animationsMap[
                        'containerOnActionTriggerAnimation2'] !=
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
                        decoration: BoxDecoration(
                          color:
                          FlutterFlowTheme.of(context).secondaryBackground,
                        ),
                        child: Padding(
                          padding: const EdgeInsetsDirectional.fromSTEB(
                              0.0, 0.0, 120.0, 0.0),
                          child: SingleChildScrollView(
                            child: Column(
                              mainAxisSize: MainAxisSize.max,
                              children: [
                                Padding(
                                  padding: const EdgeInsetsDirectional.fromSTEB(
                                      16.0, 40.0, 0.0, 0.0),
                                  child: Row(
                                    mainAxisSize: MainAxisSize.max,
                                    children: [
                                      AuthUserStreamWidget(
                                        builder: (context) => ClipRRect(
                                          borderRadius:
                                          BorderRadius.circular(30.0),
                                          child: Image.network(
                                            currentUserPhoto,
                                            width: 70.0,
                                            height: 70.0,
                                            fit: BoxFit.cover,
                                          ),
                                        ),
                                      ),
                                      Align(
                                        alignment:
                                        const AlignmentDirectional(0.0, 0.0),
                                        child: Padding(
                                          padding:
                                          const EdgeInsetsDirectional.fromSTEB(
                                              10.0, 0.0, 0.0, 0.0),
                                          child: Column(
                                            mainAxisSize: MainAxisSize.max,
                                            crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                            children: [
                                              AuthUserStreamWidget(
                                                builder: (context) => Text(
                                                  currentUserDisplayName,
                                                  style: FlutterFlowTheme.of(
                                                      context)
                                                      .bodyMedium
                                                      .override(
                                                    fontFamily: 'Inter',
                                                    color: Colors.black,
                                                    fontSize: 20.0,
                                                    letterSpacing: 0.0,
                                                    fontWeight:
                                                    FontWeight.bold,
                                                  ),
                                                ),
                                              ),
                                              Text(
                                                'Bienvenido',
                                                style:
                                                FlutterFlowTheme.of(context)
                                                    .bodyMedium
                                                    .override(
                                                  fontFamily: 'Inter',
                                                  fontSize: 15.0,
                                                  letterSpacing: 0.0,
                                                  fontWeight:
                                                  FontWeight.w500,
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                    ],
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
                                            padding:
                                            EdgeInsetsDirectional.fromSTEB(
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
                                            padding:
                                            EdgeInsetsDirectional.fromSTEB(
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
                                            padding:
                                            EdgeInsetsDirectional.fromSTEB(
                                                16.0, 0.0, 16.0, 0.0),
                                            child: Icon(
                                              Icons.preview_sharp,
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
                                            padding:
                                            EdgeInsetsDirectional.fromSTEB(
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
                                            padding:
                                            EdgeInsetsDirectional.fromSTEB(
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
                                            padding:
                                            EdgeInsetsDirectional.fromSTEB(
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
                                        iconPadding:
                                        const EdgeInsetsDirectional.fromSTEB(
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
                                        borderRadius:
                                        BorderRadius.circular(8.0),
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
                      Align(
                        alignment: const AlignmentDirectional(0.0, 0.0),
                        child: Container(
                          width: MediaQuery.sizeOf(context).width * 1.0,
                          height: MediaQuery.sizeOf(context).height * 1.0,
                          decoration: const BoxDecoration(),
                        ).animateOnActionTrigger(
                          animationsMap['containerOnActionTriggerAnimation1']!,
                        ),
                      ),
                      Align(
                        alignment: const AlignmentDirectional(0.0, 0.0),
                        child: StreamBuilder<List<CategorysRecord>>(
                          stream: queryCategorysRecord(),
                          builder: (context, snapshot) {
                            // Customize what your widget looks like when it's loading.
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
                            List<CategorysRecord>
                            containerFonInicioCategorysRecordList =
                            snapshot.data!;

                            return Container(
                              width: 800.0,
                              decoration: BoxDecoration(
                                image: DecorationImage(
                                  fit: BoxFit.cover,
                                  alignment: const AlignmentDirectional(0.0, 1.0),
                                  image: Image.asset(
                                    'assets/images/Documento_A5_Receta_de_Salud_Mdico_General_Profesional_Azul_(2).png',
                                  ).image,
                                ),
                                borderRadius: BorderRadius.circular(8.0),
                              ),
                              alignment: const AlignmentDirectional(0.0, 0.0),
                              child: SingleChildScrollView(
                                child: Column(
                                  mainAxisSize: MainAxisSize.max,
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment:
                                  CrossAxisAlignment.stretch,
                                  children: [
                                    Row(
                                      mainAxisSize: MainAxisSize.max,
                                      mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                      children: [
                                        Padding(
                                          padding:
                                          const EdgeInsetsDirectional.fromSTEB(
                                              10.0, 15.0, 20.0, 20.0),
                                          child: FlutterFlowIconButton(
                                            borderRadius: 8.0,
                                            buttonSize: 40.0,
                                            fillColor: const Color(0xFF292D96),
                                            icon: Icon(
                                              Icons.menu,
                                              color:
                                              FlutterFlowTheme.of(context)
                                                  .info,
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
                                        Expanded(
                                          child: Container(
                                            width: 194.0,
                                            height: 100.0,
                                            decoration: const BoxDecoration(
                                              color: Colors.transparent,
                                            ),
                                            child: ClipRRect(
                                              borderRadius:
                                              BorderRadius.circular(8.0),
                                              child: Image.asset(
                                                'assets/images/Logo_Techni.png',
                                                width: 0.0,
                                                fit: BoxFit.cover,
                                              ),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                    Padding(
                                      padding: const EdgeInsetsDirectional.fromSTEB(
                                          0.0, 10.0, 0.0, 10.0),
                                      child: Row(
                                        mainAxisSize: MainAxisSize.max,
                                        children: [
                                          Padding(
                                            padding:
                                            const EdgeInsetsDirectional.fromSTEB(
                                                12.0, 0.0, 0.0, 0.0),
                                            child: Text(
                                              'CLIENTE:',
                                              style:
                                              FlutterFlowTheme.of(context)
                                                  .bodyMedium
                                                  .override(
                                                fontFamily: 'Inter',
                                                fontSize: 15.0,
                                                letterSpacing: 0.0,
                                                fontWeight:
                                                FontWeight.bold,
                                              ),
                                            ),
                                          ),
                                          Expanded(
                                            child: Align(
                                              alignment: const AlignmentDirectional(
                                                  0.0, 0.0),
                                              child: Padding(
                                                padding: const EdgeInsetsDirectional
                                                    .fromSTEB(
                                                    60.0, 0.0, 0.0, 0.0),
                                                child: SizedBox(
                                                  width: 200.0,
                                                  child: TextFormField(
                                                    controller: _model
                                                        .clientnameTextController,
                                                    focusNode: _model
                                                        .clientnameFocusNode,
                                                    autofocus: false,
                                                    obscureText: false,
                                                    decoration: InputDecoration(
                                                      isDense: true,
                                                      labelStyle:
                                                      FlutterFlowTheme.of(
                                                          context)
                                                          .labelMedium
                                                          .override(
                                                        fontFamily:
                                                        'Inter',
                                                        letterSpacing:
                                                        0.0,
                                                      ),
                                                      hintText:
                                                      'Nombre Cliente',
                                                      hintStyle:
                                                      FlutterFlowTheme.of(
                                                          context)
                                                          .labelMedium
                                                          .override(
                                                        fontFamily:
                                                        'Inter',
                                                        letterSpacing:
                                                        0.0,
                                                      ),
                                                      enabledBorder:
                                                      OutlineInputBorder(
                                                        borderSide: const BorderSide(
                                                          color:
                                                          Color(0x00000000),
                                                          width: 1.0,
                                                        ),
                                                        borderRadius:
                                                        BorderRadius
                                                            .circular(8.0),
                                                      ),
                                                      focusedBorder:
                                                      OutlineInputBorder(
                                                        borderSide: const BorderSide(
                                                          color:
                                                          Color(0x00000000),
                                                          width: 1.0,
                                                        ),
                                                        borderRadius:
                                                        BorderRadius
                                                            .circular(8.0),
                                                      ),
                                                      errorBorder:
                                                      OutlineInputBorder(
                                                        borderSide: BorderSide(
                                                          color: FlutterFlowTheme
                                                              .of(context)
                                                              .error,
                                                          width: 1.0,
                                                        ),
                                                        borderRadius:
                                                        BorderRadius
                                                            .circular(8.0),
                                                      ),
                                                      focusedErrorBorder:
                                                      OutlineInputBorder(
                                                        borderSide: BorderSide(
                                                          color: FlutterFlowTheme
                                                              .of(context)
                                                              .error,
                                                          width: 1.0,
                                                        ),
                                                        borderRadius:
                                                        BorderRadius
                                                            .circular(8.0),
                                                      ),
                                                      filled: true,
                                                      fillColor:
                                                      const Color(0xFFCECACA),
                                                    ),
                                                    style: FlutterFlowTheme.of(
                                                        context)
                                                        .bodyMedium
                                                        .override(
                                                      fontFamily: 'Inter',
                                                      letterSpacing: 0.0,
                                                    ),
                                                    textAlign: TextAlign.center,
                                                    cursorColor:
                                                    FlutterFlowTheme.of(
                                                        context)
                                                        .primaryText,
                                                    validator: _model
                                                        .clientnameTextControllerValidator
                                                        .asValidator(context),
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsetsDirectional.fromSTEB(
                                          0.0, 10.0, 0.0, 10.0),
                                      child: Row(
                                        mainAxisSize: MainAxisSize.max,
                                        mainAxisAlignment:
                                        MainAxisAlignment.start,
                                        children: [
                                          Padding(
                                            padding:
                                            const EdgeInsetsDirectional.fromSTEB(
                                                12.0, 0.0, 0.0, 0.0),
                                            child: Text(
                                              'EMPRESA:',
                                              style:
                                              FlutterFlowTheme.of(context)
                                                  .bodyMedium
                                                  .override(
                                                fontFamily: 'Inter',
                                                fontSize: 15.0,
                                                letterSpacing: 0.0,
                                                fontWeight:
                                                FontWeight.bold,
                                              ),
                                            ),
                                          ),
                                          Expanded(
                                            child: Align(
                                              alignment: const AlignmentDirectional(
                                                  0.0, 0.0),
                                              child: Padding(
                                                padding: const EdgeInsetsDirectional
                                                    .fromSTEB(
                                                    60.0, 0.0, 0.0, 0.0),
                                                child: SizedBox(
                                                  width: 200.0,
                                                  child: TextFormField(
                                                    controller: _model
                                                        .namebuisnessTextController,
                                                    focusNode: _model
                                                        .namebuisnessFocusNode,
                                                    autofocus: false,
                                                    obscureText: false,
                                                    decoration: InputDecoration(
                                                      isDense: true,
                                                      labelStyle:
                                                      FlutterFlowTheme.of(
                                                          context)
                                                          .labelMedium
                                                          .override(
                                                        fontFamily:
                                                        'Inter',
                                                        letterSpacing:
                                                        0.0,
                                                      ),
                                                      hintText: 'Nombre Ciudad',
                                                      hintStyle:
                                                      FlutterFlowTheme.of(
                                                          context)
                                                          .labelMedium
                                                          .override(
                                                        fontFamily:
                                                        'Inter',
                                                        letterSpacing:
                                                        0.0,
                                                      ),
                                                      enabledBorder:
                                                      OutlineInputBorder(
                                                        borderSide: const BorderSide(
                                                          color:
                                                          Color(0x00000000),
                                                          width: 1.0,
                                                        ),
                                                        borderRadius:
                                                        BorderRadius
                                                            .circular(8.0),
                                                      ),
                                                      focusedBorder:
                                                      OutlineInputBorder(
                                                        borderSide: const BorderSide(
                                                          color:
                                                          Color(0x00000000),
                                                          width: 1.0,
                                                        ),
                                                        borderRadius:
                                                        BorderRadius
                                                            .circular(8.0),
                                                      ),
                                                      errorBorder:
                                                      OutlineInputBorder(
                                                        borderSide: BorderSide(
                                                          color: FlutterFlowTheme
                                                              .of(context)
                                                              .error,
                                                          width: 1.0,
                                                        ),
                                                        borderRadius:
                                                        BorderRadius
                                                            .circular(8.0),
                                                      ),
                                                      focusedErrorBorder:
                                                      OutlineInputBorder(
                                                        borderSide: BorderSide(
                                                          color: FlutterFlowTheme
                                                              .of(context)
                                                              .error,
                                                          width: 1.0,
                                                        ),
                                                        borderRadius:
                                                        BorderRadius
                                                            .circular(8.0),
                                                      ),
                                                      filled: true,
                                                      fillColor:
                                                      const Color(0xFFCECACA),
                                                    ),
                                                    style: FlutterFlowTheme.of(
                                                        context)
                                                        .bodyMedium
                                                        .override(
                                                      fontFamily: 'Inter',
                                                      letterSpacing: 0.0,
                                                    ),
                                                    textAlign: TextAlign.center,
                                                    cursorColor:
                                                    FlutterFlowTheme.of(
                                                        context)
                                                        .primaryText,
                                                    validator: _model
                                                        .namebuisnessTextControllerValidator
                                                        .asValidator(context),
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsetsDirectional.fromSTEB(
                                          0.0, 10.0, 0.0, 10.0),
                                      child: Row(
                                        mainAxisSize: MainAxisSize.max,
                                        mainAxisAlignment:
                                        MainAxisAlignment.start,
                                        children: [
                                          Padding(
                                            padding:
                                            const EdgeInsetsDirectional.fromSTEB(
                                                12.0, 0.0, 0.0, 0.0),
                                            child: Text(
                                              'DIRECCION:',
                                              style:
                                              FlutterFlowTheme.of(context)
                                                  .bodyMedium
                                                  .override(
                                                fontFamily: 'Inter',
                                                fontSize: 15.0,
                                                letterSpacing: 0.0,
                                                fontWeight:
                                                FontWeight.bold,
                                              ),
                                            ),
                                          ),
                                          Expanded(
                                            child: Align(
                                              alignment: const AlignmentDirectional(
                                                  0.0, 0.0),
                                              child: Padding(
                                                padding: const EdgeInsetsDirectional
                                                    .fromSTEB(
                                                    40.0, 0.0, 0.0, 0.0),
                                                child: SizedBox(
                                                  width: 200.0,
                                                  child: TextFormField(
                                                    controller: _model
                                                        .addressnameTextController,
                                                    focusNode: _model
                                                        .addressnameFocusNode,
                                                    autofocus: false,
                                                    obscureText: false,
                                                    decoration: InputDecoration(
                                                      isDense: true,
                                                      labelStyle:
                                                      FlutterFlowTheme.of(
                                                          context)
                                                          .labelMedium
                                                          .override(
                                                        fontFamily:
                                                        'Inter',
                                                        letterSpacing:
                                                        0.0,
                                                      ),
                                                      hintText: 'Direccion',
                                                      hintStyle:
                                                      FlutterFlowTheme.of(
                                                          context)
                                                          .labelMedium
                                                          .override(
                                                        fontFamily:
                                                        'Inter',
                                                        letterSpacing:
                                                        0.0,
                                                      ),
                                                      enabledBorder:
                                                      OutlineInputBorder(
                                                        borderSide: const BorderSide(
                                                          color:
                                                          Color(0x00000000),
                                                          width: 1.0,
                                                        ),
                                                        borderRadius:
                                                        BorderRadius
                                                            .circular(8.0),
                                                      ),
                                                      focusedBorder:
                                                      OutlineInputBorder(
                                                        borderSide: const BorderSide(
                                                          color:
                                                          Color(0x00000000),
                                                          width: 1.0,
                                                        ),
                                                        borderRadius:
                                                        BorderRadius
                                                            .circular(8.0),
                                                      ),
                                                      errorBorder:
                                                      OutlineInputBorder(
                                                        borderSide: BorderSide(
                                                          color: FlutterFlowTheme
                                                              .of(context)
                                                              .error,
                                                          width: 1.0,
                                                        ),
                                                        borderRadius:
                                                        BorderRadius
                                                            .circular(8.0),
                                                      ),
                                                      focusedErrorBorder:
                                                      OutlineInputBorder(
                                                        borderSide: BorderSide(
                                                          color: FlutterFlowTheme
                                                              .of(context)
                                                              .error,
                                                          width: 1.0,
                                                        ),
                                                        borderRadius:
                                                        BorderRadius
                                                            .circular(8.0),
                                                      ),
                                                      filled: true,
                                                      fillColor:
                                                      const Color(0xFFCECACA),
                                                    ),
                                                    style: FlutterFlowTheme.of(
                                                        context)
                                                        .bodyMedium
                                                        .override(
                                                      fontFamily: 'Inter',
                                                      letterSpacing: 0.0,
                                                    ),
                                                    textAlign: TextAlign.center,
                                                    cursorColor:
                                                    FlutterFlowTheme.of(
                                                        context)
                                                        .primaryText,
                                                    validator: _model
                                                        .addressnameTextControllerValidator
                                                        .asValidator(context),
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsetsDirectional.fromSTEB(
                                          0.0, 10.0, 0.0, 10.0),
                                      child: Row(
                                        mainAxisSize: MainAxisSize.max,
                                        mainAxisAlignment:
                                        MainAxisAlignment.start,
                                        children: [
                                          Padding(
                                            padding:
                                            const EdgeInsetsDirectional.fromSTEB(
                                                12.0, 0.0, 0.0, 0.0),
                                            child: Text(
                                              'TELEFONO:',
                                              style:
                                              FlutterFlowTheme.of(context)
                                                  .bodyMedium
                                                  .override(
                                                fontFamily: 'Inter',
                                                fontSize: 15.0,
                                                letterSpacing: 0.0,
                                                fontWeight:
                                                FontWeight.bold,
                                              ),
                                            ),
                                          ),
                                          Expanded(
                                            child: Align(
                                              alignment: const AlignmentDirectional(
                                                  0.0, 0.0),
                                              child: Padding(
                                                padding: const EdgeInsetsDirectional
                                                    .fromSTEB(
                                                    40.0, 0.0, 0.0, 0.0),
                                                child: SizedBox(
                                                  width: 200.0,
                                                  child: TextFormField(
                                                    controller: _model
                                                        .phoneTextController,
                                                    focusNode:
                                                    _model.phoneFocusNode,
                                                    autofocus: false,
                                                    obscureText: false,
                                                    decoration: InputDecoration(
                                                      isDense: true,
                                                      labelStyle:
                                                      FlutterFlowTheme.of(
                                                          context)
                                                          .labelMedium
                                                          .override(
                                                        fontFamily:
                                                        'Inter',
                                                        letterSpacing:
                                                        0.0,
                                                      ),
                                                      hintText: 'Telefono',
                                                      hintStyle:
                                                      FlutterFlowTheme.of(
                                                          context)
                                                          .labelMedium
                                                          .override(
                                                        fontFamily:
                                                        'Inter',
                                                        letterSpacing:
                                                        0.0,
                                                      ),
                                                      enabledBorder:
                                                      OutlineInputBorder(
                                                        borderSide: const BorderSide(
                                                          color:
                                                          Color(0x00000000),
                                                          width: 1.0,
                                                        ),
                                                        borderRadius:
                                                        BorderRadius
                                                            .circular(8.0),
                                                      ),
                                                      focusedBorder:
                                                      OutlineInputBorder(
                                                        borderSide: const BorderSide(
                                                          color:
                                                          Color(0x00000000),
                                                          width: 1.0,
                                                        ),
                                                        borderRadius:
                                                        BorderRadius
                                                            .circular(8.0),
                                                      ),
                                                      errorBorder:
                                                      OutlineInputBorder(
                                                        borderSide: BorderSide(
                                                          color: FlutterFlowTheme
                                                              .of(context)
                                                              .error,
                                                          width: 1.0,
                                                        ),
                                                        borderRadius:
                                                        BorderRadius
                                                            .circular(8.0),
                                                      ),
                                                      focusedErrorBorder:
                                                      OutlineInputBorder(
                                                        borderSide: BorderSide(
                                                          color: FlutterFlowTheme
                                                              .of(context)
                                                              .error,
                                                          width: 1.0,
                                                        ),
                                                        borderRadius:
                                                        BorderRadius
                                                            .circular(8.0),
                                                      ),
                                                      filled: true,
                                                      fillColor:
                                                      const Color(0xFFCECACA),
                                                    ),
                                                    style: FlutterFlowTheme.of(
                                                        context)
                                                        .bodyMedium
                                                        .override(
                                                      fontFamily: 'Inter',
                                                      letterSpacing: 0.0,
                                                    ),
                                                    textAlign: TextAlign.center,
                                                    cursorColor:
                                                    FlutterFlowTheme.of(
                                                        context)
                                                        .primaryText,
                                                    validator: _model
                                                        .phoneTextControllerValidator
                                                        .asValidator(context),
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsetsDirectional.fromSTEB(
                                          0.0, 10.0, 0.0, 10.0),
                                      child: Row(
                                        mainAxisSize: MainAxisSize.max,
                                        mainAxisAlignment:
                                        MainAxisAlignment.start,
                                        children: [
                                          Padding(
                                            padding:
                                            const EdgeInsetsDirectional.fromSTEB(
                                                12.0, 0.0, 0.0, 0.0),
                                            child: Text(
                                              'FECHA :',
                                              style:
                                              FlutterFlowTheme.of(context)
                                                  .bodyMedium
                                                  .override(
                                                fontFamily: 'Inter',
                                                fontSize: 15.0,
                                                letterSpacing: 0.0,
                                                fontWeight:
                                                FontWeight.bold,
                                              ),
                                            ),
                                          ),
                                          Padding(
                                            padding:
                                            const EdgeInsetsDirectional.fromSTEB(
                                                12.0, 0.0, 0.0, 0.0),
                                            child: Text(
                                              valueOrDefault<String>(
                                                dateTimeFormat(
                                                    "d/M/y", _model.datePicked),
                                                'No Ingresada',
                                              ),
                                              style:
                                              FlutterFlowTheme.of(context)
                                                  .bodyMedium
                                                  .override(
                                                fontFamily: 'Inter',
                                                fontSize: 15.0,
                                                letterSpacing: 0.0,
                                                fontWeight:
                                                FontWeight.bold,
                                              ),
                                            ),
                                          ),
                                          Flexible(
                                            child: Padding(
                                              padding: const EdgeInsetsDirectional
                                                  .fromSTEB(
                                                  50.0, 0.0, 0.0, 0.0),
                                              child: Container(
                                                width: 70.0,
                                                height: 50.0,
                                                decoration: BoxDecoration(
                                                  color: const Color(0xFF292D96),
                                                  borderRadius:
                                                  BorderRadius.circular(
                                                      20.0),
                                                ),
                                                child: InkWell(
                                                  splashColor:
                                                  Colors.transparent,
                                                  focusColor:
                                                  Colors.transparent,
                                                  hoverColor:
                                                  Colors.transparent,
                                                  highlightColor:
                                                  Colors.transparent,
                                                  onTap: () async {
                                                    final datePickedDate =
                                                    await showDatePicker(
                                                      context: context,
                                                      initialDate:
                                                      getCurrentTimestamp,
                                                      firstDate:
                                                      DateTime.fromMillisecondsSinceEpoch(0),
                                                      lastDate: DateTime(2050),
                                                      builder:
                                                          (context, child) {
                                                        return wrapInMaterialDatePickerTheme(
                                                          context,
                                                          child!,
                                                          headerBackgroundColor:
                                                          FlutterFlowTheme.of(
                                                              context)
                                                              .primary,
                                                          headerForegroundColor:
                                                          FlutterFlowTheme.of(
                                                              context)
                                                              .info,
                                                          headerTextStyle:
                                                          FlutterFlowTheme.of(
                                                              context)
                                                              .headlineLarge
                                                              .override(
                                                            fontFamily:
                                                            'Inter Tight',
                                                            fontSize:
                                                            32.0,
                                                            letterSpacing:
                                                            0.0,
                                                            fontWeight:
                                                            FontWeight
                                                                .w600,
                                                          ),
                                                          pickerBackgroundColor:
                                                          FlutterFlowTheme.of(
                                                              context)
                                                              .secondaryBackground,
                                                          pickerForegroundColor:
                                                          FlutterFlowTheme.of(
                                                              context)
                                                              .primaryText,
                                                          selectedDateTimeBackgroundColor:
                                                          FlutterFlowTheme.of(
                                                              context)
                                                              .primary,
                                                          selectedDateTimeForegroundColor:
                                                          FlutterFlowTheme.of(
                                                              context)
                                                              .info,
                                                          actionButtonForegroundColor:
                                                          FlutterFlowTheme.of(
                                                              context)
                                                              .primaryText,
                                                          iconSize: 24.0,
                                                        );
                                                      },
                                                    );

                                                    if (datePickedDate !=
                                                        null) {
                                                      safeSetState(() {
                                                        _model.datePicked =
                                                            DateTime(
                                                              datePickedDate.year,
                                                              datePickedDate.month,
                                                              datePickedDate.day,
                                                            );
                                                      });
                                                    }
                                                    if (_model.datePicked ==
                                                        null) {
                                                      FFAppState().Iconday = DateTime
                                                          .fromMillisecondsSinceEpoch(
                                                          1734806040000);
                                                      safeSetState(() {});
                                                    } else {
                                                      FFAppState().Iconday =
                                                          _model.datePicked;
                                                      safeSetState(() {});
                                                    }
                                                  },
                                                  child: Icon(
                                                    key: ValueKey(FFAppState()
                                                        .Iconday!
                                                        .toString()),
                                                    Icons.calendar_month,
                                                    color: Colors.white,
                                                    size: 30.0,
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsetsDirectional.fromSTEB(
                                          0.0, 10.0, 0.0, 10.0),
                                      child: Row(
                                        mainAxisSize: MainAxisSize.max,
                                        mainAxisAlignment:
                                        MainAxisAlignment.start,
                                        children: [
                                          Padding(
                                            padding:
                                            const EdgeInsetsDirectional.fromSTEB(
                                                12.0, 0.0, 0.0, 0.0),
                                            child: Text(
                                              'EQUIPO:',
                                              style:
                                              FlutterFlowTheme.of(context)
                                                  .bodyMedium
                                                  .override(
                                                fontFamily: 'Inter',
                                                fontSize: 15.0,
                                                letterSpacing: 0.0,
                                                fontWeight:
                                                FontWeight.bold,
                                              ),
                                            ),
                                          ),
                                          Expanded(
                                            child: Align(
                                              alignment: const AlignmentDirectional(
                                                  0.0, 0.0),
                                              child: Padding(
                                                padding: const EdgeInsetsDirectional
                                                    .fromSTEB(
                                                    60.0, 0.0, 0.0, 0.0),
                                                child: SizedBox(
                                                  width: 200.0,
                                                  child: TextFormField(
                                                    controller: _model
                                                        .teamTextController,
                                                    focusNode:
                                                    _model.teamFocusNode,
                                                    autofocus: false,
                                                    obscureText: false,
                                                    decoration: InputDecoration(
                                                      isDense: true,
                                                      labelStyle:
                                                      FlutterFlowTheme.of(
                                                          context)
                                                          .labelMedium
                                                          .override(
                                                        fontFamily:
                                                        'Inter',
                                                        letterSpacing:
                                                        0.0,
                                                      ),
                                                      hintText: 'Equipo',
                                                      hintStyle:
                                                      FlutterFlowTheme.of(
                                                          context)
                                                          .labelMedium
                                                          .override(
                                                        fontFamily:
                                                        'Inter',
                                                        letterSpacing:
                                                        0.0,
                                                      ),
                                                      enabledBorder:
                                                      OutlineInputBorder(
                                                        borderSide: const BorderSide(
                                                          color:
                                                          Color(0x00000000),
                                                          width: 1.0,
                                                        ),
                                                        borderRadius:
                                                        BorderRadius
                                                            .circular(8.0),
                                                      ),
                                                      focusedBorder:
                                                      OutlineInputBorder(
                                                        borderSide: const BorderSide(
                                                          color:
                                                          Color(0x00000000),
                                                          width: 1.0,
                                                        ),
                                                        borderRadius:
                                                        BorderRadius
                                                            .circular(8.0),
                                                      ),
                                                      errorBorder:
                                                      OutlineInputBorder(
                                                        borderSide: BorderSide(
                                                          color: FlutterFlowTheme
                                                              .of(context)
                                                              .error,
                                                          width: 1.0,
                                                        ),
                                                        borderRadius:
                                                        BorderRadius
                                                            .circular(8.0),
                                                      ),
                                                      focusedErrorBorder:
                                                      OutlineInputBorder(
                                                        borderSide: BorderSide(
                                                          color: FlutterFlowTheme
                                                              .of(context)
                                                              .error,
                                                          width: 1.0,
                                                        ),
                                                        borderRadius:
                                                        BorderRadius
                                                            .circular(8.0),
                                                      ),
                                                      filled: true,
                                                      fillColor:
                                                      const Color(0xFFCECACA),
                                                    ),
                                                    style: FlutterFlowTheme.of(
                                                        context)
                                                        .bodyMedium
                                                        .override(
                                                      fontFamily: 'Inter',
                                                      letterSpacing: 0.0,
                                                    ),
                                                    textAlign: TextAlign.center,
                                                    cursorColor:
                                                    FlutterFlowTheme.of(
                                                        context)
                                                        .primaryText,
                                                    validator: _model
                                                        .teamTextControllerValidator
                                                        .asValidator(context),
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsetsDirectional.fromSTEB(
                                          0.0, 10.0, 0.0, 10.0),
                                      child: Row(
                                        mainAxisSize: MainAxisSize.max,
                                        mainAxisAlignment:
                                        MainAxisAlignment.start,
                                        children: [
                                          Padding(
                                            padding:
                                            const EdgeInsetsDirectional.fromSTEB(
                                                12.0, 0.0, 0.0, 0.0),
                                            child: Text(
                                              'MARCA:',
                                              style:
                                              FlutterFlowTheme.of(context)
                                                  .bodyMedium
                                                  .override(
                                                fontFamily: 'Inter',
                                                fontSize: 15.0,
                                                letterSpacing: 0.0,
                                                fontWeight:
                                                FontWeight.bold,
                                              ),
                                            ),
                                          ),
                                          Expanded(
                                            child: Align(
                                              alignment: const AlignmentDirectional(
                                                  0.0, 0.0),
                                              child: Padding(
                                                padding: const EdgeInsetsDirectional
                                                    .fromSTEB(
                                                    60.0, 0.0, 0.0, 0.0),
                                                child: SizedBox(
                                                  width: 200.0,
                                                  child: TextFormField(
                                                    controller: _model
                                                        .brandTextController,
                                                    focusNode:
                                                    _model.brandFocusNode,
                                                    autofocus: false,
                                                    obscureText: false,
                                                    decoration: InputDecoration(
                                                      isDense: true,
                                                      labelStyle:
                                                      FlutterFlowTheme.of(
                                                          context)
                                                          .labelMedium
                                                          .override(
                                                        fontFamily:
                                                        'Inter',
                                                        letterSpacing:
                                                        0.0,
                                                      ),
                                                      hintText: 'Marca',
                                                      hintStyle:
                                                      FlutterFlowTheme.of(
                                                          context)
                                                          .labelMedium
                                                          .override(
                                                        fontFamily:
                                                        'Inter',
                                                        letterSpacing:
                                                        0.0,
                                                      ),
                                                      enabledBorder:
                                                      OutlineInputBorder(
                                                        borderSide: const BorderSide(
                                                          color:
                                                          Color(0x00000000),
                                                          width: 1.0,
                                                        ),
                                                        borderRadius:
                                                        BorderRadius
                                                            .circular(8.0),
                                                      ),
                                                      focusedBorder:
                                                      OutlineInputBorder(
                                                        borderSide: const BorderSide(
                                                          color:
                                                          Color(0x00000000),
                                                          width: 1.0,
                                                        ),
                                                        borderRadius:
                                                        BorderRadius
                                                            .circular(8.0),
                                                      ),
                                                      errorBorder:
                                                      OutlineInputBorder(
                                                        borderSide: BorderSide(
                                                          color: FlutterFlowTheme
                                                              .of(context)
                                                              .error,
                                                          width: 1.0,
                                                        ),
                                                        borderRadius:
                                                        BorderRadius
                                                            .circular(8.0),
                                                      ),
                                                      focusedErrorBorder:
                                                      OutlineInputBorder(
                                                        borderSide: BorderSide(
                                                          color: FlutterFlowTheme
                                                              .of(context)
                                                              .error,
                                                          width: 1.0,
                                                        ),
                                                        borderRadius:
                                                        BorderRadius
                                                            .circular(8.0),
                                                      ),
                                                      filled: true,
                                                      fillColor:
                                                      const Color(0xFFCECACA),
                                                    ),
                                                    style: FlutterFlowTheme.of(
                                                        context)
                                                        .bodyMedium
                                                        .override(
                                                      fontFamily: 'Inter',
                                                      letterSpacing: 0.0,
                                                    ),
                                                    textAlign: TextAlign.center,
                                                    cursorColor:
                                                    FlutterFlowTheme.of(
                                                        context)
                                                        .primaryText,
                                                    validator: _model
                                                        .brandTextControllerValidator
                                                        .asValidator(context),
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsetsDirectional.fromSTEB(
                                          0.0, 10.0, 0.0, 10.0),
                                      child: Row(
                                        mainAxisSize: MainAxisSize.max,
                                        mainAxisAlignment:
                                        MainAxisAlignment.start,
                                        children: [
                                          Padding(
                                            padding:
                                            const EdgeInsetsDirectional.fromSTEB(
                                                12.0, 0.0, 0.0, 0.0),
                                            child: Text(
                                              'MODELO:',
                                              style:
                                              FlutterFlowTheme.of(context)
                                                  .bodyMedium
                                                  .override(
                                                fontFamily: 'Inter',
                                                fontSize: 15.0,
                                                letterSpacing: 0.0,
                                                fontWeight:
                                                FontWeight.bold,
                                              ),
                                            ),
                                          ),
                                          Expanded(
                                            child: Align(
                                              alignment: const AlignmentDirectional(
                                                  0.0, 0.0),
                                              child: Padding(
                                                padding: const EdgeInsetsDirectional
                                                    .fromSTEB(
                                                    50.0, 0.0, 0.0, 0.0),
                                                child: SizedBox(
                                                  width: 200.0,
                                                  child: TextFormField(
                                                    controller: _model
                                                        .modelTextController,
                                                    focusNode:
                                                    _model.modelFocusNode,
                                                    autofocus: false,
                                                    obscureText: false,
                                                    decoration: InputDecoration(
                                                      isDense: true,
                                                      labelStyle:
                                                      FlutterFlowTheme.of(
                                                          context)
                                                          .labelMedium
                                                          .override(
                                                        fontFamily:
                                                        'Inter',
                                                        letterSpacing:
                                                        0.0,
                                                      ),
                                                      hintText: 'Modelo',
                                                      hintStyle:
                                                      FlutterFlowTheme.of(
                                                          context)
                                                          .labelMedium
                                                          .override(
                                                        fontFamily:
                                                        'Inter',
                                                        letterSpacing:
                                                        0.0,
                                                      ),
                                                      enabledBorder:
                                                      OutlineInputBorder(
                                                        borderSide: const BorderSide(
                                                          color:
                                                          Color(0x00000000),
                                                          width: 1.0,
                                                        ),
                                                        borderRadius:
                                                        BorderRadius
                                                            .circular(8.0),
                                                      ),
                                                      focusedBorder:
                                                      OutlineInputBorder(
                                                        borderSide: const BorderSide(
                                                          color:
                                                          Color(0x00000000),
                                                          width: 1.0,
                                                        ),
                                                        borderRadius:
                                                        BorderRadius
                                                            .circular(8.0),
                                                      ),
                                                      errorBorder:
                                                      OutlineInputBorder(
                                                        borderSide: BorderSide(
                                                          color: FlutterFlowTheme
                                                              .of(context)
                                                              .error,
                                                          width: 1.0,
                                                        ),
                                                        borderRadius:
                                                        BorderRadius
                                                            .circular(8.0),
                                                      ),
                                                      focusedErrorBorder:
                                                      OutlineInputBorder(
                                                        borderSide: BorderSide(
                                                          color: FlutterFlowTheme
                                                              .of(context)
                                                              .error,
                                                          width: 1.0,
                                                        ),
                                                        borderRadius:
                                                        BorderRadius
                                                            .circular(8.0),
                                                      ),
                                                      filled: true,
                                                      fillColor:
                                                      const Color(0xFFCECACA),
                                                    ),
                                                    style: FlutterFlowTheme.of(
                                                        context)
                                                        .bodyMedium
                                                        .override(
                                                      fontFamily: 'Inter',
                                                      letterSpacing: 0.0,
                                                    ),
                                                    textAlign: TextAlign.center,
                                                    cursorColor:
                                                    FlutterFlowTheme.of(
                                                        context)
                                                        .primaryText,
                                                    validator: _model
                                                        .modelTextControllerValidator
                                                        .asValidator(context),
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsetsDirectional.fromSTEB(
                                          0.0, 10.0, 0.0, 10.0),
                                      child: Row(
                                        mainAxisSize: MainAxisSize.max,
                                        mainAxisAlignment:
                                        MainAxisAlignment.start,
                                        children: [
                                          Padding(
                                            padding:
                                            const EdgeInsetsDirectional.fromSTEB(
                                                12.0, 0.0, 0.0, 0.0),
                                            child: Text(
                                              'SERIE:',
                                              style:
                                              FlutterFlowTheme.of(context)
                                                  .bodyMedium
                                                  .override(
                                                fontFamily: 'Inter',
                                                fontSize: 15.0,
                                                letterSpacing: 0.0,
                                                fontWeight:
                                                FontWeight.bold,
                                              ),
                                            ),
                                          ),
                                          Expanded(
                                            child: Align(
                                              alignment: const AlignmentDirectional(
                                                  0.0, 0.0),
                                              child: Padding(
                                                padding: const EdgeInsetsDirectional
                                                    .fromSTEB(
                                                    70.0, 0.0, 0.0, 0.0),
                                                child: SizedBox(
                                                  width: 200.0,
                                                  child: TextFormField(
                                                    controller: _model
                                                        .serieTextController,
                                                    focusNode:
                                                    _model.serieFocusNode,
                                                    autofocus: false,
                                                    obscureText: false,
                                                    decoration: InputDecoration(
                                                      isDense: true,
                                                      labelStyle:
                                                      FlutterFlowTheme.of(
                                                          context)
                                                          .labelMedium
                                                          .override(
                                                        fontFamily:
                                                        'Inter',
                                                        letterSpacing:
                                                        0.0,
                                                      ),
                                                      hintText: 'Serie',
                                                      hintStyle:
                                                      FlutterFlowTheme.of(
                                                          context)
                                                          .labelMedium
                                                          .override(
                                                        fontFamily:
                                                        'Inter',
                                                        letterSpacing:
                                                        0.0,
                                                      ),
                                                      enabledBorder:
                                                      OutlineInputBorder(
                                                        borderSide: const BorderSide(
                                                          color:
                                                          Color(0x00000000),
                                                          width: 1.0,
                                                        ),
                                                        borderRadius:
                                                        BorderRadius
                                                            .circular(8.0),
                                                      ),
                                                      focusedBorder:
                                                      OutlineInputBorder(
                                                        borderSide: const BorderSide(
                                                          color:
                                                          Color(0x00000000),
                                                          width: 1.0,
                                                        ),
                                                        borderRadius:
                                                        BorderRadius
                                                            .circular(8.0),
                                                      ),
                                                      errorBorder:
                                                      OutlineInputBorder(
                                                        borderSide: BorderSide(
                                                          color: FlutterFlowTheme
                                                              .of(context)
                                                              .error,
                                                          width: 1.0,
                                                        ),
                                                        borderRadius:
                                                        BorderRadius
                                                            .circular(8.0),
                                                      ),
                                                      focusedErrorBorder:
                                                      OutlineInputBorder(
                                                        borderSide: BorderSide(
                                                          color: FlutterFlowTheme
                                                              .of(context)
                                                              .error,
                                                          width: 1.0,
                                                        ),
                                                        borderRadius:
                                                        BorderRadius
                                                            .circular(8.0),
                                                      ),
                                                      filled: true,
                                                      fillColor:
                                                      const Color(0xFFCECACA),
                                                    ),
                                                    style: FlutterFlowTheme.of(
                                                        context)
                                                        .bodyMedium
                                                        .override(
                                                      fontFamily: 'Inter',
                                                      letterSpacing: 0.0,
                                                    ),
                                                    textAlign: TextAlign.center,
                                                    cursorColor:
                                                    FlutterFlowTheme.of(
                                                        context)
                                                        .primaryText,
                                                    validator: _model
                                                        .serieTextControllerValidator
                                                        .asValidator(context),
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsetsDirectional.fromSTEB(
                                          0.0, 10.0, 0.0, 10.0),
                                      child: Row(
                                        mainAxisSize: MainAxisSize.max,
                                        mainAxisAlignment:
                                        MainAxisAlignment.start,
                                        children: [
                                          Padding(
                                            padding:
                                            const EdgeInsetsDirectional.fromSTEB(
                                                12.0, 0.0, 0.0, 0.0),
                                            child: Text(
                                              'CODIGO:',
                                              style:
                                              FlutterFlowTheme.of(context)
                                                  .bodyMedium
                                                  .override(
                                                fontFamily: 'Inter',
                                                fontSize: 15.0,
                                                letterSpacing: 0.0,
                                                fontWeight:
                                                FontWeight.bold,
                                              ),
                                            ),
                                          ),
                                          Expanded(
                                            child: Align(
                                              alignment: const AlignmentDirectional(
                                                  0.0, 0.0),
                                              child: Padding(
                                                padding: const EdgeInsetsDirectional
                                                    .fromSTEB(
                                                    20.0, 0.0, 0.0, 0.0),
                                                child: SizedBox(
                                                  width: 200.0,
                                                  child: TextFormField(
                                                    controller: _model
                                                        .codeTextController,
                                                    focusNode:
                                                    _model.codeFocusNode,
                                                    autofocus: false,
                                                    obscureText: false,
                                                    decoration: InputDecoration(
                                                      isDense: true,
                                                      labelStyle:
                                                      FlutterFlowTheme.of(
                                                          context)
                                                          .labelMedium
                                                          .override(
                                                        fontFamily:
                                                        'Inter',
                                                        letterSpacing:
                                                        0.0,
                                                      ),
                                                      hintText: 'Cod.',
                                                      hintStyle:
                                                      FlutterFlowTheme.of(
                                                          context)
                                                          .labelMedium
                                                          .override(
                                                        fontFamily:
                                                        'Inter',
                                                        letterSpacing:
                                                        0.0,
                                                      ),
                                                      enabledBorder:
                                                      OutlineInputBorder(
                                                        borderSide: const BorderSide(
                                                          color:
                                                          Color(0x00000000),
                                                          width: 1.0,
                                                        ),
                                                        borderRadius:
                                                        BorderRadius
                                                            .circular(8.0),
                                                      ),
                                                      focusedBorder:
                                                      OutlineInputBorder(
                                                        borderSide: const BorderSide(
                                                          color:
                                                          Color(0x00000000),
                                                          width: 1.0,
                                                        ),
                                                        borderRadius:
                                                        BorderRadius
                                                            .circular(8.0),
                                                      ),
                                                      errorBorder:
                                                      OutlineInputBorder(
                                                        borderSide: BorderSide(
                                                          color: FlutterFlowTheme
                                                              .of(context)
                                                              .error,
                                                          width: 1.0,
                                                        ),
                                                        borderRadius:
                                                        BorderRadius
                                                            .circular(8.0),
                                                      ),
                                                      focusedErrorBorder:
                                                      OutlineInputBorder(
                                                        borderSide: BorderSide(
                                                          color: FlutterFlowTheme
                                                              .of(context)
                                                              .error,
                                                          width: 1.0,
                                                        ),
                                                        borderRadius:
                                                        BorderRadius
                                                            .circular(8.0),
                                                      ),
                                                      filled: true,
                                                      fillColor:
                                                      const Color(0xFFCECACA),
                                                    ),
                                                    style: FlutterFlowTheme.of(
                                                        context)
                                                        .bodyMedium
                                                        .override(
                                                      fontFamily: 'Inter',
                                                      fontSize: 15.0,
                                                      letterSpacing: 0.0,
                                                    ),
                                                    textAlign: TextAlign.center,
                                                    cursorColor:
                                                    FlutterFlowTheme.of(
                                                        context)
                                                        .primaryText,
                                                    validator: _model
                                                        .codeTextControllerValidator
                                                        .asValidator(context),
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsetsDirectional.fromSTEB(
                                          0.0, 10.0, 0.0, 10.0),
                                      child: Row(
                                        mainAxisSize: MainAxisSize.max,
                                        mainAxisAlignment:
                                        MainAxisAlignment.start,
                                        children: [
                                          Padding(
                                            padding:
                                            const EdgeInsetsDirectional.fromSTEB(
                                                12.0, 0.0, 0.0, 0.0),
                                            child: Text(
                                              'UBICACION:',
                                              style:
                                              FlutterFlowTheme.of(context)
                                                  .bodyMedium
                                                  .override(
                                                fontFamily: 'Inter',
                                                fontSize: 15.0,
                                                letterSpacing: 0.0,
                                                fontWeight:
                                                FontWeight.bold,
                                              ),
                                            ),
                                          ),
                                          Expanded(
                                            child: Align(
                                              alignment: const AlignmentDirectional(
                                                  0.0, 0.0),
                                              child: Padding(
                                                padding: const EdgeInsetsDirectional
                                                    .fromSTEB(
                                                    20.0, 0.0, 0.0, 0.0),
                                                child: SizedBox(
                                                  width: 200.0,
                                                  child: TextFormField(
                                                    controller: _model
                                                        .locationTextController,
                                                    focusNode: _model
                                                        .locationFocusNode,
                                                    autofocus: false,
                                                    obscureText: false,
                                                    decoration: InputDecoration(
                                                      isDense: true,
                                                      labelStyle:
                                                      FlutterFlowTheme.of(
                                                          context)
                                                          .labelMedium
                                                          .override(
                                                        fontFamily:
                                                        'Inter',
                                                        letterSpacing:
                                                        0.0,
                                                      ),
                                                      hintText: 'Ubicacion',
                                                      hintStyle:
                                                      FlutterFlowTheme.of(
                                                          context)
                                                          .labelMedium
                                                          .override(
                                                        fontFamily:
                                                        'Inter',
                                                        letterSpacing:
                                                        0.0,
                                                      ),
                                                      enabledBorder:
                                                      OutlineInputBorder(
                                                        borderSide: const BorderSide(
                                                          color:
                                                          Color(0x00000000),
                                                          width: 1.0,
                                                        ),
                                                        borderRadius:
                                                        BorderRadius
                                                            .circular(8.0),
                                                      ),
                                                      focusedBorder:
                                                      OutlineInputBorder(
                                                        borderSide: const BorderSide(
                                                          color:
                                                          Color(0x00000000),
                                                          width: 1.0,
                                                        ),
                                                        borderRadius:
                                                        BorderRadius
                                                            .circular(8.0),
                                                      ),
                                                      errorBorder:
                                                      OutlineInputBorder(
                                                        borderSide: BorderSide(
                                                          color: FlutterFlowTheme
                                                              .of(context)
                                                              .error,
                                                          width: 1.0,
                                                        ),
                                                        borderRadius:
                                                        BorderRadius
                                                            .circular(8.0),
                                                      ),
                                                      focusedErrorBorder:
                                                      OutlineInputBorder(
                                                        borderSide: BorderSide(
                                                          color: FlutterFlowTheme
                                                              .of(context)
                                                              .error,
                                                          width: 1.0,
                                                        ),
                                                        borderRadius:
                                                        BorderRadius
                                                            .circular(8.0),
                                                      ),
                                                      filled: true,
                                                      fillColor:
                                                      const Color(0xFFCECACA),
                                                    ),
                                                    style: FlutterFlowTheme.of(
                                                        context)
                                                        .bodyMedium
                                                        .override(
                                                      fontFamily: 'Inter',
                                                      fontSize: 15.0,
                                                      letterSpacing: 0.0,
                                                    ),
                                                    textAlign: TextAlign.center,
                                                    cursorColor:
                                                    FlutterFlowTheme.of(
                                                        context)
                                                        .primaryText,
                                                    validator: _model
                                                        .locationTextControllerValidator
                                                        .asValidator(context),
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsetsDirectional.fromSTEB(
                                          0.0, 10.0, 0.0, 10.0),
                                      child: Row(
                                        mainAxisSize: MainAxisSize.max,
                                        mainAxisAlignment:
                                        MainAxisAlignment.center,
                                        children: [
                                          Expanded(
                                            child: Align(
                                              alignment: const AlignmentDirectional(
                                                  0.0, 0.0),
                                              child: FlutterFlowCheckboxGroup(
                                                key: ValueKey((FFAppState()
                                                    .workStatusCheckboxes
                                                    .isNotEmpty)
                                                    .toString()),
                                                options: const [
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
                                                  'LIMPIEZA GENERAL.'
                                                ],
                                                onChanged: (val) =>
                                                    safeSetState(() => _model
                                                        .workStatusCheckboxesValues =
                                                        val),
                                                controller: _model
                                                    .workStatusCheckboxesValueController ??=
                                                    FormFieldController<
                                                        List<String>>(
                                                      [],
                                                    ),
                                                activeColor:
                                                FlutterFlowTheme.of(context)
                                                    .primary,
                                                checkColor:
                                                FlutterFlowTheme.of(context)
                                                    .info,
                                                checkboxBorderColor:
                                                FlutterFlowTheme.of(context)
                                                    .secondaryText,
                                                textStyle:
                                                FlutterFlowTheme.of(context)
                                                    .bodyMedium
                                                    .override(
                                                  fontFamily: 'Inter',
                                                  letterSpacing: 0.0,
                                                  fontWeight:
                                                  FontWeight.bold,
                                                ),
                                                labelPadding:
                                                const EdgeInsetsDirectional
                                                    .fromSTEB(0.0, 12.0,
                                                    0.0, 0.0),
                                                itemPadding:
                                                const EdgeInsetsDirectional
                                                    .fromSTEB(20.0, 0.0,
                                                    0.0, 0.0),
                                                checkboxBorderRadius:
                                                BorderRadius.circular(4.0),
                                                initialized: _model
                                                    .workStatusCheckboxesValues !=
                                                    null,
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsetsDirectional.fromSTEB(
                                          0.0, 10.0, 0.0, 10.0),
                                      child: Row(
                                        mainAxisSize: MainAxisSize.max,
                                        mainAxisAlignment:
                                        MainAxisAlignment.center,
                                        children: [
                                          Padding(
                                            padding:
                                            const EdgeInsetsDirectional.fromSTEB(
                                                12.0, 0.0, 0.0, 0.0),
                                            child: Text(
                                              'OTROS:',
                                              style:
                                              FlutterFlowTheme.of(context)
                                                  .bodyMedium
                                                  .override(
                                                fontFamily: 'Inter',
                                                fontSize: 15.0,
                                                letterSpacing: 0.0,
                                                fontWeight:
                                                FontWeight.bold,
                                              ),
                                            ),
                                          ),
                                          Expanded(
                                            child: Align(
                                              alignment: const AlignmentDirectional(
                                                  0.0, 0.0),
                                              child: SizedBox(
                                                width: 300.0,
                                                child: TextFormField(
                                                  controller: _model
                                                      .workstatusotherTextController,
                                                  focusNode: _model
                                                      .workstatusotherFocusNode,
                                                  autofocus: false,
                                                  obscureText: false,
                                                  decoration: InputDecoration(
                                                    isDense: true,
                                                    labelStyle: FlutterFlowTheme
                                                        .of(context)
                                                        .labelMedium
                                                        .override(
                                                      fontFamily: 'Inter',
                                                      letterSpacing: 0.0,
                                                    ),
                                                    hintText:
                                                    'Proporciona una descripcion',
                                                    hintStyle: FlutterFlowTheme
                                                        .of(context)
                                                        .labelMedium
                                                        .override(
                                                      fontFamily: 'Inter',
                                                      letterSpacing: 0.0,
                                                    ),
                                                    enabledBorder:
                                                    OutlineInputBorder(
                                                      borderSide: const BorderSide(
                                                        color:
                                                        Color(0x00000000),
                                                        width: 1.0,
                                                      ),
                                                      borderRadius:
                                                      BorderRadius.circular(
                                                          8.0),
                                                    ),
                                                    focusedBorder:
                                                    OutlineInputBorder(
                                                      borderSide: const BorderSide(
                                                        color:
                                                        Color(0x00000000),
                                                        width: 1.0,
                                                      ),
                                                      borderRadius:
                                                      BorderRadius.circular(
                                                          8.0),
                                                    ),
                                                    errorBorder:
                                                    OutlineInputBorder(
                                                      borderSide: BorderSide(
                                                        color:
                                                        FlutterFlowTheme.of(
                                                            context)
                                                            .error,
                                                        width: 1.0,
                                                      ),
                                                      borderRadius:
                                                      BorderRadius.circular(
                                                          8.0),
                                                    ),
                                                    focusedErrorBorder:
                                                    OutlineInputBorder(
                                                      borderSide: BorderSide(
                                                        color:
                                                        FlutterFlowTheme.of(
                                                            context)
                                                            .error,
                                                        width: 1.0,
                                                      ),
                                                      borderRadius:
                                                      BorderRadius.circular(
                                                          8.0),
                                                    ),
                                                    filled: true,
                                                    fillColor:
                                                    const Color(0xFFCECACA),
                                                  ),
                                                  style: FlutterFlowTheme.of(
                                                      context)
                                                      .bodyMedium
                                                      .override(
                                                    fontFamily: 'Inter',
                                                    fontSize: 15.0,
                                                    letterSpacing: 0.0,
                                                  ),
                                                  textAlign: TextAlign.center,
                                                  maxLength: 233,
                                                  cursorColor:
                                                  FlutterFlowTheme.of(
                                                      context)
                                                      .primaryText,
                                                  validator: _model
                                                      .workstatusotherTextControllerValidator
                                                      .asValidator(context),
                                                ),
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsetsDirectional.fromSTEB(
                                          0.0, 10.0, 0.0, 10.0),
                                      child: Row(
                                        mainAxisSize: MainAxisSize.max,
                                        mainAxisAlignment:
                                        MainAxisAlignment.center,
                                        children: [
                                          Padding(
                                            padding:
                                            const EdgeInsetsDirectional.fromSTEB(
                                                12.0, 0.0, 0.0, 0.0),
                                            child: Text(
                                              'OBSERVACIONES',
                                              style:
                                              FlutterFlowTheme.of(context)
                                                  .bodyMedium
                                                  .override(
                                                fontFamily: 'Inter',
                                                fontSize: 15.0,
                                                letterSpacing: 0.0,
                                                fontWeight:
                                                FontWeight.bold,
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsetsDirectional.fromSTEB(
                                          0.0, 10.0, 0.0, 10.0),
                                      child: Row(
                                        mainAxisSize: MainAxisSize.max,
                                        mainAxisAlignment:
                                        MainAxisAlignment.start,
                                        children: [
                                          Expanded(
                                            child: Align(
                                              alignment: const AlignmentDirectional(
                                                  0.0, 0.0),
                                              child: TextFormField(
                                                controller: _model
                                                    .observationsTextController,
                                                focusNode: _model
                                                    .observationsFocusNode,
                                                autofocus: false,
                                                obscureText: false,
                                                decoration: InputDecoration(
                                                  isDense: true,
                                                  labelStyle:
                                                  FlutterFlowTheme.of(
                                                      context)
                                                      .labelMedium
                                                      .override(
                                                    fontFamily: 'Inter',
                                                    letterSpacing: 0.0,
                                                  ),
                                                  hintText: 'Escribe....',
                                                  hintStyle:
                                                  FlutterFlowTheme.of(
                                                      context)
                                                      .labelMedium
                                                      .override(
                                                    fontFamily: 'Inter',
                                                    letterSpacing: 0.0,
                                                  ),
                                                  enabledBorder:
                                                  OutlineInputBorder(
                                                    borderSide: const BorderSide(
                                                      color: Color(0x00000000),
                                                      width: 1.0,
                                                    ),
                                                    borderRadius:
                                                    BorderRadius.circular(
                                                        8.0),
                                                  ),
                                                  focusedBorder:
                                                  OutlineInputBorder(
                                                    borderSide: const BorderSide(
                                                      color: Color(0x00000000),
                                                      width: 1.0,
                                                    ),
                                                    borderRadius:
                                                    BorderRadius.circular(
                                                        8.0),
                                                  ),
                                                  errorBorder:
                                                  OutlineInputBorder(
                                                    borderSide: BorderSide(
                                                      color:
                                                      FlutterFlowTheme.of(
                                                          context)
                                                          .error,
                                                      width: 1.0,
                                                    ),
                                                    borderRadius:
                                                    BorderRadius.circular(
                                                        8.0),
                                                  ),
                                                  focusedErrorBorder:
                                                  OutlineInputBorder(
                                                    borderSide: BorderSide(
                                                      color:
                                                      FlutterFlowTheme.of(
                                                          context)
                                                          .error,
                                                      width: 1.0,
                                                    ),
                                                    borderRadius:
                                                    BorderRadius.circular(
                                                        8.0),
                                                  ),
                                                  filled: true,
                                                  fillColor: const Color(0xFFCECACA),
                                                ),
                                                style:
                                                FlutterFlowTheme.of(context)
                                                    .bodyMedium
                                                    .override(
                                                  fontFamily: 'Inter',
                                                  fontSize: 15.0,
                                                  letterSpacing: 0.0,
                                                ),
                                                textAlign: TextAlign.justify,
                                                maxLines: 20,
                                                maxLength: 662,
                                                cursorColor:
                                                FlutterFlowTheme.of(context)
                                                    .primaryText,
                                                validator: _model
                                                    .observationsTextControllerValidator
                                                    .asValidator(context),
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsetsDirectional.fromSTEB(
                                          0.0, 10.0, 0.0, 10.0),
                                      child: Row(
                                        mainAxisSize: MainAxisSize.max,
                                        mainAxisAlignment:
                                        MainAxisAlignment.center,
                                        children: [
                                          Padding(
                                            padding:
                                            const EdgeInsetsDirectional.fromSTEB(
                                                12.0, 0.0, 0.0, 0.0),
                                            child: Text(
                                              'RECOMENDACIONES',
                                              style:
                                              FlutterFlowTheme.of(context)
                                                  .bodyMedium
                                                  .override(
                                                fontFamily: 'Inter',
                                                fontSize: 15.0,
                                                letterSpacing: 0.0,
                                                fontWeight:
                                                FontWeight.bold,
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsetsDirectional.fromSTEB(
                                          0.0, 10.0, 0.0, 10.0),
                                      child: Row(
                                        mainAxisSize: MainAxisSize.max,
                                        mainAxisAlignment:
                                        MainAxisAlignment.start,
                                        children: [
                                          Expanded(
                                            child: Align(
                                              alignment: const AlignmentDirectional(
                                                  0.0, 0.0),
                                              child: TextFormField(
                                                controller: _model
                                                    .recommendationsTextController,
                                                focusNode: _model
                                                    .recommendationsFocusNode,
                                                autofocus: false,
                                                obscureText: false,
                                                decoration: InputDecoration(
                                                  isDense: true,
                                                  labelStyle:
                                                  FlutterFlowTheme.of(
                                                      context)
                                                      .labelMedium
                                                      .override(
                                                    fontFamily: 'Inter',
                                                    letterSpacing: 0.0,
                                                  ),
                                                  hintText: 'Escribe....',
                                                  hintStyle:
                                                  FlutterFlowTheme.of(
                                                      context)
                                                      .labelMedium
                                                      .override(
                                                    fontFamily: 'Inter',
                                                    letterSpacing: 0.0,
                                                  ),
                                                  enabledBorder:
                                                  OutlineInputBorder(
                                                    borderSide: const BorderSide(
                                                      color: Color(0x00000000),
                                                      width: 1.0,
                                                    ),
                                                    borderRadius:
                                                    BorderRadius.circular(
                                                        8.0),
                                                  ),
                                                  focusedBorder:
                                                  OutlineInputBorder(
                                                    borderSide: const BorderSide(
                                                      color: Color(0x00000000),
                                                      width: 1.0,
                                                    ),
                                                    borderRadius:
                                                    BorderRadius.circular(
                                                        8.0),
                                                  ),
                                                  errorBorder:
                                                  OutlineInputBorder(
                                                    borderSide: BorderSide(
                                                      color:
                                                      FlutterFlowTheme.of(
                                                          context)
                                                          .error,
                                                      width: 1.0,
                                                    ),
                                                    borderRadius:
                                                    BorderRadius.circular(
                                                        8.0),
                                                  ),
                                                  focusedErrorBorder:
                                                  OutlineInputBorder(
                                                    borderSide: BorderSide(
                                                      color:
                                                      FlutterFlowTheme.of(
                                                          context)
                                                          .error,
                                                      width: 1.0,
                                                    ),
                                                    borderRadius:
                                                    BorderRadius.circular(
                                                        8.0),
                                                  ),
                                                  filled: true,
                                                  fillColor: const Color(0xFFCECACA),
                                                ),
                                                style:
                                                FlutterFlowTheme.of(context)
                                                    .bodyMedium
                                                    .override(
                                                  fontFamily: 'Inter',
                                                  fontSize: 15.0,
                                                  letterSpacing: 0.0,
                                                ),
                                                textAlign: TextAlign.justify,
                                                maxLines: 20,
                                                maxLength: 662,
                                                cursorColor:
                                                FlutterFlowTheme.of(context)
                                                    .primaryText,
                                                validator: _model
                                                    .recommendationsTextControllerValidator
                                                    .asValidator(context),
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsetsDirectional.fromSTEB(
                                          0.0, 10.0, 0.0, 10.0),
                                      child: Row(
                                        mainAxisSize: MainAxisSize.max,
                                        mainAxisAlignment:
                                        MainAxisAlignment.start,
                                        children: [
                                          Padding(
                                            padding:
                                            const EdgeInsetsDirectional.fromSTEB(
                                                12.0, 0.0, 0.0, 0.0),
                                            child: Text(
                                              'INICIO:',
                                              style:
                                              FlutterFlowTheme.of(context)
                                                  .bodyMedium
                                                  .override(
                                                fontFamily: 'Inter',
                                                fontSize: 15.0,
                                                letterSpacing: 0.0,
                                                fontWeight:
                                                FontWeight.bold,
                                              ),
                                            ),
                                          ),
                                          Expanded(
                                            child: Align(
                                              alignment: const AlignmentDirectional(
                                                  0.0, 0.0),
                                              child: SizedBox(
                                                width: 200.0,
                                                child: TextFormField(
                                                  controller: _model
                                                      .startworkhoursTextController,
                                                  focusNode: _model
                                                      .startworkhoursFocusNode,
                                                  autofocus: false,
                                                  obscureText: false,
                                                  decoration: InputDecoration(
                                                    isDense: true,
                                                    labelStyle: FlutterFlowTheme
                                                        .of(context)
                                                        .labelMedium
                                                        .override(
                                                      fontFamily: 'Inter',
                                                      letterSpacing: 0.0,
                                                    ),
                                                    hintText: 'Inicio',
                                                    hintStyle: FlutterFlowTheme
                                                        .of(context)
                                                        .labelMedium
                                                        .override(
                                                      fontFamily: 'Inter',
                                                      letterSpacing: 0.0,
                                                    ),
                                                    enabledBorder:
                                                    OutlineInputBorder(
                                                      borderSide: const BorderSide(
                                                        color:
                                                        Color(0x00000000),
                                                        width: 1.0,
                                                      ),
                                                      borderRadius:
                                                      BorderRadius.circular(
                                                          8.0),
                                                    ),
                                                    focusedBorder:
                                                    OutlineInputBorder(
                                                      borderSide: const BorderSide(
                                                        color:
                                                        Color(0x00000000),
                                                        width: 1.0,
                                                      ),
                                                      borderRadius:
                                                      BorderRadius.circular(
                                                          8.0),
                                                    ),
                                                    errorBorder:
                                                    OutlineInputBorder(
                                                      borderSide: BorderSide(
                                                        color:
                                                        FlutterFlowTheme.of(
                                                            context)
                                                            .error,
                                                        width: 1.0,
                                                      ),
                                                      borderRadius:
                                                      BorderRadius.circular(
                                                          8.0),
                                                    ),
                                                    focusedErrorBorder:
                                                    OutlineInputBorder(
                                                      borderSide: BorderSide(
                                                        color:
                                                        FlutterFlowTheme.of(
                                                            context)
                                                            .error,
                                                        width: 1.0,
                                                      ),
                                                      borderRadius:
                                                      BorderRadius.circular(
                                                          8.0),
                                                    ),
                                                    filled: true,
                                                    fillColor:
                                                    const Color(0xFFCECACA),
                                                  ),
                                                  style: FlutterFlowTheme.of(
                                                      context)
                                                      .bodyMedium
                                                      .override(
                                                    fontFamily: 'Inter',
                                                    fontSize: 15.0,
                                                    letterSpacing: 0.0,
                                                  ),
                                                  textAlign: TextAlign.center,
                                                  maxLines: null,
                                                  cursorColor:
                                                  FlutterFlowTheme.of(
                                                      context)
                                                      .primaryText,
                                                  validator: _model
                                                      .startworkhoursTextControllerValidator
                                                      .asValidator(context),
                                                ),
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsetsDirectional.fromSTEB(
                                          0.0, 10.0, 0.0, 10.0),
                                      child: Row(
                                        mainAxisSize: MainAxisSize.max,
                                        mainAxisAlignment:
                                        MainAxisAlignment.start,
                                        children: [
                                          Padding(
                                            padding:
                                            const EdgeInsetsDirectional.fromSTEB(
                                                12.0, 0.0, 0.0, 0.0),
                                            child: Text(
                                              'FIN:',
                                              style:
                                              FlutterFlowTheme.of(context)
                                                  .bodyMedium
                                                  .override(
                                                fontFamily: 'Inter',
                                                fontSize: 15.0,
                                                letterSpacing: 0.0,
                                                fontWeight:
                                                FontWeight.bold,
                                              ),
                                            ),
                                          ),
                                          Expanded(
                                            child: Align(
                                              alignment: const AlignmentDirectional(
                                                  0.0, 0.0),
                                              child: SizedBox(
                                                width: 200.0,
                                                child: TextFormField(
                                                  controller: _model
                                                      .endtworkhoursTextController,
                                                  focusNode: _model
                                                      .endtworkhoursFocusNode,
                                                  autofocus: false,
                                                  obscureText: false,
                                                  decoration: InputDecoration(
                                                    isDense: true,
                                                    labelStyle: FlutterFlowTheme
                                                        .of(context)
                                                        .labelMedium
                                                        .override(
                                                      fontFamily: 'Inter',
                                                      letterSpacing: 0.0,
                                                    ),
                                                    hintText: 'Fin',
                                                    hintStyle: FlutterFlowTheme
                                                        .of(context)
                                                        .labelMedium
                                                        .override(
                                                      fontFamily: 'Inter',
                                                      letterSpacing: 0.0,
                                                    ),
                                                    enabledBorder:
                                                    OutlineInputBorder(
                                                      borderSide: const BorderSide(
                                                        color:
                                                        Color(0x00000000),
                                                        width: 1.0,
                                                      ),
                                                      borderRadius:
                                                      BorderRadius.circular(
                                                          8.0),
                                                    ),
                                                    focusedBorder:
                                                    OutlineInputBorder(
                                                      borderSide: const BorderSide(
                                                        color:
                                                        Color(0x00000000),
                                                        width: 1.0,
                                                      ),
                                                      borderRadius:
                                                      BorderRadius.circular(
                                                          8.0),
                                                    ),
                                                    errorBorder:
                                                    OutlineInputBorder(
                                                      borderSide: BorderSide(
                                                        color:
                                                        FlutterFlowTheme.of(
                                                            context)
                                                            .error,
                                                        width: 1.0,
                                                      ),
                                                      borderRadius:
                                                      BorderRadius.circular(
                                                          8.0),
                                                    ),
                                                    focusedErrorBorder:
                                                    OutlineInputBorder(
                                                      borderSide: BorderSide(
                                                        color:
                                                        FlutterFlowTheme.of(
                                                            context)
                                                            .error,
                                                        width: 1.0,
                                                      ),
                                                      borderRadius:
                                                      BorderRadius.circular(
                                                          8.0),
                                                    ),
                                                    filled: true,
                                                    fillColor:
                                                    const Color(0xFFCECACA),
                                                  ),
                                                  style: FlutterFlowTheme.of(
                                                      context)
                                                      .bodyMedium
                                                      .override(
                                                    fontFamily: 'Inter',
                                                    fontSize: 15.0,
                                                    letterSpacing: 0.0,
                                                  ),
                                                  textAlign: TextAlign.center,
                                                  maxLines: null,
                                                  cursorColor:
                                                  FlutterFlowTheme.of(
                                                      context)
                                                      .primaryText,
                                                  validator: _model
                                                      .endtworkhoursTextControllerValidator
                                                      .asValidator(context),
                                                ),
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsetsDirectional.fromSTEB(
                                          0.0, 10.0, 0.0, 10.0),
                                      child: Row(
                                        mainAxisSize: MainAxisSize.max,
                                        mainAxisAlignment:
                                        MainAxisAlignment.start,
                                        children: [
                                          Padding(
                                            padding:
                                            const EdgeInsetsDirectional.fromSTEB(
                                                12.0, 0.0, 0.0, 0.0),
                                            child: Text(
                                              'TOTAL:',
                                              style:
                                              FlutterFlowTheme.of(context)
                                                  .bodyMedium
                                                  .override(
                                                fontFamily: 'Inter',
                                                fontSize: 15.0,
                                                letterSpacing: 0.0,
                                                fontWeight:
                                                FontWeight.bold,
                                              ),
                                            ),
                                          ),
                                          Expanded(
                                            child: Align(
                                              alignment: const AlignmentDirectional(
                                                  0.0, 0.0),
                                              child: SizedBox(
                                                width: 200.0,
                                                child: TextFormField(
                                                  controller: _model
                                                      .totalworkhoursTextController,
                                                  focusNode: _model
                                                      .totalworkhoursFocusNode,
                                                  autofocus: false,
                                                  obscureText: false,
                                                  decoration: InputDecoration(
                                                    isDense: true,
                                                    labelStyle: FlutterFlowTheme
                                                        .of(context)
                                                        .labelMedium
                                                        .override(
                                                      fontFamily: 'Inter',
                                                      letterSpacing: 0.0,
                                                    ),
                                                    hintText: 'Total',
                                                    hintStyle: FlutterFlowTheme
                                                        .of(context)
                                                        .labelMedium
                                                        .override(
                                                      fontFamily: 'Inter',
                                                      letterSpacing: 0.0,
                                                    ),
                                                    enabledBorder:
                                                    OutlineInputBorder(
                                                      borderSide: const BorderSide(
                                                        color:
                                                        Color(0x00000000),
                                                        width: 1.0,
                                                      ),
                                                      borderRadius:
                                                      BorderRadius.circular(
                                                          8.0),
                                                    ),
                                                    focusedBorder:
                                                    OutlineInputBorder(
                                                      borderSide: const BorderSide(
                                                        color:
                                                        Color(0x00000000),
                                                        width: 1.0,
                                                      ),
                                                      borderRadius:
                                                      BorderRadius.circular(
                                                          8.0),
                                                    ),
                                                    errorBorder:
                                                    OutlineInputBorder(
                                                      borderSide: BorderSide(
                                                        color:
                                                        FlutterFlowTheme.of(
                                                            context)
                                                            .error,
                                                        width: 1.0,
                                                      ),
                                                      borderRadius:
                                                      BorderRadius.circular(
                                                          8.0),
                                                    ),
                                                    focusedErrorBorder:
                                                    OutlineInputBorder(
                                                      borderSide: BorderSide(
                                                        color:
                                                        FlutterFlowTheme.of(
                                                            context)
                                                            .error,
                                                        width: 1.0,
                                                      ),
                                                      borderRadius:
                                                      BorderRadius.circular(
                                                          8.0),
                                                    ),
                                                    filled: true,
                                                    fillColor:
                                                    const Color(0xFFCECACA),
                                                  ),
                                                  style: FlutterFlowTheme.of(
                                                      context)
                                                      .bodyMedium
                                                      .override(
                                                    fontFamily: 'Inter',
                                                    fontSize: 15.0,
                                                    letterSpacing: 0.0,
                                                  ),
                                                  textAlign: TextAlign.center,
                                                  maxLines: null,
                                                  cursorColor:
                                                  FlutterFlowTheme.of(
                                                      context)
                                                      .primaryText,
                                                  validator: _model
                                                      .totalworkhoursTextControllerValidator
                                                      .asValidator(context),
                                                ),
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsetsDirectional.fromSTEB(
                                          0.0, 10.0, 0.0, 10.0),
                                      child: Row(
                                        mainAxisSize: MainAxisSize.max,
                                        mainAxisAlignment:
                                        MainAxisAlignment.start,
                                        children: [
                                          Padding(
                                            padding:
                                            const EdgeInsetsDirectional.fromSTEB(
                                                12.0, 0.0, 0.0, 0.0),
                                            child: Text(
                                              'CONTRATO\nMANTENIMIENTO N°:',
                                              style:
                                              FlutterFlowTheme.of(context)
                                                  .bodyMedium
                                                  .override(
                                                fontFamily: 'Inter',
                                                fontSize: 15.0,
                                                letterSpacing: 0.0,
                                                fontWeight:
                                                FontWeight.bold,
                                              ),
                                            ),
                                          ),
                                          Expanded(
                                            child: Align(
                                              alignment: const AlignmentDirectional(
                                                  0.0, 0.0),
                                              child: SizedBox(
                                                width: 200.0,
                                                child: TextFormField(
                                                  controller: _model
                                                      .maintenancecontractTextController,
                                                  focusNode: _model
                                                      .maintenancecontractFocusNode,
                                                  autofocus: false,
                                                  obscureText: false,
                                                  decoration: InputDecoration(
                                                    isDense: true,
                                                    labelStyle: FlutterFlowTheme
                                                        .of(context)
                                                        .labelMedium
                                                        .override(
                                                      fontFamily: 'Inter',
                                                      letterSpacing: 0.0,
                                                    ),
                                                    hintText: 'Escribe...',
                                                    hintStyle: FlutterFlowTheme
                                                        .of(context)
                                                        .labelMedium
                                                        .override(
                                                      fontFamily: 'Inter',
                                                      letterSpacing: 0.0,
                                                    ),
                                                    enabledBorder:
                                                    OutlineInputBorder(
                                                      borderSide: const BorderSide(
                                                        color:
                                                        Color(0x00000000),
                                                        width: 1.0,
                                                      ),
                                                      borderRadius:
                                                      BorderRadius.circular(
                                                          8.0),
                                                    ),
                                                    focusedBorder:
                                                    OutlineInputBorder(
                                                      borderSide: const BorderSide(
                                                        color:
                                                        Color(0x00000000),
                                                        width: 1.0,
                                                      ),
                                                      borderRadius:
                                                      BorderRadius.circular(
                                                          8.0),
                                                    ),
                                                    errorBorder:
                                                    OutlineInputBorder(
                                                      borderSide: BorderSide(
                                                        color:
                                                        FlutterFlowTheme.of(
                                                            context)
                                                            .error,
                                                        width: 1.0,
                                                      ),
                                                      borderRadius:
                                                      BorderRadius.circular(
                                                          8.0),
                                                    ),
                                                    focusedErrorBorder:
                                                    OutlineInputBorder(
                                                      borderSide: BorderSide(
                                                        color:
                                                        FlutterFlowTheme.of(
                                                            context)
                                                            .error,
                                                        width: 1.0,
                                                      ),
                                                      borderRadius:
                                                      BorderRadius.circular(
                                                          8.0),
                                                    ),
                                                    filled: true,
                                                    fillColor:
                                                    const Color(0xFFCECACA),
                                                  ),
                                                  style: FlutterFlowTheme.of(
                                                      context)
                                                      .bodyMedium
                                                      .override(
                                                    fontFamily: 'Inter',
                                                    fontSize: 15.0,
                                                    letterSpacing: 0.0,
                                                  ),
                                                  textAlign: TextAlign.center,
                                                  maxLines: null,
                                                  cursorColor:
                                                  FlutterFlowTheme.of(
                                                      context)
                                                      .primaryText,
                                                  validator: _model
                                                      .maintenancecontractTextControllerValidator
                                                      .asValidator(context),
                                                ),
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsetsDirectional.fromSTEB(
                                          0.0, 10.0, 0.0, 10.0),
                                      child: Row(
                                        mainAxisSize: MainAxisSize.max,
                                        mainAxisAlignment:
                                        MainAxisAlignment.start,
                                        children: [
                                          Padding(
                                            padding:
                                            const EdgeInsetsDirectional.fromSTEB(
                                                12.0, 0.0, 0.0, 0.0),
                                            child: Text(
                                              'N° DE VISITAS',
                                              style:
                                              FlutterFlowTheme.of(context)
                                                  .bodyMedium
                                                  .override(
                                                fontFamily: 'Inter',
                                                fontSize: 15.0,
                                                letterSpacing: 0.0,
                                                fontWeight:
                                                FontWeight.bold,
                                              ),
                                            ),
                                          ),
                                          Expanded(
                                            child: Align(
                                              alignment: const AlignmentDirectional(
                                                  0.0, 0.0),
                                              child: Padding(
                                                padding: const EdgeInsetsDirectional
                                                    .fromSTEB(
                                                    50.0, 0.0, 0.0, 0.0),
                                                child: SizedBox(
                                                  width: 200.0,
                                                  child: TextFormField(
                                                    controller: _model
                                                        .numberofvisitsTextController,
                                                    focusNode: _model
                                                        .numberofvisitsFocusNode,
                                                    autofocus: false,
                                                    obscureText: false,
                                                    decoration: InputDecoration(
                                                      isDense: true,
                                                      labelStyle:
                                                      FlutterFlowTheme.of(
                                                          context)
                                                          .labelMedium
                                                          .override(
                                                        fontFamily:
                                                        'Inter',
                                                        letterSpacing:
                                                        0.0,
                                                      ),
                                                      hintText: 'Escribe...',
                                                      hintStyle:
                                                      FlutterFlowTheme.of(
                                                          context)
                                                          .labelMedium
                                                          .override(
                                                        fontFamily:
                                                        'Inter',
                                                        letterSpacing:
                                                        0.0,
                                                      ),
                                                      enabledBorder:
                                                      OutlineInputBorder(
                                                        borderSide: const BorderSide(
                                                          color:
                                                          Color(0x00000000),
                                                          width: 1.0,
                                                        ),
                                                        borderRadius:
                                                        BorderRadius
                                                            .circular(8.0),
                                                      ),
                                                      focusedBorder:
                                                      OutlineInputBorder(
                                                        borderSide: const BorderSide(
                                                          color:
                                                          Color(0x00000000),
                                                          width: 1.0,
                                                        ),
                                                        borderRadius:
                                                        BorderRadius
                                                            .circular(8.0),
                                                      ),
                                                      errorBorder:
                                                      OutlineInputBorder(
                                                        borderSide: BorderSide(
                                                          color: FlutterFlowTheme
                                                              .of(context)
                                                              .error,
                                                          width: 1.0,
                                                        ),
                                                        borderRadius:
                                                        BorderRadius
                                                            .circular(8.0),
                                                      ),
                                                      focusedErrorBorder:
                                                      OutlineInputBorder(
                                                        borderSide: BorderSide(
                                                          color: FlutterFlowTheme
                                                              .of(context)
                                                              .error,
                                                          width: 1.0,
                                                        ),
                                                        borderRadius:
                                                        BorderRadius
                                                            .circular(8.0),
                                                      ),
                                                      filled: true,
                                                      fillColor:
                                                      const Color(0xFFCECACA),
                                                    ),
                                                    style: FlutterFlowTheme.of(
                                                        context)
                                                        .bodyMedium
                                                        .override(
                                                      fontFamily: 'Inter',
                                                      fontSize: 15.0,
                                                      letterSpacing: 0.0,
                                                    ),
                                                    textAlign: TextAlign.center,
                                                    maxLines: null,
                                                    cursorColor:
                                                    FlutterFlowTheme.of(
                                                        context)
                                                        .primaryText,
                                                    validator: _model
                                                        .numberofvisitsTextControllerValidator
                                                        .asValidator(context),
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsetsDirectional.fromSTEB(
                                          0.0, 10.0, 0.0, 10.0),
                                      child: Row(
                                        mainAxisSize: MainAxisSize.max,
                                        mainAxisAlignment:
                                        MainAxisAlignment.start,
                                        children: [
                                          Expanded(
                                            child: Material(
                                              color: Colors.transparent,
                                              child: SwitchListTile.adaptive(
                                                key: ValueKey(FFAppState()
                                                    .includeSignatureSpace
                                                    .toString()),
                                                value: _model
                                                    .includeSignatureSpaceValue ??=
                                                false,
                                                onChanged: (newValue) async {
                                                  safeSetState(() => _model
                                                      .includeSignatureSpaceValue =
                                                      newValue);
                                                },
                                                title: Text(
                                                  '¿AGREGAR FIRMA ?',
                                                  style: FlutterFlowTheme.of(
                                                      context)
                                                      .titleLarge
                                                      .override(
                                                    fontFamily:
                                                    'Inter Tight',
                                                    fontSize: 15.0,
                                                    letterSpacing: 0.0,
                                                  ),
                                                ),
                                                subtitle: Text(
                                                  'SI O NO',
                                                  style: FlutterFlowTheme.of(
                                                      context)
                                                      .labelMedium
                                                      .override(
                                                    fontFamily: 'Inter',
                                                    letterSpacing: 0.0,
                                                  ),
                                                ),
                                                activeColor:
                                                FlutterFlowTheme.of(context)
                                                    .alternate,
                                                activeTrackColor:
                                                FlutterFlowTheme.of(context)
                                                    .primary,
                                                dense: false,
                                                controlAffinity:
                                                ListTileControlAffinity
                                                    .trailing,
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    // Form: Envolviendo los widgets de categoría y subcategorías
                                    Form(
                                      key: _model.formKey2, // Utilizando el formKey2
                                      child: Column(
                                        children: [
                                          // Texto: Selecciona una Categoría
                                          Padding(
                                            padding: const EdgeInsetsDirectional.fromSTEB(0.0, 10.0, 0.0, 10.0),
                                            child: Row(
                                              mainAxisSize: MainAxisSize.max,
                                              mainAxisAlignment: MainAxisAlignment.center,
                                              children: [
                                                Align(
                                                  alignment: const AlignmentDirectional(0.0, 0.0),
                                                  child: Text(
                                                    'SELECCIONA UNA CATEGORÍA',
                                                    textAlign: TextAlign.center,
                                                    style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                      fontFamily: 'Inter',
                                                      fontSize: 15.0,
                                                      fontWeight: FontWeight.bold,
                                                    ),
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),

                                          // Dropdown: Categorías
                                          Padding(
                                            padding: const EdgeInsetsDirectional.fromSTEB(0.0, 10.0, 0.0, 10.0),
                                            child: StreamBuilder<List<CategorysRecord>>(
                                              stream: queryCategorysRecord(),
                                              builder: (context, snapshot) {
                                                if (!snapshot.hasData) {
                                                  return const Center(child: CircularProgressIndicator());
                                                }
                                                final categories = snapshot.data!;
                                                return FlutterFlowDropDown<String>(
                                                  controller: _model.categoryDropdownController ??= FormFieldController<String>(null),
                                                  options: categories.map((e) => e.category).toList(),
                                                  onChanged: (val) {
                                                    safeSetState(() {
                                                      _model.selectedCategory = val;
                                                      _model.categoriValue = val; // Aseguramos que se actualice el valor validado
                                                      _model.selectedlistsubcategorys = []; // Reinicia subcategorías
                                                    });
                                                  },
                                                  width: 300.0,
                                                  height: 40.0,
                                                  textStyle: FlutterFlowTheme.of(context).bodyMedium,
                                                  hintText: 'Seleccionar Categoría',
                                                  icon: Icon(
                                                    Icons.keyboard_arrow_down_rounded,
                                                    color: FlutterFlowTheme.of(context).secondaryText,
                                                    size: 24.0,
                                                  ),
                                                  fillColor: const Color(0xFFBCBCBC),
                                                  elevation: 2.0,
                                                  borderColor: Colors.transparent,
                                                  borderRadius: 8.0,
                                                  borderWidth: 0.0, // Solución para el error de 'borderWidth'
                                                  margin: const EdgeInsetsDirectional.fromSTEB(
                                                      12.0, 0.0, 12.0, 0.0), // Solución para el error de 'margin'
                                                );

                                              },
                                            ),
                                          ),

                                          if (_model.selectedCategory != null) ...[
                                            // Texto: Selecciona Subcategorías
                                            Padding(
                                              padding:
                                              const EdgeInsetsDirectional.fromSTEB(0.0, 10.0, 0.0, 10.0),
                                              child: Row(
                                                mainAxisSize: MainAxisSize.max,
                                                mainAxisAlignment: MainAxisAlignment.center,
                                                children: [
                                                  Align(
                                                    alignment: const AlignmentDirectional(0.0, 0.0),
                                                    child: Text(
                                                      'SELECCIONA SUBCATEGORÍAS',
                                                      textAlign: TextAlign.center,
                                                      style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                        fontFamily: 'Inter',
                                                        fontSize: 15.0,
                                                        fontWeight: FontWeight.bold,
                                                      ),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),

                                            // Lista: Subcategorías con Checkboxes
                                            Padding(
                                              padding:
                                              const EdgeInsetsDirectional.fromSTEB(0.0, 10.0, 0.0, 10.0),
                                              child: StreamBuilder<List<CategorysRecord>>(
                                                stream: queryCategorysRecord(
                                                  queryBuilder: (category) =>
                                                      category.where('category', isEqualTo: _model.selectedCategory),
                                                ),
                                                builder: (context, snapshot) {
                                                  if (!snapshot.hasData || snapshot.data!.isEmpty) {
                                                    return const Center(child: CircularProgressIndicator());
                                                  }

                                                  // Obtenemos la categoría seleccionada y sus subcategorías
                                                  final category = snapshot.data!.first;
                                                  final List<String> subcategories = (category.listsubcategorys
                                                  is String)
                                                      ? (category.listsubcategorys as String).split(',')
                                                      : [];

                                                  // Mostramos las subcategorías como palabras completas
                                                  return ListView.builder(
                                                    shrinkWrap: true,
                                                    itemCount: subcategories.length,
                                                    itemBuilder: (context, index) {
                                                      final subcategory = subcategories[index];
                                                      return CheckboxListTile(
                                                        value:
                                                        _model.selectedlistsubcategorys.contains(subcategory),
                                                        onChanged: (bool? isSelected) {
                                                          safeSetState(() {
                                                            if (isSelected == true) {
                                                              _model.selectedlistsubcategorys.add(subcategory);
                                                            } else {
                                                              _model.selectedlistsubcategorys.remove(subcategory);
                                                            }
                                                          });
                                                        },
                                                        title: Text(
                                                          subcategory,
                                                          style: FlutterFlowTheme.of(context).bodyMedium,
                                                        ),
                                                      );
                                                    },
                                                  );
                                                },
                                              ),
                                            ),
                                          ],
                                        ],
                                      ),
                                    ),

                                    Padding(
                                      padding: const EdgeInsetsDirectional.fromSTEB(0.0, 10.0, 0.0, 10.0),
                                      child: Row(
                                        mainAxisSize: MainAxisSize.max,
                                        mainAxisAlignment: MainAxisAlignment.center,
                                        children: [
                                          FFButtonWidget(
                                            onPressed: () async {
                                              print("=== Botón de ACTUALIZAR presionado ===");

                                              // Validación de Categoría
                                              if (_model.categoriValue == null || _model.categoriValue!.isEmpty) {
                                                print("Error: Categoría no seleccionada.");
                                                ScaffoldMessenger.of(context).showSnackBar(
                                                  SnackBar(
                                                    content: Text(
                                                      'Debes seleccionar una categoría.',
                                                      style: TextStyle(color: FlutterFlowTheme.of(context).primaryText),
                                                    ),
                                                    duration: const Duration(milliseconds: 4000),
                                                    backgroundColor: FlutterFlowTheme.of(context).error,
                                                  ),
                                                );
                                                return;
                                              }

                                              // Validación de Subcategorías (verificar si hay al menos una seleccionada)
                                              if (_model.selectedlistsubcategorys.isEmpty) {
                                                print("Error: Ninguna subcategoría seleccionada.");
                                                ScaffoldMessenger.of(context).showSnackBar(
                                                  SnackBar(
                                                    content: Text(
                                                      'Debes seleccionar al menos una subcategoría.',
                                                      style: TextStyle(color: FlutterFlowTheme.of(context).primaryText),
                                                    ),
                                                    duration: const Duration(milliseconds: 4000),
                                                    backgroundColor: FlutterFlowTheme.of(context).error,
                                                  ),
                                                );
                                                return;
                                              }

                                              try {
                                                print("=== Iniciando actualización del PDF ===");

                                                // Llamada a la acción updatePDF
                                                await actions.updatePDF(
                                                  _model.clientnameTextController?.text,
                                                  _model.namebuisnessTextController?.text,
                                                  _model.addressnameTextController?.text,
                                                  _model.phoneTextController.text,
                                                  _model.datePicked,
                                                  _model.teamTextController?.text,
                                                  _model.brandTextController?.text,
                                                  _model.modelTextController?.text,
                                                  _model.serieTextController?.text,
                                                  _model.codeTextController?.text,
                                                  _model.locationTextController?.text,
                                                  _model.workStatusCheckboxesValues?.toList(),
                                                  _model.workstatusotherTextController?.text,
                                                  _model.observationsTextController?.text,
                                                  _model.recommendationsTextController?.text,
                                                  int.tryParse(_model.startworkhoursTextController?.text ?? ''),
                                                  int.tryParse(_model.endtworkhoursTextController?.text ?? ''),
                                                  int.tryParse(_model.totalworkhoursTextController?.text ?? ''),
                                                  int.tryParse(_model.maintenancecontractTextController?.text ?? ''),
                                                  int.tryParse(_model.numberofvisitsTextController?.text ?? ''),
                                                  'https://storage.googleapis.com/flutterflow-io-6f20.appspot.com/projects/techni-help-r01zjm/assets/t9a217omz8lk/Logo_Techni.png',
                                                  widget.pdfId,
                                                  _model.includeSignatureSpaceValue ?? false,
                                                  _model.categoriValue!,
                                                  _model.selectedlistsubcategorys.join(','), // Pasar subcategorías seleccionadas como string
                                                );

                                                print("PDF actualizado exitosamente.");
                                                ScaffoldMessenger.of(context).showSnackBar(
                                                  SnackBar(
                                                    content: Text(
                                                      'Datos guardados correctamente.',
                                                      style: TextStyle(color: FlutterFlowTheme.of(context).primaryText),
                                                    ),
                                                    duration: const Duration(milliseconds: 4000),
                                                    backgroundColor: FlutterFlowTheme.of(context).secondary,
                                                  ),
                                                );
                                              } catch (e) {
                                                print("Error al actualizar el PDF: $e");
                                                ScaffoldMessenger.of(context).showSnackBar(
                                                  SnackBar(
                                                    content: Text(
                                                      'Ocurrió un error al actualizar el PDF.',
                                                      style: TextStyle(color: FlutterFlowTheme.of(context).primaryText),
                                                    ),
                                                    duration: const Duration(milliseconds: 4000),
                                                    backgroundColor: FlutterFlowTheme.of(context).error,
                                                  ),
                                                );
                                              }
                                            },
                                            text: 'ACTUALIZAR',
                                            icon: const Icon(
                                              Icons.picture_as_pdf_sharp,
                                              size: 25.0,
                                            ),
                                            options: FFButtonOptions(
                                              width: 200.0,
                                              height: 50.0,
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
                                    ),


                                  ],
                                ),
                              ),
                            ).animateOnActionTrigger(
                              animationsMap[
                              'containerOnActionTriggerAnimation2']!,
                            );
                          },
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}

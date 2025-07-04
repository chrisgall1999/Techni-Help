import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:provider/provider.dart';
import 'category_model.dart';
import 'package:http/http.dart' as http; // Agregar esta importación
import 'dart:convert';

export 'category_model.dart';

class CategoryWidget extends StatefulWidget {
  const CategoryWidget({super.key});

  @override
  State<CategoryWidget> createState() => _CategoryWidgetState();
}

class _CategoryWidgetState extends State<CategoryWidget>
    with TickerProviderStateMixin {
  late CategoryModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  final animationsMap = <String, AnimationInfo>{};

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => CategoryModel());

    _model.textController1 ??= TextEditingController();
    _model.textFieldFocusNode1 ??= FocusNode();

    _model.textController2 ??= TextEditingController();
    _model.textFieldFocusNode2 ??= FocusNode();

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
                    decoration: BoxDecoration(
                      color: FlutterFlowTheme.of(context).secondaryBackground,
                    ),
                    child: Padding(
                      padding: const EdgeInsetsDirectional.fromSTEB(
                          0.0, 0.0, 120.0, 0.0),
                      child: SingleChildScrollView(
                        child: Column(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(
                                  top: 40.0,
                                  left: 16.0,
                                  right: 16.0), // Padding solo arriba
                              child: SingleChildScrollView(
                                scrollDirection: Axis
                                    .horizontal, // Permite el desplazamiento horizontal
                                child: Row(
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
                                    Padding(
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
                                              style:
                                                  FlutterFlowTheme.of(context)
                                                      .bodyMedium
                                                      .override(
                                                        fontFamily: 'Inter',
                                                        color: Colors.black,
                                                        fontSize: 20.0,
                                                        fontWeight:
                                                            FontWeight.bold,
                                                      ),
                                            ),
                                          ),
                                          Text(
                                            'Bienvenido ',
                                            style: FlutterFlowTheme.of(context)
                                                .bodyMedium
                                                .override(
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
                                          Icons.preview_outlined,
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
                                    padding:
                                        const EdgeInsetsDirectional.fromSTEB(
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
                    child: Container(
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
                      child: Align(
                        alignment: const AlignmentDirectional(0.0, -1.0),

                          child: Column(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.stretch,
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
                                            FlutterFlowTheme.of(context).info,
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
                              Column(
                                mainAxisSize: MainAxisSize.max,
                                children: [
                                  Padding(
                                    padding:
                                        const EdgeInsetsDirectional.fromSTEB(
                                            0.0, 5.0, 0.0, 5.0),
                                    child: Text(
                                      'Categorías Existentes',
                                      style: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .override(
                                            fontFamily: 'Inter',
                                            letterSpacing: 0.0,
                                          ),
                                    ),
                                  ),
                                  StreamBuilder<List<CategorysRecord>>(
                                    stream: queryCategorysRecord(),
                                    builder: (context, snapshot) {
                                      if (!snapshot.hasData) {
                                        return const Center(
                                            child: CircularProgressIndicator());
                                      }
                                      final categories = snapshot.data!;
                                      return Container(
                                        height: 300.0,  // Limita la altura de la caja que contiene las categorías
                                        child: ListView.builder(
                                          shrinkWrap: true,
                                            itemCount: categories.length,
                                            itemBuilder: (context, index) {
                                              final category =
                                                  categories[index];
                                              return ListTile(
                                                title: Text(category.category ??
                                                    'Sin Nombre'),
                                                subtitle: Text(
                                                  'Subcategorías: ${(category.listsubcategorys is String) ? category.listsubcategorys : (category.listsubcategorys as List<dynamic>).join(', ')}',
                                                ),
                                                trailing: IconButton(
                                                    icon: Icon(Icons.edit,
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .primary),
                                                    onPressed: () async {
                                                      print(
                                                          'Editar categoría presionado'); // Depuración: Verifica que el botón se presiona

                                                      // Aquí es donde pasamos 'category' para editarla
                                                      final categoryController =
                                                          TextEditingController(
                                                              text: category
                                                                  .category);
                                                      final List<
                                                              TextEditingController>
                                                          subcategoryControllers =
                                                          (category.listsubcategorys !=
                                                                      null &&
                                                                  category.listsubcategorys
                                                                      is String)
                                                              ? (category.listsubcategorys
                                                                      as String)
                                                                  .split(',')
                                                                  .map((subcategory) =>
                                                                      TextEditingController(
                                                                          text:
                                                                              subcategory))
                                                                  .toList()
                                                              : [];
                                                      print(
                                                          'Subcategorías originales: ${subcategoryControllers.map((c) => c.text).toList()}'); // Depuración

                                                      await showDialog(
                                                        context: context,
                                                        builder: (context) {
                                                          // Inicializar controladores con los datos existentes antes de mostrar el diálogo
                                                          categoryController
                                                                  .text =
                                                              category.category;
                                                          subcategoryControllers
                                                              .clear();
                                                          for (var subcategory
                                                              in category
                                                                  .listsubcategorys
                                                                  .split(',')) {
                                                            subcategoryControllers.add(
                                                                TextEditingController(
                                                                    text: subcategory
                                                                        .trim()));
                                                          }
                                                          final List<String>
                                                              subcategoriesToDelete =
                                                              [];

                                                          return StatefulBuilder(
                                                            builder: (context,
                                                                setState) {
                                                              return AlertDialog(
                                                                title: const Text(
                                                                    'Editar Categoría'),
                                                                content:
                                                                    SizedBox(
                                                                  width: 300.0,
                                                                  child:
                                                                      SingleChildScrollView(
                                                                    child:
                                                                        Column(
                                                                      mainAxisSize:
                                                                          MainAxisSize
                                                                              .min,
                                                                      children: [
                                                                        // Campo de texto para editar la categoría
                                                                        TextField(
                                                                          controller:
                                                                              categoryController,
                                                                          decoration:
                                                                              const InputDecoration(
                                                                            hintText:
                                                                                'Nuevo nombre de categoría',
                                                                          ),
                                                                        ),
                                                                        const SizedBox(
                                                                            height:
                                                                                16.0),

                                                                        // Subcategorías dinámicas
                                                                        SizedBox(
                                                                          height:
                                                                              200.0,
                                                                          child:
                                                                              ListView.builder(
                                                                            shrinkWrap:
                                                                                true,
                                                                            itemCount:
                                                                                subcategoryControllers.length,
                                                                            itemBuilder:
                                                                                (context, index) {
                                                                              return Row(
                                                                                children: [
                                                                                  Expanded(
                                                                                    child: TextField(
                                                                                      controller: subcategoryControllers[index],
                                                                                      decoration: InputDecoration(
                                                                                        hintText: 'Subcategoría ${index + 1}',
                                                                                      ),
                                                                                    ),
                                                                                  ),
                                                                                  IconButton(
                                                                                    icon: const Icon(Icons.remove_circle, color: Colors.red),
                                                                                    onPressed: () async {
                                                                                      final shouldDelete = await showDialog<bool>(
                                                                                        context: context,
                                                                                        builder: (context) {
                                                                                          return AlertDialog(
                                                                                            title: const Text('Confirmar Eliminación'),
                                                                                            content: const Text(
                                                                                              '¿Estás seguro de que deseas eliminar esta subcategoría? '
                                                                                              'Si existen registros asociados, también serán eliminados.',
                                                                                            ),
                                                                                            actions: [
                                                                                              TextButton(
                                                                                                onPressed: () => Navigator.pop(context, false),
                                                                                                child: const Text('Cancelar'),
                                                                                              ),
                                                                                              TextButton(
                                                                                                onPressed: () => Navigator.pop(context, true),
                                                                                                child: const Text('Eliminar'),
                                                                                              ),
                                                                                            ],
                                                                                          );
                                                                                        },
                                                                                      );

                                                                                      if (shouldDelete == true) {
                                                                                        final subcategoryToDelete = subcategoryControllers[index].text.trim();
                                                                                        subcategoriesToDelete.add(subcategoryToDelete); // Marcar para eliminar
                                                                                        setState(() {
                                                                                          subcategoryControllers.removeAt(index); // Remover de la lista local
                                                                                        });
                                                                                        ScaffoldMessenger.of(context).showSnackBar(
                                                                                          const SnackBar(content: Text('Subcategoría marcada para eliminar.')),
                                                                                        );
                                                                                      }
                                                                                    },
                                                                                  ),
                                                                                ],
                                                                              );
                                                                            },
                                                                          ),
                                                                        ),
                                                                        const SizedBox(
                                                                            height:
                                                                                8.0),

                                                                        // Botón para agregar nueva subcategoría
                                                                        Align(
                                                                          alignment:
                                                                              Alignment.centerRight,
                                                                          child:
                                                                              IconButton(
                                                                            icon:
                                                                                const Icon(Icons.add_circle, color: Colors.blue),
                                                                            onPressed:
                                                                                () {
                                                                              setState(() {
                                                                                subcategoryControllers.add(TextEditingController());
                                                                              });
                                                                            },
                                                                          ),
                                                                        ),
                                                                      ],
                                                                    ),
                                                                  ),
                                                                ),
                                                                actions: [
                                                                  TextButton(
                                                                    onPressed:
                                                                        () async {
                                                                      final updatedCategory = categoryController
                                                                          .text
                                                                          .trim();
                                                                      final updatedSubcategories = subcategoryControllers
                                                                          .map((controller) => controller
                                                                              .text
                                                                              .trim())
                                                                          .where((text) =>
                                                                              text.isNotEmpty)
                                                                          .toSet()
                                                                          .toList(); // Evita duplicados

                                                                      if (updatedCategory
                                                                          .isEmpty) {
                                                                        ScaffoldMessenger.of(context)
                                                                            .showSnackBar(
                                                                          const SnackBar(
                                                                              content: Text('El nombre de la categoría no puede estar vacío.')),
                                                                        );
                                                                        return;
                                                                      }

                                                                      final oldCategory =
                                                                          category
                                                                              .category;
                                                                      final oldSubcategories = category
                                                                              .listsubcategorys
                                                                              .isNotEmpty
                                                                          ? category
                                                                              .listsubcategorys
                                                                              .split(',')
                                                                              .map((sub) => sub.trim())
                                                                              .toList()
                                                                          : []; // Si no hay subcategorías, se asigna una lista vacía

                                                                      bool
                                                                          categoryRenamed =
                                                                          updatedCategory !=
                                                                              oldCategory;

                                                                      // Lógica para eliminar subcategorías en Firebase
                                                                      if (subcategoriesToDelete
                                                                          .isNotEmpty) {
                                                                        try {
                                                                          final response =
                                                                              await http.post(
                                                                            Uri.parse('https://us-central1-techni-help.cloudfunctions.net/manageCategories'),
                                                                            headers: {
                                                                              'Content-Type': 'application/json'
                                                                            },
                                                                            body:
                                                                                json.encode({
                                                                              'action': 'deleteSubcategory',
                                                                              'oldCategory': oldCategory,
                                                                              'subcategoriesToDelete': subcategoriesToDelete,
                                                                            }),
                                                                          );

                                                                          if (response.statusCode ==
                                                                              200) {
                                                                            ScaffoldMessenger.of(context).showSnackBar(
                                                                              const SnackBar(content: Text('Subcategorías eliminadas exitosamente.')),
                                                                            );
                                                                          } else {
                                                                            ScaffoldMessenger.of(context).showSnackBar(
                                                                              SnackBar(content: Text('Error al eliminar subcategorías: ${response.body}')),
                                                                            );
                                                                            return;
                                                                          }
                                                                        } catch (e) {
                                                                          ScaffoldMessenger.of(context)
                                                                              .showSnackBar(
                                                                            SnackBar(content: Text('Error de conexión: $e')),
                                                                          );
                                                                          return;
                                                                        }
                                                                      }

                                                                      // Identificar subcategorías renombradas
                                                                      final renamingSubcategories = oldSubcategories
                                                                              .isNotEmpty
                                                                          ? oldSubcategories
                                                                              .asMap()
                                                                              .entries
                                                                              .map((entry) {
                                                                                final index = entry.key;
                                                                                final oldSubcategory = entry.value;
                                                                                if (index < updatedSubcategories.length && oldSubcategory != updatedSubcategories[index]) {
                                                                                  return {
                                                                                    'oldSubcategory': oldSubcategory,
                                                                                    'newSubcategory': updatedSubcategories[index],
                                                                                  };
                                                                                }
                                                                                return null;
                                                                              })
                                                                              .where((item) => item != null)
                                                                              .toList()
                                                                          : []; // Si no hay subcategorías existentes, no hay nada que renombrar

                                                                      // Identificar subcategorías nuevas
                                                                      final newSubcategories = updatedSubcategories
                                                                          .where((subcategory) =>
                                                                              !oldSubcategories.contains(subcategory))
                                                                          .toList();

                                                                      // Lógica para renombrar la categoría
                                                                      if (categoryRenamed) {
                                                                        final response =
                                                                            await http.post(
                                                                          Uri.parse(
                                                                              'https://us-central1-techni-help.cloudfunctions.net/manageCategories'),
                                                                          headers: {
                                                                            'Content-Type':
                                                                                'application/json'
                                                                          },
                                                                          body:
                                                                              json.encode({
                                                                            'action':
                                                                                'rename',
                                                                            'oldCategory':
                                                                                oldCategory,
                                                                            'newCategory':
                                                                                updatedCategory,
                                                                          }),
                                                                        );

                                                                        if (response.statusCode ==
                                                                            200) {
                                                                          ScaffoldMessenger.of(context)
                                                                              .showSnackBar(
                                                                            SnackBar(content: Text('Categoría renombrada a: $updatedCategory')),
                                                                          );
                                                                          setState(
                                                                              () {
                                                                            categoryController.text =
                                                                                updatedCategory; // Actualizar el estado local
                                                                          });
                                                                        } else {
                                                                          ScaffoldMessenger.of(context)
                                                                              .showSnackBar(
                                                                            SnackBar(content: Text('Error al renombrar categoría: ${response.body}')),
                                                                          );
                                                                          return;
                                                                        }
                                                                      }

                                                                      // **Renombrar subcategorías** - Asegurándonos de que no se dupliquen
                                                                      if (oldSubcategories
                                                                              .isNotEmpty &&
                                                                          renamingSubcategories
                                                                              .isNotEmpty) {
                                                                        for (final renaming
                                                                            in renamingSubcategories) {
                                                                          if (renaming !=
                                                                              null) {
                                                                            print("Renombrando subcategoría:");
                                                                            print("Old Subcategory: ${renaming['oldSubcategory']}");
                                                                            print("New Subcategory: ${renaming['newSubcategory']}");

                                                                            // Verificamos que la subcategoría **no exista ya con el mismo nombre en la misma categoría**
                                                                            if (!oldSubcategories.contains(renaming['newSubcategory'])) {
                                                                              final response = await http.post(
                                                                                Uri.parse('https://us-central1-techni-help.cloudfunctions.net/manageCategories'),
                                                                                headers: {
                                                                                  'Content-Type': 'application/json'
                                                                                },
                                                                                body: json.encode({
                                                                                  'action': 'rename',
                                                                                  'oldCategory': updatedCategory,
                                                                                  'oldSubcategory': renaming['oldSubcategory'] ?? '',
                                                                                  'newSubcategory': renaming['newSubcategory'] ?? '',
                                                                                }),
                                                                              );

                                                                              if (response.statusCode == 200) {
                                                                                ScaffoldMessenger.of(context).showSnackBar(
                                                                                  SnackBar(content: Text('Subcategoría renombrada: ${renaming['oldSubcategory']} a ${renaming['newSubcategory']}')),
                                                                                );
                                                                              } else {
                                                                                ScaffoldMessenger.of(context).showSnackBar(
                                                                                  SnackBar(content: Text('Error al renombrar subcategoría: ${renaming['oldSubcategory']}')),
                                                                                );
                                                                                return;
                                                                              }
                                                                            } else {
                                                                              ScaffoldMessenger.of(context).showSnackBar(
                                                                                SnackBar(content: Text('La subcategoría con ese nombre ya existe.')),
                                                                              );
                                                                              return;
                                                                            }
                                                                          }
                                                                        }
                                                                      }

                                                                      // **Agregar nuevas subcategorías** (asegurándonos de que no haya duplicados)
                                                                      if (newSubcategories
                                                                          .isNotEmpty) {
                                                                        // Solo agregamos nuevas subcategorías si no es un proceso de renombrado
                                                                        if (renamingSubcategories
                                                                            .isEmpty) {
                                                                          final validSubcategories = newSubcategories
                                                                              .where((subcategory) => !oldSubcategories.contains(subcategory))
                                                                              .toList();

                                                                          if (validSubcategories
                                                                              .isNotEmpty) {
                                                                            try {
                                                                              final response = await http.post(
                                                                                Uri.parse('https://us-central1-techni-help.cloudfunctions.net/manageCategories'),
                                                                                headers: {
                                                                                  'Content-Type': 'application/json'
                                                                                },
                                                                                body: json.encode({
                                                                                  'action': 'addSubcategory',
                                                                                  'oldCategory': updatedCategory,
                                                                                  'newSubcategory': validSubcategories, // Agregar nuevas subcategorías sin duplicados
                                                                                }),
                                                                              );

                                                                              if (response.statusCode == 200) {
                                                                                ScaffoldMessenger.of(context).showSnackBar(
                                                                                  const SnackBar(content: Text('Subcategorías agregadas correctamente.')),
                                                                                );
                                                                              } else {
                                                                                ScaffoldMessenger.of(context).showSnackBar(
                                                                                  SnackBar(content: Text('Error al agregar subcategorías: ${response.body}')),
                                                                                );
                                                                                return;
                                                                              }
                                                                            } catch (e) {
                                                                              ScaffoldMessenger.of(context).showSnackBar(
                                                                                SnackBar(content: Text('Error de conexión: $e')),
                                                                              );
                                                                              return;
                                                                            }
                                                                          } else {
                                                                            ScaffoldMessenger.of(context).showSnackBar(
                                                                              const SnackBar(content: Text('No se agregaron subcategorías duplicadas.')),
                                                                            );
                                                                          }
                                                                        }
                                                                      }

                                                                      // Validación final si no hay cambios
                                                                      if (!categoryRenamed &&
                                                                          renamingSubcategories
                                                                              .isEmpty &&
                                                                          newSubcategories
                                                                              .isEmpty) {
                                                                        ScaffoldMessenger.of(context)
                                                                            .showSnackBar(
                                                                          const SnackBar(
                                                                              content: Text('No hay cambios para guardar.')),
                                                                        );
                                                                      }

                                                                      Navigator.pop(
                                                                          context);
                                                                    },
                                                                    child: const Text(
                                                                        'Guardar'),
                                                                  ),
                                                                ],
                                                              );
                                                            },
                                                          );
                                                        },
                                                      );
                                                    }),
                                              );
                                            },
                                          ),

                                      );
                                    },
                                  ),
                                  Padding(
                                    padding:
                                        const EdgeInsetsDirectional.fromSTEB(
                                            0.0, 5.0, 0.0, 5.0),
                                    child: Text(
                                      'Crear Nueva Categoría',
                                      style: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .override(
                                            fontFamily: 'Inter',
                                            letterSpacing: 0.0,
                                          ),
                                    ),
                                  ),
                                  Padding(
                                    padding:
                                        const EdgeInsetsDirectional.fromSTEB(
                                            0.0, 5.0, 0.0, 5.0),
                                    child: SizedBox(
                                      width: 200.0,
                                      child: TextFormField(
                                        controller: _model.textController1,
                                        focusNode: _model.textFieldFocusNode1,
                                        decoration: InputDecoration(
                                          isDense: true,
                                          labelStyle:
                                              FlutterFlowTheme.of(context)
                                                  .labelMedium
                                                  .override(
                                                    fontFamily: 'Inter',
                                                    letterSpacing: 0.0,
                                                  ),
                                          hintText:
                                              'Ingrese la categoría principal',
                                          hintStyle:
                                              FlutterFlowTheme.of(context)
                                                  .labelMedium
                                                  .override(
                                                    fontFamily: 'Inter',
                                                    letterSpacing: 0.0,
                                                  ),
                                          enabledBorder: OutlineInputBorder(
                                            borderSide: const BorderSide(
                                              color: Color(0x00000000),
                                              width: 1.0,
                                            ),
                                            borderRadius:
                                                BorderRadius.circular(8.0),
                                          ),
                                          focusedBorder: OutlineInputBorder(
                                            borderSide: const BorderSide(
                                              color: Color(0x00000000),
                                              width: 1.0,
                                            ),
                                            borderRadius:
                                                BorderRadius.circular(8.0),
                                          ),
                                          filled: true,
                                        ),
                                        style: FlutterFlowTheme.of(context)
                                            .bodyMedium
                                            .override(
                                              fontFamily: 'Inter',
                                              letterSpacing: 0.0,
                                            ),
                                        textAlign: TextAlign.center,
                                        cursorColor:
                                            FlutterFlowTheme.of(context)
                                                .primaryText,
                                      ),
                                    ),
                                  ),
                                            // Subcategorías dinámicas
                                  ListView.builder(
                                    shrinkWrap: true,
                                    itemCount:
                                        _model.subCategoryControllers.length,
                                    itemBuilder: (context, index) {
                                      return Padding(
                                        padding: const EdgeInsets.symmetric(
                                            vertical: 8.0),
                                        child: Row(
                                          children: [
                                            Expanded(
                                              child: TextFormField(
                                                controller: _model
                                                        .subCategoryControllers[
                                                    index],
                                                decoration: InputDecoration(
                                                  isDense: true,
                                                  hintText:
                                                      'Ingrese subcategoría ${index + 1}',
                                                  enabledBorder:
                                                      OutlineInputBorder(
                                                    borderSide:
                                                        const BorderSide(
                                                      color: Color(0x00000000),
                                                      width: 1.0,
                                                    ),
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            8.0),
                                                  ),
                                                  focusedBorder:
                                                      OutlineInputBorder(
                                                    borderSide:
                                                        const BorderSide(
                                                      color: Color(0x00000000),
                                                      width: 1.0,
                                                    ),
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            8.0),
                                                  ),
                                                  filled: true,
                                                ),
                                                style:
                                                    FlutterFlowTheme.of(context)
                                                        .bodyMedium
                                                        .override(
                                                          fontFamily: 'Inter',
                                                          letterSpacing: 0.0,
                                                        ),
                                              ),
                                            ),
                                            IconButton(
                                              icon: Icon(Icons.remove_circle),
                                              color: Colors.red,
                                              onPressed: () {
                                                setState(() {
                                                  _model.subCategoryControllers
                                                      .removeAt(index);
                                                });
                                              },
                                            ),
                                          ],
                                        ),
                                      );
                                    },
                                  ),
                                  Padding(
                                    padding:
                                        const EdgeInsetsDirectional.fromSTEB(
                                            0.0, 10.0, 0.0, 0.0),
                                    child: FFButtonWidget(
                                      onPressed: () {
                                        setState(() {
                                          _model.subCategoryControllers
                                              .add(TextEditingController());
                                        });
                                      },
                                      text: 'Añadir Subcategoría',
                                      options: FFButtonOptions(
                                        height: 40.0,
                                        padding: const EdgeInsetsDirectional
                                            .fromSTEB(16.0, 0.0, 16.0, 0.0),
                                        color: FlutterFlowTheme.of(context)
                                            .primary,
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
                                  Padding(
                                    padding:
                                        const EdgeInsetsDirectional.fromSTEB(
                                            0.0, 12.0, 0.0, 20.0),
                                    child: FFButtonWidget(
                                      onPressed: () async {
                                        final newCategory =
                                            _model.textController1.text.trim();
                                        final subcategories = _model
                                            .subCategoryControllers
                                            .map((c) => c.text.trim())
                                            .toList();

                                        // Validar que la categoría no esté vacía
                                        if (newCategory.isEmpty) {
                                          ScaffoldMessenger.of(context)
                                              .showSnackBar(
                                            SnackBar(
                                                content: Text(
                                                    'El nombre de la categoría no puede estar vacío.')),
                                          );
                                          return;
                                        }
                                        // Validar que al menos una subcategoría sea ingresada
                                        if (subcategories.isEmpty || subcategories.every((subcategory) => subcategory.isEmpty)) {
                                          ScaffoldMessenger.of(context).showSnackBar(
                                            SnackBar(content: Text('Es obligatorio ingresar al menos una subcategoría.')),
                                          );
                                          return;
                                        }
                                        // Validar que no haya subcategorías vacías
                                        final hasEmptySubcategory = _model
                                            .subCategoryControllers
                                            .any((c) => c.text.trim().isEmpty);
                                        if (hasEmptySubcategory) {
                                          ScaffoldMessenger.of(context)
                                              .showSnackBar(
                                            SnackBar(
                                                content: Text(
                                                    'Las subcategorías no pueden estar vacías.')),
                                          );
                                          return;
                                        }

                                        // Validar duplicados en las subcategorías
                                        final subcategorySet = <String>{};
                                        final hasDuplicates =
                                            subcategories.any((subcategory) {
                                          if (subcategorySet
                                              .contains(subcategory)) {
                                            return true;
                                          } else {
                                            subcategorySet.add(subcategory);
                                            return false;
                                          }
                                        });

                                        if (hasDuplicates) {
                                          ScaffoldMessenger.of(context)
                                              .showSnackBar(
                                            SnackBar(
                                                content: Text(
                                                    'Las subcategorías no pueden repetirse. Por favor, utiliza nombres únicos.')),
                                          );
                                          return;
                                        }

                                        // Verificar si la categoría ya existe
                                        final existingCategory =
                                            await queryCategorysRecordOnce(
                                          queryBuilder: (category) =>
                                              category.where('category',
                                                  isEqualTo: newCategory),
                                        );

                                        if (existingCategory.isNotEmpty) {
                                          ScaffoldMessenger.of(context)
                                              .showSnackBar(
                                            SnackBar(
                                                content: Text(
                                                    'La categoría ya existe.')),
                                          );
                                          return;
                                        }

                                        // Guardar nueva categoría
                                        await CategorysRecord.collection
                                            .doc()
                                            .set(
                                              createCategorysRecordData(
                                                category: newCategory,
                                                listsubcategorys:
                                                    subcategories.join(','),
                                              ),
                                            );
                                        ScaffoldMessenger.of(context)
                                            .showSnackBar(
                                          SnackBar(
                                              content: Text(
                                                  'Categoría creada exitosamente.')),
                                        );
                                      },
                                      text: 'Guardar Categoría',
                                      options: FFButtonOptions(
                                        height: 40.0,
                                        padding: const EdgeInsetsDirectional
                                            .fromSTEB(16.0, 0.0, 16.0, 0.0),
                                        color: FlutterFlowTheme.of(context)
                                            .primary,
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
                                ],
                              ),
                            ],
                          ),

                      ),
                    ).animateOnActionTrigger(
                      animationsMap['containerOnActionTriggerAnimation2']!,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

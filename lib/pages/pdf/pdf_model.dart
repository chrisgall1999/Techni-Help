import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/form_field_controller.dart';
import 'pdf_widget.dart' show PdfWidget;
import 'package:flutter/material.dart';

class PdfModel extends FlutterFlowModel<PdfWidget> {
  ///  State fields for stateful widgets in this page.

  // Form Keys
  final formKey1 = GlobalKey<FormState>();
  final formKey2 = GlobalKey<FormState>();
  final formKey3 = GlobalKey<FormState>();

  // Categorías y Subcategorías
  FormFieldController<String>? categoryDropdownController; // Controlador para el dropdown de categorías
  String? selectedCategory; // Categoría seleccionada
  List<String> selectedlistsubcategorys = []; // Subcategorías seleccionadas
  String? categoriValue; // Validación de categoría seleccionada
  String? subcategoryValue; // Validación de subcategoría seleccionada

  // Otros campos existentes en tu modelo
  FocusNode? clientnameFocusNode;
  TextEditingController? clientnameTextController;
  String? Function(BuildContext, String?)? clientnameTextControllerValidator;

  FocusNode? namebuisnessFocusNode;
  TextEditingController? namebuisnessTextController;
  String? Function(BuildContext, String?)? namebuisnessTextControllerValidator;

  FocusNode? addressnameFocusNode;
  TextEditingController? addressnameTextController;
  String? Function(BuildContext, String?)? addressnameTextControllerValidator;

  FocusNode? phoneFocusNode;
  TextEditingController? phoneTextController;
  String? Function(BuildContext, String?)? phoneTextControllerValidator;

  DateTime? datePicked;

  FocusNode? teamFocusNode;
  TextEditingController? teamTextController;
  String? Function(BuildContext, String?)? teamTextControllerValidator;

  FocusNode? brandFocusNode;
  TextEditingController? brandTextController;
  String? Function(BuildContext, String?)? brandTextControllerValidator;

  FocusNode? modelFocusNode;
  TextEditingController? modelTextController;
  String? Function(BuildContext, String?)? modelTextControllerValidator;

  FocusNode? serieFocusNode;
  TextEditingController? serieTextController;
  String? Function(BuildContext, String?)? serieTextControllerValidator;

  FocusNode? codeFocusNode;
  TextEditingController? codeTextController;
  String? Function(BuildContext, String?)? codeTextControllerValidator;

  FocusNode? locationFocusNode;
  TextEditingController? locationTextController;
  String? Function(BuildContext, String?)? locationTextControllerValidator;

  FormFieldController<List<String>>? workStatusCheckboxesValueController;
  List<String>? get workStatusCheckboxesValues =>
      workStatusCheckboxesValueController?.value;
  set workStatusCheckboxesValues(List<String>? v) =>
      workStatusCheckboxesValueController?.value = v;

  FocusNode? workstatusotherFocusNode;
  TextEditingController? workstatusotherTextController;
  String? Function(BuildContext, String?)? workstatusotherTextControllerValidator;

  FocusNode? observationsFocusNode;
  TextEditingController? observationsTextController;
  String? Function(BuildContext, String?)? observationsTextControllerValidator;

  FocusNode? recommendationsFocusNode;
  TextEditingController? recommendationsTextController;
  String? Function(BuildContext, String?)? recommendationsTextControllerValidator;

  FocusNode? startworkhoursFocusNode;
  TextEditingController? startworkhoursTextController;
  String? Function(BuildContext, String?)? startworkhoursTextControllerValidator;

  FocusNode? endtworkhoursFocusNode;
  TextEditingController? endtworkhoursTextController;
  String? Function(BuildContext, String?)? endtworkhoursTextControllerValidator;

  FocusNode? totalworkhoursFocusNode;
  TextEditingController? totalworkhoursTextController;
  String? Function(BuildContext, String?)? totalworkhoursTextControllerValidator;

  FocusNode? maintenancecontractFocusNode;
  TextEditingController? maintenancecontractTextController;
  String? Function(BuildContext, String?)? maintenancecontractTextControllerValidator;

  FocusNode? numberofvisitsFocusNode;
  TextEditingController? numberofvisitsTextController;
  String? Function(BuildContext, String?)? numberofvisitsTextControllerValidator;

  bool? includeSignatureSpaceValue;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    clientnameFocusNode?.dispose();
    clientnameTextController?.dispose();

    namebuisnessFocusNode?.dispose();
    namebuisnessTextController?.dispose();

    addressnameFocusNode?.dispose();
    addressnameTextController?.dispose();

    phoneFocusNode?.dispose();
    phoneTextController?.dispose();

    teamFocusNode?.dispose();
    teamTextController?.dispose();

    brandFocusNode?.dispose();
    brandTextController?.dispose();

    modelFocusNode?.dispose();
    modelTextController?.dispose();

    serieFocusNode?.dispose();
    serieTextController?.dispose();

    codeFocusNode?.dispose();
    codeTextController?.dispose();

    locationFocusNode?.dispose();
    locationTextController?.dispose();

    workstatusotherFocusNode?.dispose();
    workstatusotherTextController?.dispose();

    observationsFocusNode?.dispose();
    observationsTextController?.dispose();

    recommendationsFocusNode?.dispose();
    recommendationsTextController?.dispose();

    startworkhoursFocusNode?.dispose();
    startworkhoursTextController?.dispose();

    endtworkhoursFocusNode?.dispose();
    endtworkhoursTextController?.dispose();

    totalworkhoursFocusNode?.dispose();
    totalworkhoursTextController?.dispose();

    maintenancecontractFocusNode?.dispose();
    maintenancecontractTextController?.dispose();

    numberofvisitsFocusNode?.dispose();
    numberofvisitsTextController?.dispose();

    categoryDropdownController = null;
  }
}

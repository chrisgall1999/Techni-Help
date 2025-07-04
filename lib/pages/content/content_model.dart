import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/form_field_controller.dart';
import 'content_widget.dart' show ContentWidget;
import 'package:flutter/material.dart';

class ContentModel extends FlutterFlowModel<ContentWidget> {
  ///  State fields for stateful widgets in this page.

  final formKey2 = GlobalKey<FormState>();
  final formKey1 = GlobalKey<FormState>();
  final formKey3 = GlobalKey<FormState>();

  // Controlador para el dropdown de categorías.
  FormFieldController<String>? categoryDropdownController;

  // Categoría seleccionada.
  String? selectedCategory;

  // Lista de subcategorías seleccionadas.
  List<String> selectedlistsubcategorys = [];
  // State field(s) for clientname widget.
  FocusNode? clientnameFocusNode;
  TextEditingController? clientnameTextController;
  String? Function(BuildContext, String?)? clientnameTextControllerValidator;
  // State field(s) for namebuisness widget.
  FocusNode? namebuisnessFocusNode;
  TextEditingController? namebuisnessTextController;
  String? Function(BuildContext, String?)? namebuisnessTextControllerValidator;
  // State field(s) for addressname widget.
  FocusNode? addressnameFocusNode;
  TextEditingController? addressnameTextController;
  String? Function(BuildContext, String?)? addressnameTextControllerValidator;
  // State field(s) for phone widget.
  FocusNode? phoneFocusNode;
  TextEditingController? phoneTextController;
  String? Function(BuildContext, String?)? phoneTextControllerValidator;
  DateTime? datePicked;
  // State field(s) for team widget.
  FocusNode? teamFocusNode;
  TextEditingController? teamTextController;
  String? Function(BuildContext, String?)? teamTextControllerValidator;
  // State field(s) for brand widget.
  FocusNode? brandFocusNode;
  TextEditingController? brandTextController;
  String? Function(BuildContext, String?)? brandTextControllerValidator;
  // State field(s) for model widget.
  FocusNode? modelFocusNode;
  TextEditingController? modelTextController;
  String? Function(BuildContext, String?)? modelTextControllerValidator;
  // State field(s) for serie widget.
  FocusNode? serieFocusNode;
  TextEditingController? serieTextController;
  String? Function(BuildContext, String?)? serieTextControllerValidator;
  // State field(s) for code widget.
  FocusNode? codeFocusNode;
  TextEditingController? codeTextController;
  String? Function(BuildContext, String?)? codeTextControllerValidator;
  // State field(s) for location widget.
  FocusNode? locationFocusNode;
  TextEditingController? locationTextController;
  String? Function(BuildContext, String?)? locationTextControllerValidator;
  // State field(s) for workStatusCheckboxes widget.
  FormFieldController<List<String>>? workStatusCheckboxesValueController;
  List<String>? get workStatusCheckboxesValues =>
      workStatusCheckboxesValueController?.value;
  set workStatusCheckboxesValues(List<String>? v) =>
      workStatusCheckboxesValueController?.value = v;

  // State field(s) for workstatusother widget.
  FocusNode? workstatusotherFocusNode;
  TextEditingController? workstatusotherTextController;
  String? Function(BuildContext, String?)?
      workstatusotherTextControllerValidator;
  // State field(s) for observations widget.
  FocusNode? observationsFocusNode;
  TextEditingController? observationsTextController;
  String? Function(BuildContext, String?)? observationsTextControllerValidator;
  // State field(s) for recommendations widget.
  FocusNode? recommendationsFocusNode;
  TextEditingController? recommendationsTextController;
  String? Function(BuildContext, String?)?
      recommendationsTextControllerValidator;
  // State field(s) for startworkhours widget.
  FocusNode? startworkhoursFocusNode;
  TextEditingController? startworkhoursTextController;
  String? Function(BuildContext, String?)?
      startworkhoursTextControllerValidator;
  // State field(s) for endtworkhours widget.
  FocusNode? endtworkhoursFocusNode;
  TextEditingController? endtworkhoursTextController;
  String? Function(BuildContext, String?)? endtworkhoursTextControllerValidator;
  // State field(s) for totalworkhours widget.
  FocusNode? totalworkhoursFocusNode;
  TextEditingController? totalworkhoursTextController;
  String? Function(BuildContext, String?)?
      totalworkhoursTextControllerValidator;
  // State field(s) for maintenancecontract widget.
  FocusNode? maintenancecontractFocusNode;
  TextEditingController? maintenancecontractTextController;
  String? Function(BuildContext, String?)?
      maintenancecontractTextControllerValidator;
  // State field(s) for numberofvisits widget.
  FocusNode? numberofvisitsFocusNode;
  TextEditingController? numberofvisitsTextController;
  String? Function(BuildContext, String?)?
      numberofvisitsTextControllerValidator;
  // State field(s) for includeSignatureSpace widget.
  bool? includeSignatureSpaceValue;
  // State field(s) for categori widget.
  String? categoriValue;
  FormFieldController<String>? categoriValueController;
  // State field(s) for subcategory widget.
  String? subcategoryValue;
  FormFieldController<String>? subcategoryValueController;
  // State field(s) for seconcategory widget.
  String? seconcategoryValue;
  FormFieldController<String>? seconcategoryValueController;

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


    // Limpia el controlador del dropdown de categorías.
    categoryDropdownController?.dispose();

  }

}

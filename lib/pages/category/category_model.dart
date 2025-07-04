import '/flutter_flow/flutter_flow_util.dart';
import 'category_widget.dart' show CategoryWidget;
import 'package:flutter/material.dart';

class CategoryModel extends FlutterFlowModel<CategoryWidget> {
  ///  State fields for stateful widgets in this page.

  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode1;
  TextEditingController? textController1;
  String? Function(BuildContext, String?)? textController1Validator;
  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode2;
  TextEditingController? textController2;
  String? Function(BuildContext, String?)? textController2Validator;

  // Nueva lista para los controladores de las subcategorías.
  List<TextEditingController> subCategoryControllers = [];

  /// Métodos del ciclo de vida
  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    textFieldFocusNode1?.dispose();
    textController1?.dispose();

    textFieldFocusNode2?.dispose();
    textController2?.dispose();

    // Limpia los controladores de subcategorías
    for (var controller in subCategoryControllers) {
      controller.dispose();
    }
  }

  /// Método para añadir un nuevo controlador de subcategoría.
  void addSubCategoryController() {
    subCategoryControllers.add(TextEditingController());
  }

  /// Método para eliminar un controlador de subcategoría.
  void removeSubCategoryController(int index) {
    if (index >= 0 && index < subCategoryControllers.length) {
      subCategoryControllers[index].dispose();
      subCategoryControllers.removeAt(index);
    }
  }
}

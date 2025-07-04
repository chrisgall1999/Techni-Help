import '/flutter_flow/flutter_flow_util.dart';
import 'editpassword_widget.dart' show EditpasswordWidget;
import 'package:flutter/material.dart';

class EditpasswordModel extends FlutterFlowModel<EditpasswordWidget> {
  ///  State fields for stateful widgets in this component.

  // State field(s) for password widget.
  FocusNode? passwordFocusNode;
  TextEditingController? passwordTextController;
  String? Function(BuildContext, String?)? passwordTextControllerValidator;
  // State field(s) for newpassword widget.
  FocusNode? newpasswordFocusNode;
  TextEditingController? newpasswordTextController;
  String? Function(BuildContext, String?)? newpasswordTextControllerValidator;
  // Stores action output result for [Custom Action - changePassword] action in Button widget.
  bool? isChange;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    passwordFocusNode?.dispose();
    passwordTextController?.dispose();

    newpasswordFocusNode?.dispose();
    newpasswordTextController?.dispose();
  }
}

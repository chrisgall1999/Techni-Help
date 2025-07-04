import '/flutter_flow/flutter_flow_util.dart';
import 'editemail_widget.dart' show EditemailWidget;
import 'package:flutter/material.dart';

class EditemailModel extends FlutterFlowModel<EditemailWidget> {
  ///  State fields for stateful widgets in this component.

  // State field(s) for newEmail widget.
  FocusNode? newEmailFocusNode;
  TextEditingController? newEmailTextController;
  String? Function(BuildContext, String?)? newEmailTextControllerValidator;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    newEmailFocusNode?.dispose();
    newEmailTextController?.dispose();
  }
}

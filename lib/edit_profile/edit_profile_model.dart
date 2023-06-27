import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class EditProfileModel extends FlutterFlowModel {
  ///  State fields for stateful widgets in this page.

  // State field(s) for Customername widget.
  TextEditingController? customernameController;
  String? Function(BuildContext, String?)? customernameControllerValidator;
  // State field(s) for Customergender widget.
  TextEditingController? customergenderController;
  String? Function(BuildContext, String?)? customergenderControllerValidator;
  // State field(s) for customerage widget.
  TextEditingController? customerageController;
  String? Function(BuildContext, String?)? customerageControllerValidator;
  // State field(s) for customerPhonenumber widget.
  TextEditingController? customerPhonenumberController;
  String? Function(BuildContext, String?)?
      customerPhonenumberControllerValidator;

  /// Initialization and disposal methods.

  void initState(BuildContext context) {}

  void dispose() {
    customernameController?.dispose();
    customergenderController?.dispose();
    customerageController?.dispose();
    customerPhonenumberController?.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}

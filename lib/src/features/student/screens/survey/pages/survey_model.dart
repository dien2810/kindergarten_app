import '../components/NavigationBarBottom/navigation_bar_bottom_widget.dart';
import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:math';
import 'survey.dart' show SurveyWidget;
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class SurveyModel extends FlutterFlowModel<SurveyWidget> {
  ///  State fields for stateful widgets in this page.

  // Model for NavigationBarBottom component.
  late NavigationBarBottomModel navigationBarBottomModel;

  @override
  void initState(BuildContext context) {
    navigationBarBottomModel =
        createModel(context, () => NavigationBarBottomModel());
  }

  @override
  void dispose() {
    navigationBarBottomModel.dispose();
  }
}

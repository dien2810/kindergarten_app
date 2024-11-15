
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

import '../../../../../../flutter_flow/flutter_flow_model.dart';
// import '../../../../../flutter_flow/flutter_flow_model.dart';
import '../components/NavigationBarBottom/navigation_bar_bottom_model.dart';
import '../components/TabBar/tab_bar_model.dart';
import 'homepage_news.dart';
// import 'pages/homepage_news.dart';

class HomePageModel extends FlutterFlowModel<HomePageWidget> {
  ///  State fields for stateful widgets in this page.

  // Model for NavigationBarBottom component.
  late NavigationBarBottomModel navigationBarBottomModel;
  // Model for TabBar.
  late TabBarModel tabBarModel;

  @override
  void initState(BuildContext context) {
    navigationBarBottomModel =
        createModel(context, () => NavigationBarBottomModel());
    tabBarModel = createModel(context, () => TabBarModel());
  }

  @override
  void dispose() {
    navigationBarBottomModel.dispose();
    tabBarModel.dispose();
  }

  @override
  toWidgetClassDebugData() {
    // TODO: implement toWidgetClassDebugData
    throw UnimplementedError();
  }
}

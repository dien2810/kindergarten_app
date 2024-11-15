
import 'package:flutter/material.dart';
import 'package:kindergarten_app/flutter_flow/flutter_flow_util.dart';
import 'package:kindergarten_app/src/constants/sizes.dart';

import '../../../../../../flutter_flow/flutter_flow_icon_button.dart';
import '../../../../../../flutter_flow/flutter_flow_theme.dart';
import '../components/NavigationBarBottom/navigation_bar_bottom_widget.dart';
import '../components/TabBar/tab_bar_widget.dart';
import 'homepage_news_model.dart';



class HomePageWidget extends StatefulWidget {
  const HomePageWidget({super.key});

  @override
  State<HomePageWidget> createState() => _HomePageWidgetState();
}

class _HomePageWidgetState extends State<HomePageWidget> {
  late HomePageModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => HomePageModel());
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      backgroundColor: FlutterFlowTheme.of(context).secondaryBackground,
      appBar: AppBar(
        backgroundColor: FlutterFlowTheme.of(context).secondaryBackground,
        automaticallyImplyLeading: false,
        actions: const [],
        flexibleSpace: FlexibleSpaceBar(
          background: Stack(
            children: [
              Stack(
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(0),
                    child: Image.asset(
                      'assets/images/homepage_images/Vector.png',
                      width: t100Size*4.2,
                      fit: BoxFit.fill,
                    ),
                  ),
                  Align(
                    alignment: const AlignmentDirectional(-0.84, 0.14),
                    child: Container(
                      clipBehavior: Clip.antiAlias,
                      decoration: const BoxDecoration(
                        shape: BoxShape.circle,
                      ),
                      child: Image.asset(
                        'assets/images/homepage_images/Group_25.png',
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  Align(
                    alignment: const AlignmentDirectional(0.06, -0.24),
                    child: Text(
                      'Nguyễn Văn Thành',
                      style: FlutterFlowTheme.of(context).bodyLarge.override(
                        fontFamily: 'Inter',
                        color: const Color(0xFFCAF0F8),
                        letterSpacing: 0.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  Align(
                    alignment: const AlignmentDirectional(0.04, 0.12),
                    child: Text(
                      'Thông tin học sinh',
                      style: FlutterFlowTheme.of(context).bodyMedium.override(
                        fontFamily: 'Inter',
                        color: const Color(0xFFCAF0F8),
                        letterSpacing: 0.0,
                        fontWeight: FontWeight.w600,
                        decoration: TextDecoration.underline,
                      ),
                    ),
                  ),
                  Align(
                    alignment: const AlignmentDirectional(0.55, 0.16),
                    child: FlutterFlowIconButton(
                      borderRadius: 8,
                      buttonSize: 50,
                      icon: Icon(
                        Icons.keyboard_arrow_down_rounded,
                        color: FlutterFlowTheme.of(context).info,
                        size: 40,
                      ),
                      onPressed: () {
                        print('IconButton pressed ...');
                      },
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
        bottom: PreferredSize(
          preferredSize: const Size.fromHeight(70),
          child: Container(),
        ),
        centerTitle: false,
        elevation: 0,
      ),
      body: SafeArea(
        top: true,
        child: Stack(
          children: [
            Padding(
              padding: const EdgeInsetsDirectional.fromSTEB(0, 10, 0, 0),
              child: wrapWithModel(
                model: _model.tabBarModel,
                updateCallback: () => safeSetState(() {}),
                child: const TabBarWidget(),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

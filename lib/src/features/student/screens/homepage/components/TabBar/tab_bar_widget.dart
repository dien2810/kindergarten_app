import 'package:kindergarten_app/src/constants/colors.dart';

import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

import 'tab_bar_model.dart';
export 'tab_bar_model.dart';

class TabBarWidget extends StatefulWidget {
  const TabBarWidget({super.key});

  @override
  State<TabBarWidget> createState() => _TabBarWidgetState();
}

class _TabBarWidgetState extends State<TabBarWidget>
    with TickerProviderStateMixin {
  late TabBarModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => TabBarModel());

    _model.tabBarController = TabController(
      vsync: this,
      length: 4,
      initialIndex: 0,
    )..addListener(() => safeSetState(() {}));
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 460,
      height: 620,
      decoration: BoxDecoration(
        color: FlutterFlowTheme.of(context).secondaryBackground,
        boxShadow: [
          BoxShadow(
            blurRadius: 1.5,
            color: Color(0xFF838B8F),
            offset: Offset(
              1,
              1,
            ),
            spreadRadius: 1,
          )
        ],
        borderRadius: BorderRadius.circular(24),
      ),
      child: Align(
        alignment: AlignmentDirectional(0, -1),
        child: Column(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Expanded(
              child: Column(
                children: [
                  Align(
                    alignment: Alignment(0, 0),
                    child: TabBar(
                      labelColor: FlutterFlowTheme.of(context).primaryText,
                      unselectedLabelColor:
                      FlutterFlowTheme.of(context).secondaryText,
                      labelStyle:
                      FlutterFlowTheme.of(context).titleMedium.override(
                        fontFamily: 'Inter Tight',
                        letterSpacing: 0.0,
                      ),
                      unselectedLabelStyle:
                      FlutterFlowTheme.of(context).titleMedium.override(
                        fontFamily: 'Inter Tight',
                        letterSpacing: 0.0,
                      ),
                      indicatorColor: FlutterFlowTheme.of(context).primary,
                      indicatorWeight: 2.5,
                      tabs: [
                        Tab(
                          icon: FaIcon(
                            FontAwesomeIcons.solidNewspaper,
                            color: Color(0xFF0B2384),
                            size: 30,
                          ),
                          iconMargin:
                          EdgeInsetsDirectional.fromSTEB(0, 22, 0, 0),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            FaIcon(
                              FontAwesomeIcons.book,
                              color: Color(0xFF0B2384),
                              size: 30,
                            ),
                            Tab(
                              text: '',
                            ),
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            FaIcon(
                              FontAwesomeIcons.graduationCap,
                              color: Color(0xFF0B2384),
                              size: 30,
                            ),
                            Tab(
                              text: '',
                            ),
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(
                              Icons.account_balance_rounded,
                              color: Color(0xFF0B2384),
                              size: 30,
                            ),
                            Tab(
                              text: '',
                            ),
                          ],
                        ),
                      ],
                      controller: _model.tabBarController,
                      onTap: (i) async {
                        [
                              () async {},
                              () async {},
                              () async {},
                              () async {}
                        ][i]();
                      },
                    ),
                  ),
                  Expanded(
                    child: TabBarView(
                      controller: _model.tabBarController,
                      children: [
                        Column(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Align(
                              alignment: AlignmentDirectional(-0.8, 0),
                              child: Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    0, 10, 0, 20),
                                child: Text(
                                  'Tin tức',
                                  style: FlutterFlowTheme.of(context)
                                      .titleLarge
                                      .override(
                                    fontFamily: 'Inter Tight',
                                    color: Color(0xFF0B2384),
                                    fontSize: 32,
                                    letterSpacing: 0.0,
                                    fontWeight: FontWeight.w800,
                                    shadows: [
                                      Shadow(
                                        color: FlutterFlowTheme.of(context)
                                            .secondaryText,
                                        offset: Offset(2.0, 2.0),
                                        blurRadius: 4.0,
                                      )
                                    ],
                                  ),
                                ),
                              ),
                            ),
                            Column(
                              mainAxisSize: MainAxisSize.max,
                              children: [
                                ClipRRect(
                                  borderRadius: BorderRadius.circular(8),
                                  child: Image.asset(
                                    'assets/images/homepage_images/Rectangle_76_(1).png',
                                    width: 332,
                                    height: 139,
                                    fit: BoxFit.contain,
                                  ),
                                ),
                                Align(
                                  alignment: AlignmentDirectional(-1, 0),
                                  child: Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        40, 0, 0, 0),
                                    child: RichText(
                                      textScaler:
                                      MediaQuery.of(context).textScaler,
                                      text: TextSpan(
                                        children: [
                                          TextSpan(
                                        text: 'Title of news',
                                            style: TextStyle(
                                            color: Colors.blueAccent,
                                            fontFamily: 'Inter',
                                            letterSpacing: 0.0,
                                            fontWeight: FontWeight.w800,),
                                            ),
                                          TextSpan(
                                            text: '\nCreate date',
                                            style: TextStyle(),
                                          )
                                        ],
                                        style: FlutterFlowTheme.of(context)
                                            .bodyMedium
                                            .override(
                                          fontFamily: 'Inter',
                                          letterSpacing: 0.0,
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            Padding(
                              padding:
                              EdgeInsetsDirectional.fromSTEB(0, 10, 0, 0),
                              child: Column(
                                mainAxisSize: MainAxisSize.max,
                                children: [
                                  Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        0, 1, 0, 0),
                                    child: ClipRRect(
                                      borderRadius: BorderRadius.circular(8),
                                      child: Image.asset(
                                        'assets/images/homepage_images/Rectangle_76.png',
                                        width: 332,
                                        height: 139,
                                        fit: BoxFit.contain,
                                      ),
                                    ),
                                  ),
                                  Align(
                                    alignment: AlignmentDirectional(-1, 0),
                                    child: Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          40, 0, 0, 0),
                                      child: RichText(
                                        textScaler:
                                        MediaQuery.of(context).textScaler,
                                        text: TextSpan(
                                          children: [
                                            TextSpan(
                                              text: 'Title of news',
                                              style: TextStyle(
                                                color: Colors.blueAccent,
                                                fontFamily: 'Inter',
                                                letterSpacing: 0.0,
                                                fontWeight: FontWeight.w800,),
                                            ),
                                            TextSpan(
                                              text: '\nCreate date',
                                              style: TextStyle(),
                                            )
                                          ],
                                          style: FlutterFlowTheme.of(context)
                                              .bodyMedium
                                              .override(
                                            fontFamily: 'Inter',
                                            letterSpacing: 0.0,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                        Column(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Align(
                              alignment: AlignmentDirectional(-0.8, 0),
                              child: Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    0, 10, 0, 20),
                                child: Text(
                                  'Tuyển sinh',
                                  style: FlutterFlowTheme.of(context)
                                      .titleLarge
                                      .override(
                                    fontFamily: 'Inter Tight',
                                    color: Color(0xFF0B2384),
                                    fontSize: 32,
                                    letterSpacing: 0.0,
                                    fontWeight: FontWeight.w800,
                                    shadows: [
                                      Shadow(
                                        color: FlutterFlowTheme.of(context)
                                            .secondaryText,
                                        offset: Offset(2.0, 2.0),
                                        blurRadius: 4.0,
                                      )
                                    ],
                                  ),
                                ),
                              ),
                            ),
                            Column(
                              mainAxisSize: MainAxisSize.max,
                              children: [
                                ClipRRect(
                                  borderRadius: BorderRadius.circular(8),
                                  child: Image.asset(
                                    'assets/images/homepage_images/Rectangle_76_(2).png',
                                    width: 332,
                                    height: 139,
                                    fit: BoxFit.contain,
                                  ),
                                ),
                                Align(
                                  alignment: AlignmentDirectional(-1, 0),
                                  child: Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        40, 0, 0, 0),
                                    child: RichText(
                                      textScaler:
                                      MediaQuery.of(context).textScaler,
                                      text: TextSpan(
                                        children: [
                                          TextSpan(
                                            text: 'Title of news',
                                            style: TextStyle(
                                              color: Colors.blueAccent,
                                              fontFamily: 'Inter',
                                              letterSpacing: 0.0,
                                              fontWeight: FontWeight.w800,),
                                            ),
                                          TextSpan(
                                            text: '\nCreate date',
                                            style: TextStyle(),
                                          )
                                        ],
                                        style: FlutterFlowTheme.of(context)
                                            .bodyMedium
                                            .override(
                                          fontFamily: 'Inter',
                                          letterSpacing: 0.0,
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            Padding(
                              padding:
                              EdgeInsetsDirectional.fromSTEB(0, 10, 0, 0),
                              child: Column(
                                mainAxisSize: MainAxisSize.max,
                                children: [
                                  Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        0, 1, 0, 0),
                                    child: ClipRRect(
                                      borderRadius: BorderRadius.circular(8),
                                      child: Image.asset(
                                        'assets/images/homepage_images/Rectangle_76_(3).png',
                                        width: 332,
                                        height: 139,
                                        fit: BoxFit.contain,
                                      ),
                                    ),
                                  ),
                                  Align(
                                    alignment: AlignmentDirectional(-1, 0),
                                    child: Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          40, 0, 0, 0),
                                      child: RichText(
                                        textScaler:
                                        MediaQuery.of(context).textScaler,
                                        text: TextSpan(
                                          children: [
                                            TextSpan(
                                              text: 'Title of news',
                                              style: TextStyle(
                                                color: Colors.blueAccent,
                                                fontFamily: 'Inter',
                                                letterSpacing: 0.0,
                                                fontWeight: FontWeight.w800,),
                                            ),
                                            TextSpan(
                                              text: '\nCreate date',
                                              style: TextStyle(),
                                            )
                                          ],
                                          style: FlutterFlowTheme.of(context)
                                              .bodyMedium
                                              .override(
                                            fontFamily: 'Inter',
                                            letterSpacing: 0.0,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                        Column(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Align(
                              alignment: AlignmentDirectional(-0.8, 0),
                              child: Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    20, 10, 0, 20),
                                child: Text(
                                  'Chương trình giáo dục',
                                  style: FlutterFlowTheme.of(context)
                                      .titleLarge
                                      .override(
                                    fontFamily: 'Inter Tight',
                                    color: Color(0xFF0B2384),
                                    fontSize: 32,
                                    letterSpacing: 0.0,
                                    fontWeight: FontWeight.w800,
                                    shadows: [
                                      Shadow(
                                        color: FlutterFlowTheme.of(context)
                                            .secondaryText,
                                        offset: Offset(2.0, 2.0),
                                        blurRadius: 4.0,
                                      )
                                    ],
                                  ),
                                ),
                              ),
                            ),
                            Column(
                              mainAxisSize: MainAxisSize.max,
                              children: [
                                ClipRRect(
                                  borderRadius: BorderRadius.circular(8),
                                  child: Image.asset(
                                    'assets/images/homepage_images/Rectangle_76_(4).png',
                                    width: 332,
                                    height: 139,
                                    fit: BoxFit.contain,
                                  ),
                                ),
                                Align(
                                  alignment: AlignmentDirectional(-1, 0),
                                  child: Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        40, 0, 0, 0),
                                    child: RichText(
                                      textScaler:
                                      MediaQuery.of(context).textScaler,
                                      text: TextSpan(
                                        children: [
                                          TextSpan(
                                            text: 'Title of news',
                                            style: TextStyle(
                                              color: Colors.blueAccent,
                                              fontFamily: 'Inter',
                                              letterSpacing: 0.0,
                                              fontWeight: FontWeight.w800,),
                                          ),
                                          TextSpan(
                                            text: '\nCreate date',
                                            style: TextStyle(),
                                          )
                                        ],
                                        style: FlutterFlowTheme.of(context)
                                            .bodyMedium
                                            .override(
                                          fontFamily: 'Inter',
                                          letterSpacing: 0.0,
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            Padding(
                              padding:
                              EdgeInsetsDirectional.fromSTEB(0, 10, 0, 0),
                              child: Column(
                                mainAxisSize: MainAxisSize.max,
                                children: [
                                  Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        0, 1, 0, 0),
                                    child: ClipRRect(
                                      borderRadius: BorderRadius.circular(8),
                                      child: Image.asset(
                                        'assets/images/homepage_images/Rectangle_76_(5).png',
                                        width: 332,
                                        height: 139,
                                        fit: BoxFit.contain,
                                      ),
                                    ),
                                  ),
                                  Align(
                                    alignment: AlignmentDirectional(-1, 0),
                                    child: Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          40, 0, 0, 0),
                                      child: RichText(
                                        textScaler:
                                        MediaQuery.of(context).textScaler,
                                        text: TextSpan(
                                          children: [
                                              TextSpan(
                                              text: 'Title of news',
                                                style: TextStyle(
                                                  color: Colors.blueAccent,
                                                  fontFamily: 'Inter',
                                                  letterSpacing: 0.0,
                                                  fontWeight: FontWeight.w800,),
                                              ),
                                            TextSpan(
                                              text: '\nCreate date',
                                              style: TextStyle(),
                                            )
                                          ],
                                          style: FlutterFlowTheme.of(context)
                                              .bodyMedium
                                              .override(
                                            fontFamily: 'Inter',
                                            letterSpacing: 0.0,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                        Column(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Align(
                              alignment: AlignmentDirectional(-0.8, 0),
                              child: Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    10, 10, 0, 20),
                                child: Text(
                                  'Về Vinschool',
                                  style: FlutterFlowTheme.of(context)
                                      .titleLarge
                                      .override(
                                    fontFamily: 'Inter Tight',
                                    color: Color(0xFF0B2384),
                                    fontSize: 32,
                                    letterSpacing: 0.0,
                                    fontWeight: FontWeight.w800,
                                    shadows: [
                                      Shadow(
                                        color: FlutterFlowTheme.of(context)
                                            .secondaryText,
                                        offset: Offset(2.0, 2.0),
                                        blurRadius: 4.0,
                                      )
                                    ],
                                  ),
                                ),
                              ),
                            ),
                            Column(
                              mainAxisSize: MainAxisSize.max,
                              children: [
                                ClipRRect(
                                  borderRadius: BorderRadius.circular(8),
                                  child: Image.asset(
                                    'assets/images/homepage_images/Rectangle_76_(6).png',
                                    width: 332,
                                    height: 139,
                                    fit: BoxFit.contain,
                                  ),
                                ),
                                Align(
                                  alignment: AlignmentDirectional(-1, 0),
                                  child: Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        40, 0, 0, 0),
                                    child: RichText(
                                      textScaler:
                                      MediaQuery.of(context).textScaler,
                                      text: TextSpan(
                                        children: [
                                          TextSpan(
                                            text: 'Title of news',
                                            style: TextStyle(
                                              color: Colors.blueAccent,
                                              fontFamily: 'Inter',
                                              letterSpacing: 0.0,
                                              fontWeight: FontWeight.w800,),
                                          ),
                                          TextSpan(
                                            text: '\nCreate date',
                                            style: TextStyle(),
                                          )
                                        ],
                                        style: FlutterFlowTheme.of(context)
                                            .bodyMedium
                                            .override(
                                          fontFamily: 'Inter',
                                          letterSpacing: 0.0,
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            Padding(
                              padding:
                              EdgeInsetsDirectional.fromSTEB(0, 10, 0, 0),
                              child: Column(
                                mainAxisSize: MainAxisSize.max,
                                children: [
                                  Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        0, 1, 0, 0),
                                    child: ClipRRect(
                                      borderRadius: BorderRadius.circular(8),
                                      child: Image.asset(
                                        'assets/images/homepage_images/Rectangle_76_(7).png',
                                        width: 332,
                                        height: 139,
                                        fit: BoxFit.contain,
                                      ),
                                    ),
                                  ),
                                  Align(
                                    alignment: AlignmentDirectional(-1, 0),
                                    child: Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          40, 0, 0, 0),
                                      child: RichText(
                                        textScaler:
                                        MediaQuery.of(context).textScaler,
                                        text: TextSpan(
                                          children: [
                                            TextSpan(
                                              text: 'Title of news',
                                              style: TextStyle(
                                                color: Colors.blueAccent,
                                                fontFamily: 'Inter',
                                                letterSpacing: 0.0,
                                                fontWeight: FontWeight.w800,),
                                            ),
                                            TextSpan(
                                              text: '\nCreate date',
                                              style: TextStyle(),
                                            )
                                          ],
                                          style: FlutterFlowTheme.of(context)
                                              .bodyMedium
                                              .override(
                                            fontFamily: 'Inter',
                                            letterSpacing: 0.0,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

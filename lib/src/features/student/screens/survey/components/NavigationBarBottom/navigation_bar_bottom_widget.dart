import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

import 'navigation_bar_bottom_model.dart';
export 'navigation_bar_bottom_model.dart';

class NavigationBarBottomWidget extends StatefulWidget {
  const NavigationBarBottomWidget({super.key});

  @override
  State<NavigationBarBottomWidget> createState() =>
      _NavigationBarBottomWidgetState();
}

class _NavigationBarBottomWidgetState extends State<NavigationBarBottomWidget> {
  late NavigationBarBottomModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => NavigationBarBottomModel());
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 412,
      height: 65,
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
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(24),
          bottomRight: Radius.circular(24),
          topLeft: Radius.circular(24),
          topRight: Radius.circular(24),
        ),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsetsDirectional.fromSTEB(8, 0, 8, 8),
            child: Column(
              mainAxisSize: MainAxisSize.max,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: EdgeInsets.all(10),
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Row(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Column(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              FaIcon(
                                FontAwesomeIcons.home,
                                color: Color(0xFF0B2384),
                                size: 24,
                              ),
                              Text(
                                'Trang chủ',
                                style: FlutterFlowTheme.of(context)
                                    .bodySmall
                                    .override(
                                  fontFamily: 'Inter',
                                  color: Color(0xFF0B2384),
                                  fontSize: 10,
                                  letterSpacing: 0.0,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(0, 0, 5, 0),
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Column(
                              mainAxisSize: MainAxisSize.max,
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Align(
                                  alignment: AlignmentDirectional(0, 0),
                                  child: FaIcon(
                                    FontAwesomeIcons.calendar,
                                    color: Color(0xFF0B2384),
                                    size: 24,
                                  ),
                                ),
                                Text(
                                  'Học sinh',
                                  style: FlutterFlowTheme.of(context)
                                      .bodySmall
                                      .override(
                                    fontFamily: 'Inter',
                                    color: Color(0xFF0B2384),
                                    fontSize: 10,
                                    letterSpacing: 0.0,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                      Row(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Column(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              FaIcon(
                                FontAwesomeIcons.comment,
                                color: Color(0xFF0B2384),
                                size: 24,
                              ),
                              Text(
                                'Chat',
                                style: FlutterFlowTheme.of(context)
                                    .bodySmall
                                    .override(
                                  fontFamily: 'Inter',
                                  color: Color(0xFF0B2384),
                                  fontSize: 10,
                                  letterSpacing: 0.0,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                      Row(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Column(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              FaIcon(
                                FontAwesomeIcons.bell,
                                color: Color(0xFF0B2384),
                                size: 24,
                              ),
                              Text(
                                'Thông báo',
                                style: FlutterFlowTheme.of(context)
                                    .bodySmall
                                    .override(
                                  fontFamily: 'Inter',
                                  color: Color(0xFF0B2384),
                                  fontSize: 10,
                                  letterSpacing: 0.0,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                      Row(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Column(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              FaIcon(
                                FontAwesomeIcons.user,
                                color: Color(0xFF0B2384),
                                size: 24,
                              ),
                              Text(
                                'Tài khoản',
                                style: FlutterFlowTheme.of(context)
                                    .bodySmall
                                    .override(
                                  fontFamily: 'Inter',
                                  color: Color(0xFF0B2384),
                                  fontSize: 10,
                                  letterSpacing: 0.0,
                                ),
                              ),
                            ],
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
    );
  }
}

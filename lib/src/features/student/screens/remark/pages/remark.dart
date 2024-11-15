import '../components/NavigationBarBottom/navigation_bar_bottom_widget.dart';
import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:math';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

import 'remark_model.dart';
export 'remark_model.dart';

class RemarkWidget extends StatefulWidget {
  const RemarkWidget({super.key});

  @override
  State<RemarkWidget> createState() => _RemarkWidgetState();
}

class _RemarkWidgetState extends State<RemarkWidget>
    with TickerProviderStateMixin {
  late RemarkModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  final animationsMap = <String, AnimationInfo>{};

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => RemarkModel());

    animationsMap.addAll({
      'containerOnPageLoadAnimation': AnimationInfo(
        trigger: AnimationTrigger.onPageLoad,
        effectsBuilder: () => [
          VisibilityEffect(duration: 1.ms),
          FadeEffect(
            curve: Curves.easeInOut,
            delay: 0.0.ms,
            duration: 300.0.ms,
            begin: 0.0,
            end: 1.0,
          ),
          MoveEffect(
            curve: Curves.easeInOut,
            delay: 0.0.ms,
            duration: 300.0.ms,
            begin: Offset(0.0, 20.0),
            end: Offset(0.0, 0.0),
          ),
          TiltEffect(
            curve: Curves.easeInOut,
            delay: 0.0.ms,
            duration: 300.0.ms,
            begin: Offset(0.698, 0),
            end: Offset(0, 0),
          ),
        ],
      ),
    });
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        key: scaffoldKey,
        backgroundColor: FlutterFlowTheme.of(context).secondaryBackground,
        appBar: AppBar(
          backgroundColor: FlutterFlowTheme.of(context).secondaryBackground,
          automaticallyImplyLeading: false,
          actions: [],
          flexibleSpace: FlexibleSpaceBar(
            background: Stack(
              children: [
                Stack(
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(0),
                      child: Image.asset(
                        'assets/images/homepage_images/Vector.png',
                        width: 360,
                        fit: BoxFit.fill,
                      ),
                    ),
                    Align(
                      alignment: AlignmentDirectional(-0.3, -0.38),
                      child: Text(
                        'Nhận xét',
                        style: FlutterFlowTheme.of(context).bodyLarge.override(
                          fontFamily: 'Inter',
                          color: Colors.white,
                          fontSize: 20,
                          letterSpacing: 0.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    Align(
                      alignment: AlignmentDirectional(-0.9, -0.6),
                      child: FlutterFlowIconButton(
                        borderRadius: 8,
                        buttonSize: 50,
                        icon: Icon(
                          Icons.keyboard_arrow_left_rounded,
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
            preferredSize: Size.fromHeight(70),
            child: Container(),
          ),
          centerTitle: false,
          elevation: 0,
        ),
        body: SafeArea(
          top: true,
          child: Stack(
            children: [
              Align(
                alignment: AlignmentDirectional(0, -1),
                child: Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(0, 10, 0, 0),
                  child: Container(
                    width: 300,
                    height: 40,
                    decoration: BoxDecoration(
                      color: FlutterFlowTheme.of(context).secondaryBackground,
                      boxShadow: [
                        BoxShadow(
                          blurRadius: 2,
                          color: Color(0x33000000),
                          offset: Offset(
                            2,
                            2,
                          ),
                          spreadRadius: 1,
                        )
                      ],
                      borderRadius: BorderRadius.circular(16),
                      shape: BoxShape.rectangle,
                    ),
                    child: Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(0, 6, 0, 0),
                      child: Column(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Align(
                            alignment: AlignmentDirectional(0, 0),
                            child: Text(
                              'Nhận xét',
                              style: FlutterFlowTheme.of(context)
                                  .bodyLarge
                                  .override(
                                fontFamily: 'Inter',
                                color: Color(0xFF00154D),
                                letterSpacing: 0.0,
                                fontWeight: FontWeight.w800,
                              ),
                            ),
                          ),
                          Align(
                            alignment: AlignmentDirectional(0, 0),
                            child: Padding(
                              padding:
                              EdgeInsetsDirectional.fromSTEB(0, 4, 0, 0),
                              child: Container(
                                width: 100,
                                height: 4,
                                decoration: BoxDecoration(
                                  color: Color(0xFF4B39EF),
                                  borderRadius: BorderRadius.circular(4),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
              Align(
                alignment: AlignmentDirectional(0, 0),
                child: Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(10, 0, 10, 0),
                  child: Container(
                    width: double.infinity,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 12),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          ListView(
                            padding: EdgeInsets.zero,
                            reverse: true,
                            shrinkWrap: true,
                            scrollDirection: Axis.vertical,
                            children: [
                              Padding(
                                padding:
                                EdgeInsetsDirectional.fromSTEB(0, 0, 0, 10),
                                child: Container(
                                  width: 100,
                                  height: 100,
                                  decoration: BoxDecoration(
                                    color: Colors.white,
                                    boxShadow: [
                                      BoxShadow(
                                        blurRadius: 2,
                                        color: Color(0xFFE0E3E7),
                                        offset: Offset(
                                          3,
                                          2,
                                        ),
                                      )
                                    ],
                                    borderRadius: BorderRadius.circular(16),
                                  ),
                                  child: Row(
                                    mainAxisSize: MainAxisSize.max,
                                    children: [
                                      Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            16, 8, 0, 8),
                                        child: Container(
                                          width: 4,
                                          height: 70,
                                          decoration: BoxDecoration(
                                            color: Color(0xFF4B39EF),
                                            borderRadius:
                                            BorderRadius.circular(4),
                                          ),
                                        ),
                                      ),
                                      Expanded(
                                        child: Padding(
                                          padding:
                                          EdgeInsetsDirectional.fromSTEB(
                                              12, 12, 12, 0),
                                          child: Column(
                                            mainAxisSize: MainAxisSize.max,
                                            crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                            children: [
                                              Padding(
                                                padding: EdgeInsetsDirectional
                                                    .fromSTEB(0, 0, 0, 4),
                                                child: Text(
                                                  'Giáo viên: Nguyễn Văn E',
                                                  style: FlutterFlowTheme.of(
                                                      context)
                                                      .labelSmall
                                                      .override(
                                                    fontFamily:
                                                    'Plus Jakarta Sans',
                                                    color:
                                                    Color(0xFF57636C),
                                                    fontSize: 16,
                                                    letterSpacing: 0.0,
                                                    fontWeight:
                                                    FontWeight.w800,
                                                  ),
                                                ),
                                              ),
                                              Row(
                                                mainAxisSize: MainAxisSize.max,
                                                children: [
                                                  FaIcon(
                                                    FontAwesomeIcons.calendar,
                                                    color: Color(0xFF0B2384),
                                                    size: 24,
                                                  ),
                                                  Expanded(
                                                    child: Padding(
                                                      padding:
                                                      EdgeInsetsDirectional
                                                          .fromSTEB(
                                                          5, 0, 0, 0),
                                                      child: Text(
                                                        '6 tháng trước, 5:30pm',
                                                        style:
                                                        FlutterFlowTheme.of(
                                                            context)
                                                            .bodyMedium
                                                            .override(
                                                          fontFamily:
                                                          'Plus Jakarta Sans',
                                                          color: Color(
                                                              0xFF14181B),
                                                          fontSize: 14,
                                                          letterSpacing:
                                                          0.0,
                                                          fontWeight:
                                                          FontWeight
                                                              .w500,
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                  Padding(
                                                    padding:
                                                    EdgeInsetsDirectional
                                                        .fromSTEB(
                                                        16, 0, 0, 0),
                                                    child: FFButtonWidget(
                                                      onPressed: () {
                                                        print(
                                                            'Button pressed ...');
                                                      },
                                                      text: 'Chi tiết',
                                                      options: FFButtonOptions(
                                                        height: 30,
                                                        padding:
                                                        EdgeInsetsDirectional
                                                            .fromSTEB(16, 0,
                                                            16, 0),

                                                        iconPadding:
                                                        EdgeInsetsDirectional
                                                            .fromSTEB(
                                                            0, 0, 0, 0),
                                                        color:
                                                        Color(0xFFE8E7FC),
                                                        textStyle:
                                                        FlutterFlowTheme.of(
                                                            context)
                                                            .bodyMedium
                                                            .override(
                                                          fontFamily:
                                                          'Plus Jakarta Sans',
                                                          color: FlutterFlowTheme
                                                              .of(context)
                                                              .secondaryText,
                                                          fontSize: 14,
                                                          letterSpacing: 0.0,
                                                          fontWeight:
                                                          FontWeight.w800,
                                                          shadows: [
                                                            Shadow(
                                                              color: FlutterFlowTheme
                                                                  .of(context)
                                                                  .primary,
                                                              offset: Offset(
                                                                  2.0, 2.0),
                                                              blurRadius: 5.0,
                                                            )
                                                          ],
                                                        ),
                                                        elevation: 0,
                                                        borderRadius:
                                                        BorderRadius
                                                            .circular(16),
                                                      ),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              Padding(
                                padding:
                                EdgeInsetsDirectional.fromSTEB(0, 0, 0, 10),
                                child: Container(
                                  width: 100,
                                  height: 100,
                                  decoration: BoxDecoration(
                                    color: Colors.white,
                                    boxShadow: [
                                      BoxShadow(
                                        blurRadius: 2,
                                        color: Color(0xFFE0E3E7),
                                        offset: Offset(
                                          3,
                                          2,
                                        ),
                                      )
                                    ],
                                    borderRadius: BorderRadius.circular(16),
                                  ),
                                  child: Row(
                                    mainAxisSize: MainAxisSize.max,
                                    children: [
                                      Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            16, 8, 0, 8),
                                        child: Container(
                                          width: 4,
                                          height: 70,
                                          decoration: BoxDecoration(
                                            color: Color(0xFF4B39EF),
                                            borderRadius:
                                            BorderRadius.circular(4),
                                          ),
                                        ),
                                      ),
                                      Expanded(
                                        child: Padding(
                                          padding:
                                          EdgeInsetsDirectional.fromSTEB(
                                              12, 12, 12, 0),
                                          child: Column(
                                            mainAxisSize: MainAxisSize.max,
                                            crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                            children: [
                                              Padding(
                                                padding: EdgeInsetsDirectional
                                                    .fromSTEB(0, 0, 0, 4),
                                                child: Text(
                                                  'Giáo viên: Nguyễn Văn D',
                                                  style: FlutterFlowTheme.of(
                                                      context)
                                                      .labelSmall
                                                      .override(
                                                    fontFamily:
                                                    'Plus Jakarta Sans',
                                                    color:
                                                    Color(0xFF57636C),
                                                    fontSize: 16,
                                                    letterSpacing: 0.0,
                                                    fontWeight:
                                                    FontWeight.w800,
                                                  ),
                                                ),
                                              ),
                                              Row(
                                                mainAxisSize: MainAxisSize.max,
                                                children: [
                                                  FaIcon(
                                                    FontAwesomeIcons.calendar,
                                                    color: Color(0xFF0B2384),
                                                    size: 24,
                                                  ),
                                                  Expanded(
                                                    child: Padding(
                                                      padding:
                                                      EdgeInsetsDirectional
                                                          .fromSTEB(
                                                          5, 0, 0, 0),
                                                      child: Text(
                                                        '1 tuần trước, 5:30pm',
                                                        style:
                                                        FlutterFlowTheme.of(
                                                            context)
                                                            .bodyMedium
                                                            .override(
                                                          fontFamily:
                                                          'Plus Jakarta Sans',
                                                          color: Color(
                                                              0xFF14181B),
                                                          fontSize: 14,
                                                          letterSpacing:
                                                          0.0,
                                                          fontWeight:
                                                          FontWeight
                                                              .w500,
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                  Padding(
                                                    padding:
                                                    EdgeInsetsDirectional
                                                        .fromSTEB(
                                                        16, 0, 0, 0),
                                                    child: FFButtonWidget(
                                                      onPressed: () {
                                                        print(
                                                            'Button pressed ...');
                                                      },
                                                      text: 'Chi tiết',
                                                      options: FFButtonOptions(
                                                        height: 30,
                                                        padding:
                                                        EdgeInsetsDirectional
                                                            .fromSTEB(16, 0,
                                                            16, 0),

                                                        iconPadding:
                                                        EdgeInsetsDirectional
                                                            .fromSTEB(
                                                            0, 0, 0, 0),
                                                        color:
                                                        Color(0xFFE8E7FC),
                                                        textStyle:
                                                        FlutterFlowTheme.of(
                                                            context)
                                                            .bodyMedium
                                                            .override(
                                                          fontFamily:
                                                          'Plus Jakarta Sans',
                                                          color: FlutterFlowTheme
                                                              .of(context)
                                                              .secondaryText,
                                                          fontSize: 14,
                                                          letterSpacing: 0.0,
                                                          fontWeight:
                                                          FontWeight.w800,
                                                          shadows: [
                                                            Shadow(
                                                              color: FlutterFlowTheme
                                                                  .of(context)
                                                                  .primary,
                                                              offset: Offset(
                                                                  2.0, 2.0),
                                                              blurRadius: 5.0,
                                                            )
                                                          ],
                                                        ),
                                                        elevation: 0,
                                                        borderRadius:
                                                        BorderRadius
                                                            .circular(16),
                                                      ),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              Padding(
                                padding:
                                EdgeInsetsDirectional.fromSTEB(0, 0, 0, 10),
                                child: Container(
                                  width: 100,
                                  height: 100,
                                  decoration: BoxDecoration(
                                    color: Colors.white,
                                    boxShadow: [
                                      BoxShadow(
                                        blurRadius: 2,
                                        color: Color(0xFFE0E3E7),
                                        offset: Offset(
                                          3,
                                          2,
                                        ),
                                      )
                                    ],
                                    borderRadius: BorderRadius.circular(16),
                                  ),
                                  child: Row(
                                    mainAxisSize: MainAxisSize.max,
                                    children: [
                                      Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            16, 8, 0, 8),
                                        child: Container(
                                          width: 4,
                                          height: 70,
                                          decoration: BoxDecoration(
                                            color: Color(0xFF4B39EF),
                                            borderRadius:
                                            BorderRadius.circular(4),
                                          ),
                                        ),
                                      ),
                                      Expanded(
                                        child: Padding(
                                          padding:
                                          EdgeInsetsDirectional.fromSTEB(
                                              12, 12, 12, 0),
                                          child: Column(
                                            mainAxisSize: MainAxisSize.max,
                                            crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                            children: [
                                              Padding(
                                                padding: EdgeInsetsDirectional
                                                    .fromSTEB(0, 0, 0, 4),
                                                child: Text(
                                                  'Giáo viên: Nguyễn Văn C',
                                                  style: FlutterFlowTheme.of(
                                                      context)
                                                      .labelSmall
                                                      .override(
                                                    fontFamily:
                                                    'Plus Jakarta Sans',
                                                    color:
                                                    Color(0xFF57636C),
                                                    fontSize: 16,
                                                    letterSpacing: 0.0,
                                                    fontWeight:
                                                    FontWeight.w800,
                                                  ),
                                                ),
                                              ),
                                              Row(
                                                mainAxisSize: MainAxisSize.max,
                                                children: [
                                                  FaIcon(
                                                    FontAwesomeIcons.calendar,
                                                    color: Color(0xFF0B2384),
                                                    size: 24,
                                                  ),
                                                  Expanded(
                                                    child: Padding(
                                                      padding:
                                                      EdgeInsetsDirectional
                                                          .fromSTEB(
                                                          5, 0, 0, 0),
                                                      child: Text(
                                                        '2 ngày trước, 5:30pm',
                                                        style:
                                                        FlutterFlowTheme.of(
                                                            context)
                                                            .bodyMedium
                                                            .override(
                                                          fontFamily:
                                                          'Plus Jakarta Sans',
                                                          color: Color(
                                                              0xFF14181B),
                                                          fontSize: 14,
                                                          letterSpacing:
                                                          0.0,
                                                          fontWeight:
                                                          FontWeight
                                                              .w500,
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                  Padding(
                                                    padding:
                                                    EdgeInsetsDirectional
                                                        .fromSTEB(
                                                        16, 0, 0, 0),
                                                    child: FFButtonWidget(
                                                      onPressed: () {
                                                        print(
                                                            'Button pressed ...');
                                                      },
                                                      text: 'Chi tiết',
                                                      options: FFButtonOptions(
                                                        height: 30,
                                                        padding:
                                                        EdgeInsetsDirectional
                                                            .fromSTEB(16, 0,
                                                            16, 0),

                                                        iconPadding:
                                                        EdgeInsetsDirectional
                                                            .fromSTEB(
                                                            0, 0, 0, 0),
                                                        color:
                                                        Color(0xFFE8E7FC),
                                                        textStyle:
                                                        FlutterFlowTheme.of(
                                                            context)
                                                            .bodyMedium
                                                            .override(
                                                          fontFamily:
                                                          'Plus Jakarta Sans',
                                                          color: FlutterFlowTheme
                                                              .of(context)
                                                              .secondaryText,
                                                          fontSize: 14,
                                                          letterSpacing: 0.0,
                                                          fontWeight:
                                                          FontWeight.w800,
                                                          shadows: [
                                                            Shadow(
                                                              color: FlutterFlowTheme
                                                                  .of(context)
                                                                  .primary,
                                                              offset: Offset(
                                                                  2.0, 2.0),
                                                              blurRadius: 5.0,
                                                            )
                                                          ],
                                                        ),
                                                        elevation: 0,
                                                        borderRadius:
                                                        BorderRadius
                                                            .circular(16),
                                                      ),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              Padding(
                                padding:
                                EdgeInsetsDirectional.fromSTEB(0, 0, 0, 10),
                                child: Container(
                                  width: 100,
                                  height: 100,
                                  decoration: BoxDecoration(
                                    color: Colors.white,
                                    boxShadow: [
                                      BoxShadow(
                                        blurRadius: 2,
                                        color: Color(0xFFE0E3E7),
                                        offset: Offset(
                                          3,
                                          2,
                                        ),
                                      )
                                    ],
                                    borderRadius: BorderRadius.circular(16),
                                  ),
                                  child: Row(
                                    mainAxisSize: MainAxisSize.max,
                                    children: [
                                      Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            16, 8, 0, 8),
                                        child: Container(
                                          width: 4,
                                          height: 70,
                                          decoration: BoxDecoration(
                                            color: Color(0xFF4B39EF),
                                            borderRadius:
                                            BorderRadius.circular(4),
                                          ),
                                        ),
                                      ),
                                      Expanded(
                                        child: Padding(
                                          padding:
                                          EdgeInsetsDirectional.fromSTEB(
                                              12, 12, 12, 0),
                                          child: Column(
                                            mainAxisSize: MainAxisSize.max,
                                            crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                            children: [
                                              Padding(
                                                padding: EdgeInsetsDirectional
                                                    .fromSTEB(0, 0, 0, 4),
                                                child: Text(
                                                  'Giáo viên: Nguyễn Văn B',
                                                  style: FlutterFlowTheme.of(
                                                      context)
                                                      .labelSmall
                                                      .override(
                                                    fontFamily:
                                                    'Plus Jakarta Sans',
                                                    color:
                                                    Color(0xFF57636C),
                                                    fontSize: 16,
                                                    letterSpacing: 0.0,
                                                    fontWeight:
                                                    FontWeight.w800,
                                                  ),
                                                ),
                                              ),
                                              Row(
                                                mainAxisSize: MainAxisSize.max,
                                                children: [
                                                  FaIcon(
                                                    FontAwesomeIcons.calendar,
                                                    color: Color(0xFF0B2384),
                                                    size: 24,
                                                  ),
                                                  Expanded(
                                                    child: Padding(
                                                      padding:
                                                      EdgeInsetsDirectional
                                                          .fromSTEB(
                                                          5, 0, 0, 0),
                                                      child: Text(
                                                        'Hôm qua, 5:30pm',
                                                        style:
                                                        FlutterFlowTheme.of(
                                                            context)
                                                            .bodyMedium
                                                            .override(
                                                          fontFamily:
                                                          'Plus Jakarta Sans',
                                                          color: Color(
                                                              0xFF14181B),
                                                          fontSize: 14,
                                                          letterSpacing:
                                                          0.0,
                                                          fontWeight:
                                                          FontWeight
                                                              .w500,
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                  Padding(
                                                    padding:
                                                    EdgeInsetsDirectional
                                                        .fromSTEB(
                                                        16, 0, 0, 0),
                                                    child: FFButtonWidget(
                                                      onPressed: () {
                                                        print(
                                                            'Button pressed ...');
                                                      },
                                                      text: 'Chi tiết',
                                                      options: FFButtonOptions(
                                                        height: 30,
                                                        padding:
                                                        EdgeInsetsDirectional
                                                            .fromSTEB(16, 0,
                                                            16, 0),

                                                        iconPadding:
                                                        EdgeInsetsDirectional
                                                            .fromSTEB(
                                                            0, 0, 0, 0),
                                                        color:
                                                        Color(0xFFE8E7FC),
                                                        textStyle:
                                                        FlutterFlowTheme.of(
                                                            context)
                                                            .bodyMedium
                                                            .override(
                                                          fontFamily:
                                                          'Plus Jakarta Sans',
                                                          color: FlutterFlowTheme
                                                              .of(context)
                                                              .secondaryText,
                                                          fontSize: 14,
                                                          letterSpacing: 0.0,
                                                          fontWeight:
                                                          FontWeight.w800,
                                                          shadows: [
                                                            Shadow(
                                                              color: FlutterFlowTheme
                                                                  .of(context)
                                                                  .primary,
                                                              offset: Offset(
                                                                  2.0, 2.0),
                                                              blurRadius: 5.0,
                                                            )
                                                          ],
                                                        ),
                                                        elevation: 0,
                                                        borderRadius:
                                                        BorderRadius
                                                            .circular(16),
                                                      ),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              Padding(
                                padding:
                                EdgeInsetsDirectional.fromSTEB(0, 0, 0, 10),
                                child: Container(
                                  width: 100,
                                  height: 100,
                                  decoration: BoxDecoration(
                                    color: Colors.white,
                                    boxShadow: [
                                      BoxShadow(
                                        blurRadius: 2,
                                        color: Color(0xFFE0E3E7),
                                        offset: Offset(
                                          3,
                                          2,
                                        ),
                                      )
                                    ],
                                    borderRadius: BorderRadius.circular(16),
                                  ),
                                  child: Row(
                                    mainAxisSize: MainAxisSize.max,
                                    children: [
                                      Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            16, 8, 0, 8),
                                        child: Container(
                                          width: 4,
                                          height: 70,
                                          decoration: BoxDecoration(
                                            color: Color(0xFF4B39EF),
                                            borderRadius:
                                            BorderRadius.circular(4),
                                          ),
                                        ),
                                      ),
                                      Expanded(
                                        child: Padding(
                                          padding:
                                          EdgeInsetsDirectional.fromSTEB(
                                              12, 12, 12, 0),
                                          child: Column(
                                            mainAxisSize: MainAxisSize.max,
                                            crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                            children: [
                                              Padding(
                                                padding: EdgeInsetsDirectional
                                                    .fromSTEB(0, 0, 0, 4),
                                                child: Text(
                                                  'Giáo viên: Nguyễn Văn A',
                                                  style: FlutterFlowTheme.of(
                                                      context)
                                                      .labelSmall
                                                      .override(
                                                    fontFamily:
                                                    'Plus Jakarta Sans',
                                                    color:
                                                    Color(0xFF57636C),
                                                    fontSize: 16,
                                                    letterSpacing: 0.0,
                                                    fontWeight:
                                                    FontWeight.w800,
                                                  ),
                                                ),
                                              ),
                                              Row(
                                                mainAxisSize: MainAxisSize.max,
                                                children: [
                                                  FaIcon(
                                                    FontAwesomeIcons.calendar,
                                                    color: Color(0xFF0B2384),
                                                    size: 24,
                                                  ),
                                                  Expanded(
                                                    child: Padding(
                                                      padding:
                                                      EdgeInsetsDirectional
                                                          .fromSTEB(
                                                          5, 0, 0, 0),
                                                      child: Text(
                                                        'Hôm nay, 5:30pm',
                                                        style:
                                                        FlutterFlowTheme.of(
                                                            context)
                                                            .bodyMedium
                                                            .override(
                                                          fontFamily:
                                                          'Plus Jakarta Sans',
                                                          color: Color(
                                                              0xFF14181B),
                                                          fontSize: 14,
                                                          letterSpacing:
                                                          0.0,
                                                          fontWeight:
                                                          FontWeight
                                                              .w500,
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                  Padding(
                                                    padding:
                                                    EdgeInsetsDirectional
                                                        .fromSTEB(
                                                        16, 0, 0, 0),
                                                    child: FFButtonWidget(
                                                      onPressed: () {
                                                        print(
                                                            'Button pressed ...');
                                                      },
                                                      text: 'Chi tiết',
                                                      options: FFButtonOptions(
                                                        height: 30,
                                                        padding:
                                                        EdgeInsetsDirectional
                                                            .fromSTEB(16, 0,
                                                            16, 0),

                                                        iconPadding:
                                                        EdgeInsetsDirectional
                                                            .fromSTEB(
                                                            0, 0, 0, 0),
                                                        color:
                                                        Color(0xFFE8E7FC),
                                                        textStyle:
                                                        FlutterFlowTheme.of(
                                                            context)
                                                            .bodyMedium
                                                            .override(
                                                          fontFamily:
                                                          'Plus Jakarta Sans',
                                                          color: FlutterFlowTheme
                                                              .of(context)
                                                              .secondaryText,
                                                          fontSize: 14,
                                                          letterSpacing: 0.0,
                                                          fontWeight:
                                                          FontWeight.w800,
                                                          shadows: [
                                                            Shadow(
                                                              color: FlutterFlowTheme
                                                                  .of(context)
                                                                  .primary,
                                                              offset: Offset(
                                                                  2.0, 2.0),
                                                              blurRadius: 5.0,
                                                            )
                                                          ],
                                                        ),
                                                        elevation: 0,
                                                        borderRadius:
                                                        BorderRadius
                                                            .circular(16),
                                                      ),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ).animateOnPageLoad(
                      animationsMap['containerOnPageLoadAnimation']!),
                ),
              ),
              Align(
                alignment: AlignmentDirectional(0, 1),
                child: wrapWithModel(
                  model: _model.navigationBarBottomModel,
                  updateCallback: () => safeSetState(() {}),
                  child: NavigationBarBottomWidget(),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}


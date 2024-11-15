import 'package:get/get.dart';
import 'package:kindergarten_app/src/constants/sizes.dart';
import 'package:kindergarten_app/src/features/student/screens/survey/pages/survey_info.dart';

import '../../../controllers/guardian_navigation_menu_controller.dart';
import '../../guardian_navigation_menu/bottom_navigation_bar_widget.dart';
import '../components/NavigationBarBottom/navigation_bar_bottom_widget.dart';
import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'survey_model.dart';
export 'survey_model.dart';

class SurveyWidget extends StatefulWidget {
  const SurveyWidget({super.key});

  @override
  State<SurveyWidget> createState() => _SurveyWidgetState();
}

class _SurveyWidgetState extends State<SurveyWidget>
    with TickerProviderStateMixin {
  late SurveyModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  final animationsMap = <String, AnimationInfo>{};

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => SurveyModel());

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
            begin: const Offset(0.0, 20.0),
            end: const Offset(0.0, 0.0),
          ),
          TiltEffect(
            curve: Curves.easeInOut,
            delay: 0.0.ms,
            duration: 300.0.ms,
            begin: const Offset(0.698, 0),
            end: const Offset(0, 0),
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
    final guardianNavigationMenuController = Get.put(GuardianNavigationMenuController());
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        key: scaffoldKey,
        backgroundColor: FlutterFlowTheme.of(context).secondaryBackground,
        bottomNavigationBar: BottomNavigationBarWidget(controller: guardianNavigationMenuController),
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
                      alignment: const AlignmentDirectional(-0.3, -0.38),
                      child: Text(
                        'Khảo sát',
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
                      alignment: const AlignmentDirectional(-0.9, -0.6),
                      child: FlutterFlowIconButton(
                        borderRadius: 8,
                        buttonSize: 50,
                        icon: Icon(
                          Icons.keyboard_arrow_left_rounded,
                          color: FlutterFlowTheme.of(context).info,
                          size: 40,
                        ),
                        onPressed: () {
                          Get.back();
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
              Align(
                alignment: const AlignmentDirectional(0, -1),
                child: Padding(
                  padding: const EdgeInsetsDirectional.fromSTEB(0, 10, 0, 0),
                  child: Container(
                    width: 300,
                    height: 40,
                    decoration: BoxDecoration(
                      color: FlutterFlowTheme.of(context).secondaryBackground,
                      boxShadow: const [
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
                      padding: const EdgeInsetsDirectional.fromSTEB(0, 6, 0, 0),
                      child: Column(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Align(
                            alignment: const AlignmentDirectional(0, 0),
                            child: Text(
                              'Khảo sát',
                              style: FlutterFlowTheme.of(context)
                                  .bodyLarge
                                  .override(
                                fontFamily: 'Inter',
                                color: const Color(0xFF00154D),
                                letterSpacing: 0.0,
                                fontWeight: FontWeight.w800,
                              ),
                            ),
                          ),
                          Align(
                            alignment: const AlignmentDirectional(0, 0),
                            child: Padding(
                              padding:
                              const EdgeInsetsDirectional.fromSTEB(0, 4, 0, 0),
                              child: Container(
                                width: 100,
                                height: 4,
                                decoration: BoxDecoration(
                                  color: const Color(0xFF4B39EF),
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
                alignment: const AlignmentDirectional(0, 0),
                child: Padding(
                  padding: const EdgeInsetsDirectional.fromSTEB(10, 0, 10, 0),
                  child: Container(
                    width: double.infinity,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Padding(
                      padding: const EdgeInsetsDirectional.fromSTEB(0, 0, 0, 12),
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
                                const EdgeInsetsDirectional.fromSTEB(0, 0, 0, 10),
                                child: Container(
                                  width: 100,
                                  height: 110,
                                  decoration: BoxDecoration(
                                    color: Colors.white,
                                    boxShadow: const [
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
                                        padding: const EdgeInsetsDirectional.fromSTEB(
                                            10, 0, 0, 0),
                                        child: Container(
                                          clipBehavior: Clip.antiAlias,
                                          decoration: const BoxDecoration(
                                            shape: BoxShape.circle,
                                          ),
                                          child: Image.asset(
                                            'assets/images/homepage_images/Circle.png',
                                            fit: BoxFit.cover,
                                          ),
                                        ),
                                      ),
                                      Expanded(
                                        child: Padding(
                                          padding:
                                          const EdgeInsetsDirectional.fromSTEB(
                                              12, 12, 12, 0),
                                          child: Column(
                                            mainAxisSize: MainAxisSize.max,
                                            crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                            children: [
                                              Text(
                                                'PHIẾU KHẢO SÁT PHỤ HUYNH HỌC SINH ĐẦU NĂM HỌC 2024 - 2025',
                                                style:
                                                FlutterFlowTheme.of(context)
                                                    .labelSmall
                                                    .override(
                                                  fontFamily:
                                                  'Plus Jakarta Sans',
                                                  color:
                                                  const Color(0xFF57636C),
                                                  fontSize: 14,
                                                  letterSpacing: 0.0,
                                                  fontWeight:
                                                  FontWeight.w800,
                                                ),
                                              ),
                                              Row(
                                                mainAxisSize: MainAxisSize.max,
                                                children: [
                                                  const FaIcon(
                                                    FontAwesomeIcons.calendar,
                                                    color: Color(0xFF0B2384),
                                                    size: 24,
                                                  ),
                                                  Expanded(
                                                    child: Padding(
                                                      padding:
                                                      const EdgeInsetsDirectional
                                                          .fromSTEB(
                                                          5, 0, 0, 0),
                                                      child: Text(
                                                        'Thời hạn: 21/10/2024',
                                                        style:
                                                        FlutterFlowTheme.of(
                                                            context)
                                                            .bodyMedium
                                                            .override(
                                                          fontFamily:
                                                          'Plus Jakarta Sans',
                                                          color: const Color(
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
                                                ],
                                              ),
                                              Align(
                                                alignment:
                                                const AlignmentDirectional(1, 0),
                                                child: Padding(
                                                  padding: const EdgeInsetsDirectional
                                                      .fromSTEB(16, 0, 0, 0),
                                                  child: FFButtonWidget(
                                                    onPressed: () {
                                                      Get.to(const SurveyInfoWidget());
                                                    },
                                                    text: 'Đang làm',
                                                    options: FFButtonOptions(
                                                      width: 150,
                                                      height: 30,
                                                      padding:
                                                      const EdgeInsetsDirectional
                                                          .fromSTEB(
                                                          16, 0, 16, 0),

                                                      iconPadding:
                                                      const EdgeInsetsDirectional
                                                          .fromSTEB(
                                                          0, 0, 0, 0),
                                                      color: const Color(0xABFFEE00),
                                                      textStyle:
                                                      FlutterFlowTheme.of(
                                                          context)
                                                          .bodyMedium
                                                          .override(
                                                        fontFamily:
                                                        'Plus Jakarta Sans',
                                                        color:
                                                        const Color(0xC87D6E12),
                                                        fontSize: 14,
                                                        letterSpacing: 0.0,
                                                        fontWeight:
                                                        FontWeight.w800,
                                                        shadows: [
                                                          Shadow(
                                                            color: FlutterFlowTheme
                                                                .of(context)
                                                                .primary,
                                                            offset: const Offset(
                                                                2.0, 2.0),
                                                            blurRadius: 5.0,
                                                          )
                                                        ],
                                                      ),
                                                      elevation: 0,
                                                      borderRadius:
                                                      BorderRadius.circular(
                                                          16),
                                                    ),
                                                  ),
                                                ),
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
                                const EdgeInsetsDirectional.fromSTEB(0, 0, 0, 10),
                                child: Container(
                                  width: 100,
                                  height: 110,
                                  decoration: BoxDecoration(
                                    color: Colors.white,
                                    boxShadow: const [
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
                                        padding: const EdgeInsetsDirectional.fromSTEB(
                                            10, 0, 0, 0),
                                        child: Container(
                                          clipBehavior: Clip.antiAlias,
                                          decoration: const BoxDecoration(
                                            shape: BoxShape.circle,
                                          ),
                                          child: Image.asset(
                                            'assets/images/homepage_images/Circle.png',
                                            fit: BoxFit.cover,
                                          ),
                                        ),
                                      ),
                                      Expanded(
                                        child: Padding(
                                          padding:
                                          const EdgeInsetsDirectional.fromSTEB(
                                              12, 12, 12, 0),
                                          child: Column(
                                            mainAxisSize: MainAxisSize.max,
                                            crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                            children: [
                                              Text(
                                                'PHIẾU KHẢO SÁT PHỤ HUYNH HỌC SINH ĐẦU NĂM HỌC 2024 - 2025',
                                                style:
                                                FlutterFlowTheme.of(context)
                                                    .labelSmall
                                                    .override(
                                                  fontFamily:
                                                  'Plus Jakarta Sans',
                                                  color:
                                                  const Color(0xFF57636C),
                                                  fontSize: 14,
                                                  letterSpacing: 0.0,
                                                  fontWeight:
                                                  FontWeight.w800,
                                                ),
                                              ),
                                              Row(
                                                mainAxisSize: MainAxisSize.max,
                                                children: [
                                                  const FaIcon(
                                                    FontAwesomeIcons.calendar,
                                                    color: Color(0xFF0B2384),
                                                    size: 24,
                                                  ),
                                                  Expanded(
                                                    child: Padding(
                                                      padding:
                                                      const EdgeInsetsDirectional
                                                          .fromSTEB(
                                                          5, 0, 0, 0),
                                                      child: Text(
                                                        'Thời hạn: 21/10/2024',
                                                        style:
                                                        FlutterFlowTheme.of(
                                                            context)
                                                            .bodyMedium
                                                            .override(
                                                          fontFamily:
                                                          'Plus Jakarta Sans',
                                                          color: const Color(
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
                                                ],
                                              ),
                                              Align(
                                                alignment:
                                                const AlignmentDirectional(1, 0),
                                                child: Padding(
                                                  padding: const EdgeInsetsDirectional
                                                      .fromSTEB(16, 0, 0, 0),
                                                  child: FFButtonWidget(
                                                    onPressed: () {
                                                      Get.to(const SurveyInfoWidget());
                                                    },
                                                    text: 'Chưa làm',
                                                    options: FFButtonOptions(
                                                      width: 150,
                                                      height: 30,
                                                      padding:
                                                      const EdgeInsetsDirectional
                                                          .fromSTEB(
                                                          16, 0, 16, 0),

                                                      iconPadding:
                                                      const EdgeInsetsDirectional
                                                          .fromSTEB(
                                                          0, 0, 0, 0),
                                                      color: FlutterFlowTheme
                                                          .of(context)
                                                          .primaryBackground,
                                                      textStyle:
                                                      FlutterFlowTheme.of(
                                                          context)
                                                          .bodyMedium
                                                          .override(
                                                        fontFamily:
                                                        'Plus Jakarta Sans',
                                                        color:
                                                        FlutterFlowTheme.of(
                                                            context)
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
                                                            offset: const Offset(
                                                                2.0, 2.0),
                                                            blurRadius: 5.0,
                                                          )
                                                        ],
                                                      ),
                                                      elevation: 0,
                                                      borderRadius:
                                                      BorderRadius.circular(
                                                          16),
                                                    ),
                                                  ),
                                                ),
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
                                const EdgeInsetsDirectional.fromSTEB(0, 0, 0, 10),
                                child: Container(
                                  width: 100,
                                  height: 110,
                                  decoration: BoxDecoration(
                                    color: Colors.white,
                                    boxShadow: const [
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
                                        padding: const EdgeInsetsDirectional.fromSTEB(
                                            10, 0, 0, 0),
                                        child: Container(
                                          clipBehavior: Clip.antiAlias,
                                          decoration: const BoxDecoration(
                                            shape: BoxShape.circle,
                                          ),
                                          child: Image.asset(
                                            'assets/images/homepage_images/Circle.png',
                                            fit: BoxFit.cover,
                                          ),
                                        ),
                                      ),
                                      Expanded(
                                        child: Padding(
                                          padding:
                                          const EdgeInsetsDirectional.fromSTEB(
                                              12, 12, 12, 0),
                                          child: Column(
                                            mainAxisSize: MainAxisSize.max,
                                            crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                            children: [
                                              Text(
                                                'PHIẾU KHẢO SÁT PHỤ HUYNH HỌC SINH ĐẦU NĂM HỌC 2024 - 2025',
                                                style:
                                                FlutterFlowTheme.of(context)
                                                    .labelSmall
                                                    .override(
                                                  fontFamily:
                                                  'Plus Jakarta Sans',
                                                  color:
                                                  const Color(0xFF57636C),
                                                  fontSize: 14,
                                                  letterSpacing: 0.0,
                                                  fontWeight:
                                                  FontWeight.w800,
                                                ),
                                              ),
                                              Row(
                                                mainAxisSize: MainAxisSize.max,
                                                children: [
                                                  const FaIcon(
                                                    FontAwesomeIcons.calendar,
                                                    color: Color(0xFF0B2384),
                                                    size: 24,
                                                  ),
                                                  Expanded(
                                                    child: Padding(
                                                      padding:
                                                      const EdgeInsetsDirectional
                                                          .fromSTEB(
                                                          5, 0, 0, 0),
                                                      child: Text(
                                                        'Thời hạn: 21/10/2024',
                                                        style:
                                                        FlutterFlowTheme.of(
                                                            context)
                                                            .bodyMedium
                                                            .override(
                                                          fontFamily:
                                                          'Plus Jakarta Sans',
                                                          color: const Color(
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
                                                ],
                                              ),
                                              Align(
                                                alignment:
                                                const AlignmentDirectional(1, 0),
                                                child: Padding(
                                                  padding: const EdgeInsetsDirectional
                                                      .fromSTEB(16, 0, 0, 0),
                                                  child: FFButtonWidget(
                                                    onPressed: () {
                                                      Get.to(const SurveyInfoWidget());
                                                    },
                                                    text: 'Hết hạn',
                                                    options: FFButtonOptions(
                                                      width: 150,
                                                      height: 30,
                                                      padding:
                                                      const EdgeInsetsDirectional
                                                          .fromSTEB(
                                                          16, 0, 16, 0),

                                                      iconPadding:
                                                      const EdgeInsetsDirectional
                                                          .fromSTEB(
                                                          0, 0, 0, 0),
                                                      color: const Color(0x48F84F47),
                                                      textStyle:
                                                      FlutterFlowTheme.of(
                                                          context)
                                                          .bodyMedium
                                                          .override(
                                                        fontFamily:
                                                        'Plus Jakarta Sans',
                                                        color:
                                                        const Color(0xFFF90000),
                                                        fontSize: 14,
                                                        letterSpacing: 0.0,
                                                        fontWeight:
                                                        FontWeight.w800,
                                                        shadows: [
                                                          Shadow(
                                                            color: FlutterFlowTheme
                                                                .of(context)
                                                                .primary,
                                                            offset: const Offset(
                                                                2.0, 2.0),
                                                            blurRadius: 5.0,
                                                          )
                                                        ],
                                                      ),
                                                      elevation: 0,
                                                      borderRadius:
                                                      BorderRadius.circular(
                                                          16),
                                                    ),
                                                  ),
                                                ),
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
                                const EdgeInsetsDirectional.fromSTEB(0, 0, 0, 10),
                                child: Container(
                                  width: 100,
                                  height: 110,
                                  decoration: BoxDecoration(
                                    color: Colors.white,
                                    boxShadow: const [
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
                                        padding: const EdgeInsetsDirectional.fromSTEB(
                                            10, 0, 0, 0),
                                        child: Container(
                                          clipBehavior: Clip.antiAlias,
                                          decoration: const BoxDecoration(
                                            shape: BoxShape.circle,
                                          ),
                                          child: Image.asset(
                                            'assets/images/homepage_images/Circle.png',
                                            fit: BoxFit.cover,
                                          ),
                                        ),
                                      ),
                                      Expanded(
                                        child: Padding(
                                          padding:
                                          const EdgeInsetsDirectional.fromSTEB(
                                              12, 12, 12, 0),
                                          child: Column(
                                            mainAxisSize: MainAxisSize.max,
                                            crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                            children: [
                                              Text(
                                                'PHIẾU KHẢO SÁT PHỤ HUYNH HỌC SINH ĐẦU NĂM HỌC 2024 - 2025',
                                                style:
                                                FlutterFlowTheme.of(context)
                                                    .labelSmall
                                                    .override(
                                                  fontFamily:
                                                  'Plus Jakarta Sans',
                                                  color:
                                                  const Color(0xFF57636C),
                                                  fontSize: 14,
                                                  letterSpacing: 0.0,
                                                  fontWeight:
                                                  FontWeight.w800,
                                                ),
                                              ),
                                              Row(
                                                mainAxisSize: MainAxisSize.max,
                                                children: [
                                                  const FaIcon(
                                                    FontAwesomeIcons.calendar,
                                                    color: Color(0xFF0B2384),
                                                    size: 24,
                                                  ),
                                                  Expanded(
                                                    child: Padding(
                                                      padding:
                                                      const EdgeInsetsDirectional
                                                          .fromSTEB(
                                                          5, 0, 0, 0),
                                                      child: Text(
                                                        'Thời hạn: 21/10/2024',
                                                        style:
                                                        FlutterFlowTheme.of(
                                                            context)
                                                            .bodyMedium
                                                            .override(
                                                          fontFamily:
                                                          'Plus Jakarta Sans',
                                                          color: const Color(
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
                                                ],
                                              ),
                                              Align(
                                                alignment:
                                                const AlignmentDirectional(1, 0),
                                                child: Padding(
                                                  padding: const EdgeInsetsDirectional
                                                      .fromSTEB(16, 0, 0, 0),
                                                  child: FFButtonWidget(
                                                    onPressed: () {
                                                      Get.to(const SurveyInfoWidget());
                                                    },
                                                    text: 'Đã hoàn thành',
                                                    options: FFButtonOptions(
                                                      width: 150,
                                                      height: 30,
                                                      padding:
                                                      const EdgeInsetsDirectional
                                                          .fromSTEB(
                                                          16, 0, 16, 0),

                                                      iconPadding:
                                                      const EdgeInsetsDirectional
                                                          .fromSTEB(
                                                          0, 0, 0, 0),
                                                      color:
                                                      FlutterFlowTheme.of(
                                                          context)
                                                          .accent2,
                                                      textStyle:
                                                      FlutterFlowTheme.of(
                                                          context)
                                                          .bodyMedium
                                                          .override(
                                                        fontFamily:
                                                        'Plus Jakarta Sans',
                                                        color:
                                                        FlutterFlowTheme.of(
                                                            context)
                                                            .success,
                                                        fontSize: 14,
                                                        letterSpacing: 0.0,
                                                        fontWeight:
                                                        FontWeight.w800,
                                                        shadows: [
                                                          Shadow(
                                                            color: FlutterFlowTheme
                                                                .of(context)
                                                                .primary,
                                                            offset: const Offset(
                                                                2.0, 2.0),
                                                            blurRadius: 5.0,
                                                          )
                                                        ],
                                                      ),
                                                      elevation: 0,
                                                      borderRadius:
                                                      BorderRadius.circular(
                                                          16),
                                                    ),
                                                  ),
                                                ),
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
                alignment: const AlignmentDirectional(0, 1),
                child: wrapWithModel(
                  model: _model.navigationBarBottomModel,
                  updateCallback: () => safeSetState(() {}),
                  child: const NavigationBarBottomWidget(),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

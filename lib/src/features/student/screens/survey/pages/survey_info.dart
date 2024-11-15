import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_radio_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/form_field_controller.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

import 'survey_info_model.dart';
export 'survey_info_model.dart';

class SurveyInfoWidget extends StatefulWidget {
  const SurveyInfoWidget({super.key});

  @override
  State<SurveyInfoWidget> createState() => _SurveyInfoWidgetState();
}

class _SurveyInfoWidgetState extends State<SurveyInfoWidget> {
  late SurveyInfoModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => SurveyInfoModel());
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
                        'Câu hỏi khảo sát',
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
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(0, 6, 0, 0),
                child: Container(
                  width: 360,
                  height: 550,
                  decoration: BoxDecoration(
                    color: FlutterFlowTheme.of(context).secondaryBackground,
                    boxShadow: [
                      BoxShadow(
                        blurRadius: 4,
                        color: FlutterFlowTheme.of(context).secondaryText,
                        offset: Offset(
                          2,
                          2,
                        ),
                      )
                    ],
                    borderRadius: BorderRadius.circular(16),
                  ),
                  child: Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(5, 5, 5, 5),
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        RichText(
                          textScaler: MediaQuery.of(context).textScaler,
                          text: TextSpan(
                            children: [
                              TextSpan(
                                text:
                                'KHẢO SÁT MỨC ĐỘ HÀI LÒNG VỚI DỊCH VỤ NHÀ TRƯỜNG \n',
                                style: FlutterFlowTheme.of(context)
                                    .bodyMedium
                                    .override(
                                  fontFamily: 'Inter',
                                  color: Color(0xFF416FAE),
                                  fontSize: 16,
                                  letterSpacing: 0.0,
                                  fontWeight: FontWeight.w800,
                                ),
                              ),
                              TextSpan(
                                text: 'I. TỔNG QUAN\n',
                                style: TextStyle(
                                  color: Color(0xFF416FAE),
                                  fontWeight: FontWeight.w900,
                                ),
                              ),
                              TextSpan(
                                text:
                                '(Quý phụ huynh vui lòng tích vào điểm số lựa chọn. Điềm càng cao, mức độ đồng ý càng tăng)\n',
                                style: TextStyle(
                                  color: FlutterFlowTheme.of(context)
                                      .secondaryText,
                                  fontWeight: FontWeight.w900,
                                ),
                              ),
                              TextSpan(
                                text:
                                'Tôi hài lòng với việc lựa chọn Vinschool là trường học cho con  ',
                                style: TextStyle(),
                              ),
                              TextSpan(
                                text: '(* bắt buộc)',
                                style: TextStyle(
                                  color: FlutterFlowTheme.of(context).error,
                                  fontWeight: FontWeight.w800,
                                ),
                              )
                            ],
                            style: FlutterFlowTheme.of(context)
                                .bodyMedium
                                .override(
                              fontFamily: 'Inter',
                              letterSpacing: 0.0,
                              lineHeight: 1.5,
                            ),
                          ),
                          textAlign: TextAlign.justify,
                        ),
                        Align(
                          alignment: AlignmentDirectional(-1, 0),
                          child: FlutterFlowRadioButton(
                            options: [
                              '10 - Hoàn toàn đồng ý',
                              '9',
                              '8',
                              '7',
                              '6',
                              '5',
                              '4',
                              '3',
                              '2',
                              '1 - Hoàn toàn không đồng ý'
                            ].toList(),
                            onChanged: (val) => safeSetState(() {}),
                            controller: _model.radioButtonValueController ??=
                                FormFieldController<String>(null),
                            optionHeight: 32,
                            textStyle: FlutterFlowTheme.of(context)
                                .labelMedium
                                .override(
                              fontFamily: 'Inter',
                              letterSpacing: 0.0,
                            ),
                            selectedTextStyle: FlutterFlowTheme.of(context)
                                .bodyMedium
                                .override(
                              fontFamily: 'Inter',
                              letterSpacing: 0.0,
                            ),
                            buttonPosition: RadioButtonPosition.left,
                            direction: Axis.vertical,
                            radioButtonColor:
                            FlutterFlowTheme.of(context).primary,
                            inactiveRadioButtonColor:
                            FlutterFlowTheme.of(context).secondaryText,
                            toggleable: false,
                            horizontalAlignment: WrapAlignment.start,
                            verticalAlignment: WrapCrossAlignment.start,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              Align(
                alignment: AlignmentDirectional(-1, 1),
                child: Container(
                  width: 360,
                  height: 100,
                  decoration: BoxDecoration(
                    color: FlutterFlowTheme.of(context).secondaryBackground,
                    boxShadow: [
                      BoxShadow(
                        blurRadius: 4,
                        color: FlutterFlowTheme.of(context).secondaryText,
                        offset: Offset(
                          2,
                          2,
                        ),
                      )
                    ],
                    borderRadius: BorderRadius.circular(16),
                  ),
                  child: Align(
                    alignment: AlignmentDirectional(0, 0),
                    child: Row(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Align(
                          alignment: AlignmentDirectional(-1, 0),
                          child: Padding(
                            padding:
                            EdgeInsetsDirectional.fromSTEB(40, 0, 0, 0),
                            child: FFButtonWidget(
                              onPressed: () {
                                print('Button pressed ...');
                              },
                              text: 'Quay lại',
                              options: FFButtonOptions(
                                width: 120,
                                height: 50,
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    16, 0, 16, 0),
                                iconPadding:
                                EdgeInsetsDirectional.fromSTEB(0, 0, 0, 0),
                                color: Color(0xFFADE8F4),
                                textStyle: FlutterFlowTheme.of(context)
                                    .titleMedium
                                    .override(
                                  fontFamily: 'Inter Tight',
                                  color: Color(0xFF12524D),
                                  letterSpacing: 0.0,
                                  fontWeight: FontWeight.w800,
                                ),
                                elevation: 0,
                                borderRadius: BorderRadius.circular(16),
                              ),
                            ),
                          ),
                        ),
                        Align(
                          alignment: AlignmentDirectional(1, 0),
                          child: Padding(
                            padding:
                            EdgeInsetsDirectional.fromSTEB(40, 0, 0, 0),
                            child: FFButtonWidget(
                              onPressed: () {
                                print('Button pressed ...');
                              },
                              text: 'Gửi',
                              options: FFButtonOptions(
                                width: 120,
                                height: 50,
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    16, 0, 16, 0),
                                iconPadding:
                                EdgeInsetsDirectional.fromSTEB(0, 0, 0, 0),
                                color: Color(0xFF0096C7),
                                textStyle: FlutterFlowTheme.of(context)
                                    .titleMedium
                                    .override(
                                  fontFamily: 'Inter Tight',
                                  color: FlutterFlowTheme.of(context)
                                      .primaryBackground,
                                  letterSpacing: 0.0,
                                  fontWeight: FontWeight.w800,
                                ),
                                elevation: 0,
                                borderRadius: BorderRadius.circular(16),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

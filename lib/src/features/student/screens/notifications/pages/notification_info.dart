import 'package:get/get.dart';
import 'package:kindergarten_app/src/constants/sizes.dart';
import 'package:kindergarten_app/src/features/student/controllers/thong_bao/notifications_controller.dart';
import 'package:kindergarten_app/src/features/student/screens/student_information/screen/student_information_screen.dart';
import 'package:kindergarten_app/src/repository/account_repository/account_repository.dart';

import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'notification_info_model.dart';
export 'notification_info_model.dart';

class NotificationInfoWidget extends StatefulWidget {
  const NotificationInfoWidget({super.key});

  @override
  State<NotificationInfoWidget> createState() => _NotificationInfoWidgetState();
}

class _NotificationInfoWidgetState extends State<NotificationInfoWidget> {
  late NotificationInfoModel _model;


  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => NotificationInfoModel());
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final accountRepo = Get.put(AccountRepository());
    final notificationController= Get.put(NotificationsController());
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
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
                        accountRepo.fullName,
                        style: FlutterFlowTheme.of(context).bodyLarge.override(
                          fontFamily: 'Inter',
                          color: const Color(0xFFCAF0F8),
                          letterSpacing: 0.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    GestureDetector(
                      onTap: (){
                        Get.to(const ThongTinHocSinhScreen());
                      },
                      child: Align(
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
                    ),
                    Align(
                      alignment: const AlignmentDirectional(0.55, 0.16),
                      child: FlutterFlowIconButton(
                        borderColor: Colors.transparent,
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
                padding: const EdgeInsetsDirectional.fromSTEB(0, 0, 0, 7),
                child: Container(
                  height: t10Size*7.5,
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
                      const Align(
                        alignment: Alignment.topCenter,
                        child: Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(4, 0, 0, 0),
                          child: FaIcon(
                            FontAwesomeIcons.calendar,
                            color: Color(0xFFF9BD3A),
                            size: 20,
                          ),
                        ),
                      ),
                      Expanded(
                        child: Padding(
                          padding: const EdgeInsetsDirectional.fromSTEB(12, 0, 12, 0),
                          child: Column(
                            mainAxisSize: MainAxisSize.max,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Padding(
                                padding:
                                const EdgeInsetsDirectional.fromSTEB(0, 0, 0, 2),
                                child: Text(
                                  notificationController.notification.title,
                                  style: FlutterFlowTheme.of(context)
                                      .labelSmall
                                      .override(
                                    fontFamily: 'Plus Jakarta Sans',
                                    color: const Color(0xFF57636C),
                                    fontSize: 15,
                                    letterSpacing: 0.0,
                                    fontWeight: FontWeight.w800,
                                  ),
                                ),
                              ),
                              Text(
                                notificationController.notification.dateSent,
                                style: FlutterFlowTheme.of(context)
                                    .bodyMedium
                                    .override(
                                  fontFamily: 'Plus Jakarta Sans',
                                  color: const Color(0xFF14181B),
                                  fontSize: 13,
                                  letterSpacing: 0.0,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                              Text(
                                'Người gửi: ${notificationController.teacher.firstName} '
                                    '${notificationController.teacher.lastName}',
                                style: FlutterFlowTheme.of(context)
                                    .bodyMedium
                                    .override(
                                  fontFamily: 'Inter',
                                  color: FlutterFlowTheme.of(context)
                                      .secondaryText,
                                  fontSize: 14,
                                  letterSpacing: 0.0,
                                  fontWeight: FontWeight.w500,
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
              GestureDetector(
                onTap: ()=>Get.back(),
                child: Align(
                  alignment: const AlignmentDirectional(0, 1),
                  child: Padding(
                    padding: const EdgeInsetsDirectional.fromSTEB(0, 0, 0, 25),
                    child: FFButtonWidget(
                      onPressed: () {
                        Get.back();
                      },
                      text: 'Quay lại trang trước',
                      options: FFButtonOptions(
                        width: t100Size*2,
                        height: t30Size,
                        padding: const EdgeInsetsDirectional.fromSTEB(16, 0, 16, 0),
                        iconPadding: const EdgeInsetsDirectional.fromSTEB(0, 0, 0, 0),
                        color: const Color(0xFF03045E),
                        textStyle:
                        FlutterFlowTheme.of(context).titleSmall.override(
                          fontFamily: 'Inter Tight',
                          color: Colors.white,
                          letterSpacing: 0.0,
                          shadows: [
                            Shadow(
                              color: FlutterFlowTheme.of(context).secondaryText,
                              offset: const Offset(3.0, 2.0),
                              blurRadius: 2.0,
                            )
                          ],
                        ),
                        elevation: 0,
                        borderRadius: BorderRadius.circular(24),
                      ),
                    ),
                  ),
                ),
              ),
              Align(
                alignment: const AlignmentDirectional(0, -0.2),
                child: Container(
                  width: t100Size*2.3,
                  height: t100Size*3,
                  decoration: BoxDecoration(
                    color: const Color(0x0B313131),
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
                  ),
                  child: Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(t10Size, t10Size, t10Size, t10Size),
                    child: Text(
                      notificationController.notification.message,
                      style: FlutterFlowTheme.of(context).bodyMedium.override(
                        fontFamily: 'Inter',
                        color: FlutterFlowTheme.of(context).primary,
                        fontSize: 14,
                        letterSpacing: 0.0,
                        fontWeight: FontWeight.w500,
                      ),
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

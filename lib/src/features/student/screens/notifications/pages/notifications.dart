import 'package:get/get.dart';
import 'package:kindergarten_app/src/constants/sizes.dart';
import 'package:kindergarten_app/src/features/student/controllers/thong_bao/notifications_controller.dart';
import 'package:kindergarten_app/src/features/student/screens/notifications/pages/notification_info.dart';
import 'package:kindergarten_app/src/repository/teacher_repository/teacher_repository.dart';

import '../../../../../repository/account_repository/account_repository.dart';
import '../../../models/notifications/notifications_model.dart';
import '../../student_information/screen/student_information_screen.dart';
import '../components/NavigationBarBottom/navigation_bar_bottom_widget.dart';
import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'notifications_model.dart';
export 'notifications_model.dart';

class NotificationsWidget extends StatefulWidget {
  const NotificationsWidget({super.key});

  @override
  State<NotificationsWidget> createState() => _NotificationsWidgetState();
}

class _NotificationsWidgetState extends State<NotificationsWidget>
    with TickerProviderStateMixin {
  late NotificationsPageModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  final animationsMap = <String, AnimationInfo>{};

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => NotificationsPageModel());

    _model.textController ??= TextEditingController();
    _model.textFieldFocusNode ??= FocusNode();

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
    final accountRepo = Get.put(AccountRepository());
    final notificationController = Get.put(NotificationsController());
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
                          Get.to(const ThongTinHocSinhScreen());
                        },
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          bottom: PreferredSize(
            preferredSize: Size.fromHeight(t10Size*7),
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
                  padding: const EdgeInsets.all(12),
                  child: TextFormField(
                    controller: _model.textController,
                    focusNode: _model.textFieldFocusNode,
                    autofocus: true,
                    obscureText: false,
                    decoration: InputDecoration(
                      labelText: 'Tìm kiếm',
                      labelStyle:
                      FlutterFlowTheme.of(context).labelMedium.override(
                        fontFamily: 'Plus Jakarta Sans',
                        color: const Color(0xFF57636C),
                        fontSize: 14,
                        letterSpacing: 0.0,
                        fontWeight: FontWeight.w600,
                      ),
                      alignLabelWithHint: false,
                      hintStyle:
                      FlutterFlowTheme.of(context).labelMedium.override(
                        fontFamily: 'Plus Jakarta Sans',
                        color: const Color(0xFF57636C),
                        fontSize: 14,
                        letterSpacing: 0.0,
                        fontWeight: FontWeight.w500,
                      ),
                      enabledBorder: UnderlineInputBorder(
                        borderSide: const BorderSide(
                          color: Color(0xFFE0E3E7),
                          width: 2,
                        ),
                        borderRadius: BorderRadius.circular(16),
                      ),
                      focusedBorder: UnderlineInputBorder(
                        borderSide: const BorderSide(
                          color: Color(0xFF4B39EF),
                          width: 2,
                        ),
                        borderRadius: BorderRadius.circular(16),
                      ),
                      errorBorder: UnderlineInputBorder(
                        borderSide: const BorderSide(
                          color: Color(0xFFFF5963),
                          width: 2,
                        ),
                        borderRadius: BorderRadius.circular(16),
                      ),
                      focusedErrorBorder: UnderlineInputBorder(
                        borderSide: const BorderSide(
                          color: Color(0xFFFF5963),
                          width: 2,
                        ),
                        borderRadius: BorderRadius.circular(16),
                      ),
                      filled: true,
                      contentPadding:
                      const EdgeInsetsDirectional.fromSTEB(16, 0, 0, 0),
                      prefixIcon: const Icon(
                        Icons.list_rounded,
                        size: 28,
                      ),
                      suffixIcon: const Icon(
                        Icons.search_rounded,
                        size: 28,
                      ),
                    ),
                    style: FlutterFlowTheme.of(context).bodyMedium.override(
                      fontFamily: 'Plus Jakarta Sans',
                      color: const Color(0xFF14181B),
                      fontSize: 14,
                      letterSpacing: 0.0,
                      fontWeight: FontWeight.w500,
                    ),
                    textAlign: TextAlign.start,
                    validator:
                    _model.textControllerValidator.asValidator(context),
                  ),
                ),
              ),
              Align(
                alignment: const AlignmentDirectional(-1, -0.65),
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
                          FutureBuilder(
                            future: notificationController.getNotificationsListData(),
                            builder: (context, snapshot){
                              if (snapshot.connectionState == ConnectionState.waiting){
                                return const Center(child: CircularProgressIndicator());
                              }
                              else if (snapshot.hasError) {
                                return Center(child: Text('Error: ${snapshot.error}'));
                              }
                              else if (!snapshot.hasData || snapshot.data!.isEmpty) {
                                return const Center(child: Text('Không có dữ liệu.'));
                              }
                              else{
                                final notifications = snapshot.data!;
                                return Expanded(
                                  child: ListView.builder(
                                    itemCount: notifications.length,
                                    padding: EdgeInsets.zero,
                                    reverse: true,
                                    shrinkWrap: true,
                                    scrollDirection: Axis.vertical,
                                    itemBuilder: (context, index){
                                      final notification = notifications[index];
                                      notificationController.notification = notification;
                                      return GestureDetector(
                                        onTap: () async {
                                          final teacherRepo = Get.put(TeacherRepository());
                                          notificationController.teacher = (await teacherRepo.getTeacherById(
                                            notification.sentBy
                                          ))!;
                                          Get.to(const NotificationInfoWidget());
                                        },
                                        child: NotificationItem(
                                          notification: notification
                                        ),
                                      );
                                    }
                                  ),
                                );
                              }
                            },

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

class NotificationItem extends StatelessWidget {
  const NotificationItem({
    super.key, required this.notification,
  });
  final NotificationsModel notification;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:
      const EdgeInsetsDirectional.fromSTEB(0, 0, 0, 7),
      child: Container(
        height: t60Size,
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
            const Padding(
              padding: EdgeInsetsDirectional.fromSTEB(
                  4, 0, 0, 0),
              child: FaIcon(
                FontAwesomeIcons.calendar,
                color: Color(0xFFF9BD3A),
                size: 20,
              ),
            ),
            Expanded(
              child: Padding(
                padding:
                const EdgeInsetsDirectional.fromSTEB(
                    12, 0, 12, 0),
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  crossAxisAlignment:
                  CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsetsDirectional
                          .fromSTEB(0, 0, 0, 2),
                      child: Text(
                        notification.title,
                        style: FlutterFlowTheme.of(
                            context)
                            .labelSmall
                            .override(
                          fontFamily:
                          'Plus Jakarta Sans',
                          color:
                          const Color(0xFF57636C),
                          fontSize: 13,
                          letterSpacing: 0.0,
                          fontWeight:
                          FontWeight.w800,
                        ),
                      ),
                    ),
                    Row(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Expanded(
                          child: Text(
                            notification.dateSent,
                            style: FlutterFlowTheme
                                .of(context)
                                .bodyMedium
                                .override(
                              fontFamily:
                              'Plus Jakarta Sans',
                              color: const Color(
                                  0xFF14181B),
                              fontSize: 11.5,
                              letterSpacing: 0.0,
                              fontWeight:
                              FontWeight.w500,
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
    );
  }
}

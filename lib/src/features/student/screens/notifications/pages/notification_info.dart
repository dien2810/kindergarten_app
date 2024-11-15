import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

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
                      alignment: AlignmentDirectional(-0.84, 0.14),
                      child: Container(
                        clipBehavior: Clip.antiAlias,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                        ),
                        child: Image.asset(
                          'assets/images/homepage_images/Group_25.png',
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    Align(
                      alignment: AlignmentDirectional(0.06, -0.24),
                      child: Text(
                        'Nguyễn Văn Thành',
                        style: FlutterFlowTheme.of(context).bodyLarge.override(
                          fontFamily: 'Inter',
                          color: Color(0xFFCAF0F8),
                          letterSpacing: 0.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    Align(
                      alignment: AlignmentDirectional(0.04, 0.12),
                      child: Text(
                        'Thông tin học sinh',
                        style: FlutterFlowTheme.of(context).bodyMedium.override(
                          fontFamily: 'Inter',
                          color: Color(0xFFCAF0F8),
                          letterSpacing: 0.0,
                          fontWeight: FontWeight.w600,
                          decoration: TextDecoration.underline,
                        ),
                      ),
                    ),
                    Align(
                      alignment: AlignmentDirectional(0.55, 0.16),
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
                padding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 7),
                child: Container(
                  height: 64,
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
                        padding: EdgeInsetsDirectional.fromSTEB(4, 0, 0, 0),
                        child: FaIcon(
                          FontAwesomeIcons.calendar,
                          color: Color(0xFFF9BD3A),
                          size: 20,
                        ),
                      ),
                      Expanded(
                        child: Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(12, 0, 12, 0),
                          child: Column(
                            mainAxisSize: MainAxisSize.max,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Padding(
                                padding:
                                EdgeInsetsDirectional.fromSTEB(0, 0, 0, 2),
                                child: Text(
                                  'Khởi động Cuộc thi Innovation Challenge năm học 2024 - 2025',
                                  style: FlutterFlowTheme.of(context)
                                      .labelSmall
                                      .override(
                                    fontFamily: 'Plus Jakarta Sans',
                                    color: Color(0xFF57636C),
                                    fontSize: 13,
                                    letterSpacing: 0.0,
                                    fontWeight: FontWeight.w800,
                                  ),
                                ),
                              ),
                              Expanded(
                                child: Text(
                                  '14/03/2024',
                                  style: FlutterFlowTheme.of(context)
                                      .bodyMedium
                                      .override(
                                    fontFamily: 'Plus Jakarta Sans',
                                    color: Color(0xFF14181B),
                                    fontSize: 11.5,
                                    letterSpacing: 0.0,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                              ),
                              Text(
                                'Người gửi: Nguyễn Thị Thu Hoa',
                                style: FlutterFlowTheme.of(context)
                                    .bodyMedium
                                    .override(
                                  fontFamily: 'Inter',
                                  color: FlutterFlowTheme.of(context)
                                      .secondaryText,
                                  fontSize: 11.5,
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
              Align(
                alignment: AlignmentDirectional(0, 1),
                child: Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 25),
                  child: FFButtonWidget(
                    onPressed: () {
                      print('Button pressed ...');
                    },
                    text: 'Quay lại trang trước',
                    options: FFButtonOptions(
                      width: 250,
                      height: 50,
                      padding: EdgeInsetsDirectional.fromSTEB(16, 0, 16, 0),
                      iconPadding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 0),
                      color: Color(0xFF03045E),
                      textStyle:
                      FlutterFlowTheme.of(context).titleSmall.override(
                        fontFamily: 'Inter Tight',
                        color: Colors.white,
                        letterSpacing: 0.0,
                        shadows: [
                          Shadow(
                            color: FlutterFlowTheme.of(context).secondaryText,
                            offset: Offset(3.0, 2.0),
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
              Align(
                alignment: AlignmentDirectional(0, -0.2),
                child: Container(
                  width: 330,
                  height: 500,
                  decoration: BoxDecoration(
                    color: Color(0x0B313131),
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
                  ),
                  child: Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(8, 8, 8, 8),
                    child: Text(
                      '     Cuộc thi Innovation Challenge năm học 2024 - 2025 là một hoạt động quan trọng nhằm khuyến khích học sinh Vinschool tham gia nghiên cứu và sáng tạo Khoa học – Kỹ thuật, góp phần vận dụng những kiến thức đã học vào việc giải quyết những vấn đề thực tiễn và đồng thời phát triển năng lực toàn diện cho các em học sinh.\n\nĐỐI TƯỢNG THAM GIA\n     Tất cả học sinh từ lớp 6 – 12 trên toàn Hệ thống Vinschool và học sinh bên ngoài hệ thống có nguyện vọng mong muốn tham gia.\n     Học sinh Vinschool và ngoài Vinschool đăng kí dự thi với giáo viên hoặc Ban giám hiệu cơ sở.\n    Mỗi dự án tối đa 05 HS tham gia.\n\nLĨNH VỰC DỰ THI\n     Dự án nghiên cứu có thể nằm trong 22 lĩnh vực thuộc 3 chủ đề: Khoa học tự nhiên, Công nghệ – Kĩ thuật – IT, Khoa học xã hội và hành vi.\n\nYÊU CẦU\n     Đảm bảo tính trung thực trong NCKH: không gian lận, sao chép trái phép, giả mạo, sử dụng hay trình bày nội dung, kết quả nghiên cứu của người khác như là của mình.',
                      style: FlutterFlowTheme.of(context).bodyMedium.override(
                        fontFamily: 'Inter',
                        color: FlutterFlowTheme.of(context).primary,
                        fontSize: 13.5,
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

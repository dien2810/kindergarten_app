import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kindergarten_app/src/constants/text_strings.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../../../../../../flutter_flow/flutter_flow_theme.dart';
import '../../../../../common_widgets/app_bar_widgets/guardian_app_bar_with_title.dart';
import '../../../controllers/comments/comments_controller.dart';
import '../../../models/comment/comment_info.dart';
import 'comment_detail_screen.dart';

class CommentsScreen extends StatelessWidget {
  final CommentsController commentsController = Get.put(CommentsController());

  CommentsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: commentsController.fetchComments(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting){
          return const Center(child: CircularProgressIndicator());
        }
        else if (snapshot.hasError) {
          return Center(child: Text('Error: ${snapshot.error}'));
        }
        if (commentsController.comments.isEmpty){
          return const Scaffold(
            appBar: GuardianAppBarWithTitleWidget(title: tNhanXet),
            body: Center(
                child: Text('Không có nhận xét nào.')
            ),
          );
        }
        return Scaffold(
          appBar: const GuardianAppBarWithTitleWidget(title: tNhanXet),
          body: ListView.builder(
              itemCount: commentsController.comments.length,
              itemBuilder: (context, index) {
                CommentInfo commentInfo = commentsController.comments[index];
                return  FutureBuilder(
                  future: commentsController.getTeacherNameById(commentInfo.teacherID),
                  builder: (context, snapshot) {
                    String teacherName = snapshot.data ?? 'Không rõ';
                    return _buildCommentCard(index, commentInfo, teacherName, context);
                  }
                );
              },
          )
        );
      }
    );
  }

  Widget _buildCommentCard(int index, CommentInfo commentInfo, String teacherName, BuildContext context) {
    return Padding(
      padding: const EdgeInsetsDirectional.fromSTEB(12, 12, 12, 0),
      child: InkWell(
        onTap: () {
          Get.to(() => CommentDetailScreen(commentInfo: commentInfo, index: index));
        },
        child: Row(
          children: [
            Container(
              width: 5,
              height: 120,  // Tăng chiều cao của thẻ nhận xét
              color: const Color(0xFF2058E9), // Thanh dọc màu xanh
            ),
            Expanded(
              child: Card(
                elevation: 4,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Giáo viên: $teacherName',  // Hiển thị tên giáo viên
                        style: FlutterFlowTheme.of(context)
                            .labelSmall
                            .override(
                          fontFamily: 'Plus Jakarta Sans',
                          color: const Color(0xFF57636C),
                          fontSize: 16,
                          letterSpacing: 0.0,
                          fontWeight: FontWeight.w800,
                        ),
                      ),
                      const SizedBox(height: 30),
                      Row(
                        children: [
                          const Icon(
                            FontAwesomeIcons.calendarAlt,
                            color: Color(0xFF0B2384),
                            size: 16,
                          ),
                          const SizedBox(width: 5),
                          Text(
                            commentInfo.commentDate,  // Hiển thị ngày nhận xét
                            style: FlutterFlowTheme.of(context)
                                .bodyMedium
                                .override(
                              fontFamily: 'Plus Jakarta Sans',
                              color: const Color(0xFF14181B),
                              fontSize: 14,
                              letterSpacing: 0.0,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          const SizedBox(height: 30),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

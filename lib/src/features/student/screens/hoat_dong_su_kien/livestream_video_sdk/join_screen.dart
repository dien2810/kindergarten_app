import 'package:flutter/material.dart';
import '../../../../../common_widgets/app_bar_widgets/teacher_app_bar_with_title_header_2.dart';
import '../../../../../constants/sizes.dart';
import '../../../../../constants/text_strings.dart';
import 'api_call.dart';
import 'ils_screen.dart';
import 'package:videosdk/videosdk.dart';

class JoinScreen extends StatelessWidget {
  final _meetingIdController = TextEditingController();

  JoinScreen({super.key});

  //Creates new Meeting Id and joins it in CONFERNCE mode.
  void onCreateButtonPressed(BuildContext context) async {
    // call api to create meeting and navigate to ILSScreen with meetingId,token and mode
    await createMeeting().then((meetingId) {
      if (!context.mounted) return;
      Navigator.of(context).push(
        MaterialPageRoute(
          builder: (context) => ILSScreen(
            meetingId: meetingId,
            token: token,
            mode: Mode.CONFERENCE,
          ),
        ),
      );
    });
  }

  //Join the provided meeting with given Mode and meetingId
  void onJoinButtonPressed(BuildContext context, Mode mode) {
    // check meeting id is not null or invaild
    // if meeting id is vaild then navigate to ILSScreen with meetingId, token and mode
    String meetingId = _meetingIdController.text;
    var re = RegExp("\\w{4}\\-\\w{4}\\-\\w{4}");
    if (meetingId.isNotEmpty && re.hasMatch(meetingId)) {
      _meetingIdController.clear();
      Navigator.of(context).push(
        MaterialPageRoute(
          builder: (context) => ILSScreen(
            meetingId: meetingId,
            token: token,
            mode: mode,
          ),
        ),
      );
    } else {
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
        content: Text("Vui lòng nhập mã hợp lệ! Mã có dạng a1a1-a1a1-a1a1"),
      ));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: const TeacherAppBarWithTitleHeader2(title: tHoatDongSuKien),
      body: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            //Creating a new meeting
            ElevatedButton(
              onPressed: () => onCreateButtonPressed(context),
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.blue
              ),
              child: const Text(
                'Taọ cuộc họp',
                style: TextStyle(
                  color: Colors.white
                ),
              ),
            ),
            const SizedBox(height: 40),
            TextField(
              style: const TextStyle(color: Colors.white),
              decoration: const InputDecoration(
                filled: true,
                fillColor: Colors.white,
                hintText: 'Nhập mã cuộc họp',
                border: OutlineInputBorder(),
                hintStyle: TextStyle(color: Colors.black),
              ),
              controller: _meetingIdController,
            ),
            SizedBox(height: t10Size,),
            //Joining the meeting as host
            ElevatedButton(
              onPressed: () => onJoinButtonPressed(context, Mode.CONFERENCE),
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.cyan
              ),
              child: const Text('Join Meeting as Host', style: TextStyle(
    color: Colors.white
    ),),
            ),
            //Joining the meeting as viewer
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.cyan
              ),
              onPressed: () => onJoinButtonPressed(context, Mode.VIEWER),
              child: const Text('Join Meeting as Viewer', style: TextStyle(
                  color: Colors.white
              ),),
            ),
          ],
        ),
      ),
    );
  }
}
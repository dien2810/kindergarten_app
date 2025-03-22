import 'package:cloudinary_flutter/video/cld_video_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:kindergarten_app/src/constants/sizes.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';
import 'package:video_player/video_player.dart';

class VideoScreen extends StatefulWidget {
  final String videoLink;

  VideoScreen({super.key, this.videoLink='https://www.youtube.com/watch?v=X0wxLzTe5rE'});

  @override
  _VideoScreenState createState() => _VideoScreenState();
}

class _VideoScreenState extends State<VideoScreen> {
  late YoutubePlayerController _youtubeController;
  late VideoPlayerController _videoPlayerController;
  bool isYoutube = false;
  bool _isError = false;

  @override
  void initState() {
    super.initState();
    // Thiết lập chế độ toàn màn hình
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersive);

    _initializeVideo();
  }

  Future<void> _initializeVideo() async {
    try {
      print('URLLLLLLLLLLLLLLL');
      print(widget.videoLink);
      if (widget.videoLink.contains('youtube.com') ||
          widget.videoLink.contains('youtu.be')) {
        isYoutube = true;
        String? videoId = YoutubePlayer.convertUrlToId(widget.videoLink);
        if (videoId != null) {
          _youtubeController = YoutubePlayerController(
            initialVideoId: videoId,
            flags: const YoutubePlayerFlags(autoPlay: false, mute: false),
          )..addListener(() {
              setState(() {});
            });
        } else {
          setState(() {
            _isError = true;
          });
          print('Invalid YouTube URL');
        }
      } else {
        _videoPlayerController = CldVideoController(publicId: widget.videoLink)
          ..initialize().then((_) {
            // Ensure the first frame is shown after the video is initialized, even before the play button has been pressed.
            setState(() {});
          });
        // _videoPlayerController = VideoPlayerController.networkUrl(Uri.parse(widget.videoLink))
        //   ..initialize().then((_) {
        //     setState(() {});
        //   });
      }
    } catch (e) {
      setState(() {
        _isError = true;
      });
      print('Error initializing video: $e');
    }
  }

  @override
  void dispose() {
    if (isYoutube) {
      _youtubeController.dispose();
    } else {
      _videoPlayerController.dispose();
    }
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.edgeToEdge);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          toolbarHeight: t80Size, // điều chỉnh độ cao header
          flexibleSpace: Container(color: Colors.transparent),
          leading: Padding(
            padding: const EdgeInsets.only(
                top: 50.0), // Điều chỉnh vị trí nút quay lại
            child: IconButton(
              icon: const Icon(Icons.arrow_back),
              onPressed: () {
                Navigator.pop(context); // Quay lại trang trước
              },
            ),
          ),
          title: const Padding(
            padding: EdgeInsets.only(top: 50.0), // Hạ tiêu đề xuống 20px
            child: Text(
              'Video Hoạt Động',
              style: TextStyle(
                color: Color(0xFFD74971), // Set color to D74971
                fontSize: 25, // Increase font size
                fontWeight: FontWeight.bold, // Make the text bold
              ),
            ),
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.only(top: 40.0),
          child: SingleChildScrollView(
            child: Center(
              child: _isError
                  ? const Text(
                      'Video không thể phát được. Vui lòng kiểm tra lại đường dẫn video.')
                  : isYoutube
                      ? Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            AspectRatio(
                              aspectRatio: 16 / 9,
                              child:
                                  YoutubePlayer(controller: _youtubeController),
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                IconButton(
                                  icon: const Icon(Icons.fast_rewind),
                                  onPressed: () {
                                    _youtubeController.seekTo(Duration(
                                        seconds: _youtubeController
                                                .value.position.inSeconds -
                                            10));
                                  },
                                ),
                                IconButton(
                                  icon: Icon(
                                    _youtubeController.value.isPlaying
                                        ? Icons.pause_circle
                                        : Icons.play_arrow,
                                  ),
                                  onPressed: () {
                                    if (_youtubeController.value.isPlaying) {
                                      _youtubeController.pause();
                                    } else {
                                      _youtubeController.play();
                                    }
                                  },
                                ),
                                IconButton(
                                  icon: const Icon(Icons.fast_forward),
                                  onPressed: () {
                                    _youtubeController.seekTo(Duration(
                                        seconds: _youtubeController
                                                .value.position.inSeconds +
                                            10));
                                  },
                                ),
                                // Nút chiếu toàn màn hình
                                IconButton(
                                  icon: const Icon(Icons.fullscreen),
                                  onPressed: () {
                                    SystemChrome.setPreferredOrientations([
                                      DeviceOrientation.landscapeRight,
                                      DeviceOrientation.landscapeLeft,
                                    ]);
                                  },
                                ),
                                // Nút thu nhỏ
                                IconButton(
                                  icon: const Icon(Icons.fullscreen_exit),
                                  onPressed: () {
                                    SystemChrome.setPreferredOrientations([
                                      DeviceOrientation.portraitUp,
                                      DeviceOrientation.portraitDown,
                                    ]);
                                  },
                                ),
                              ],
                            ),
                          ],
                        )
                      : _videoPlayerController.value.isInitialized
                          ? Column(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                AspectRatio(
                                  aspectRatio:
                                      _videoPlayerController.value.aspectRatio,
                                  child: VideoPlayer(_videoPlayerController),
                                ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    IconButton(
                                      icon: const Icon(Icons.fast_rewind),
                                      onPressed: () {
                                        setState(() {
                                          _videoPlayerController.seekTo(
                                              Duration(
                                                  seconds:
                                                      _videoPlayerController
                                                              .value
                                                              .position
                                                              .inSeconds -
                                                          10));
                                        });
                                      },
                                    ),
                                    IconButton(
                                      icon: Icon(
                                        _videoPlayerController.value.isPlaying
                                            ? Icons.pause_circle
                                            : Icons.play_arrow,
                                      ),
                                      onPressed: () {
                                        setState(() {
                                          if (_videoPlayerController
                                              .value.isPlaying) {
                                            _videoPlayerController.pause();
                                          } else {
                                            _videoPlayerController.play();
                                          }
                                        });
                                      },
                                    ),
                                    IconButton(
                                      icon: const Icon(Icons.fast_forward),
                                      onPressed: () {
                                        setState(() {
                                          _videoPlayerController.seekTo(
                                              Duration(
                                                  seconds:
                                                      _videoPlayerController
                                                              .value
                                                              .position
                                                              .inSeconds +
                                                          10));
                                        });
                                      },
                                    ),

                                    // Nút chiếu toàn màn hình
                                    IconButton(
                                      icon: const Icon(Icons.fullscreen),
                                      onPressed: () {
                                        SystemChrome.setPreferredOrientations([
                                          DeviceOrientation.landscapeRight,
                                          DeviceOrientation.landscapeLeft,
                                        ]);
                                      },
                                    ),
                                    // Nút thu nhỏ
                                    IconButton(
                                      icon: const Icon(Icons.fullscreen_exit),
                                      onPressed: () {
                                        SystemChrome.setPreferredOrientations([
                                          DeviceOrientation.portraitUp,
                                          DeviceOrientation.portraitDown,
                                        ]);
                                      },
                                    ),
                                  ],
                                ),
                              ],
                            )
                          : const CircularProgressIndicator(),
            ),
          ),
        ));
  }
}

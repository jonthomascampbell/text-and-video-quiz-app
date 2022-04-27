import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

class Question extends StatefulWidget {
  var questionText;
  var type;

  Question(this.questionText,this.type);

  @override
  State<Question> createState() => _QuestionState();
}

class _QuestionState extends State<Question> {
  late VideoPlayerController controller;

  @override
  void initState() {
    loadVideoPlayer();
    super.initState();
  }

  loadVideoPlayer(){
      controller = VideoPlayerController.asset(
          'assets/videos/video1.mp4');
      controller.addListener(() {
        setState(() {});
      });
      controller.initialize().then((value) {
        setState(() {});
      });
  }
  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    if(widget.type == "text") {
      return Container(
        width: double.infinity,
        margin: EdgeInsets.all(10),
        child: Text(
          widget.questionText,
          style: TextStyle(fontSize: 28),
          textAlign: TextAlign.center,
        ),
      );
    }else{
      return Container(
        width: double.infinity,
        margin: const EdgeInsets.all(10),
        child: Column(
          children: [
            AspectRatio(
              aspectRatio: 16/9,
              child: VideoPlayer(controller),
            ),
            Text("Total Duration: " + controller.value.duration.toString()),
            VideoProgressIndicator(
                controller,
                allowScrubbing: true,
                colors:const VideoProgressColors(
                  backgroundColor: Colors.blue,
                  playedColor: Colors.green,
                  bufferedColor: Colors.blue,
                )
            ),
            IconButton(
                onPressed: (){
                  if(controller.value.isPlaying){
                    controller.pause();
                  }else{
                    controller.play();
                  }
                  setState(() {
                  });
                },
                icon:Icon(controller.value.isPlaying?Icons.pause:Icons.play_arrow)
            ),
          ],
        ),
      );
    }

  }
}

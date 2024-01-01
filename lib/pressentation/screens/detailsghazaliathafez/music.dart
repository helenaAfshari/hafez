import 'package:audio_video_progress_bar/audio_video_progress_bar.dart';
import 'package:autharization_hanna/core/resource/constants/my_colors.dart';
import 'package:flutter/material.dart';

class MyProgressBarWidgetMusic extends StatelessWidget {
  final Duration total;
  final Stream<Duration>? stream, buffered;
  final void Function(Duration)? onSeek;
   MyProgressBarWidgetMusic({super.key,required this.total,this.stream,this.buffered,this.onSeek});

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<Duration>(stream: stream, builder: (context, snapshot) {
      final progress = snapshot.data?? Duration.zero;
      return StreamBuilder(stream: buffered, builder: (context, snapshot) {
        return ProgressBar(
          progress: progress, 
        buffered: snapshot.data?? Duration.zero,
        total: total,
      
       timeLabelTextStyle: TextStyle(color: MyColors.musicBoxColor),
       bufferedBarColor: MyColors.backgroundpercentMusicColor,
                  thumbColor: MyColors.percentMusicColor,
                  baseBarColor: MyColors.backgroundpercentMusicColor,
                  progressBarColor: MyColors.percentMusicColor,
                  onSeek: onSeek,
        );
      },);
    },);
  }
}
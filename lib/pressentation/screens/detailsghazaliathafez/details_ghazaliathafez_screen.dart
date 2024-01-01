

import 'dart:async';
import 'dart:math';

import 'package:audio_video_progress_bar/audio_video_progress_bar.dart';
import 'package:autharization_hanna/core/appbar/my_appbar.dart';
import 'package:autharization_hanna/core/bottomnavigationbar/my_bottom_navigation.dart';
import 'package:autharization_hanna/core/components/customwidgets/custom_divider.dart';
import 'package:autharization_hanna/core/resource/constants/my_colors.dart';
import 'package:autharization_hanna/core/resource/constants/my_dimensions.dart';
import 'package:autharization_hanna/domain/model/detailsghazaliathafez/details_ghazaliat_hafez_model.dart';
import 'package:autharization_hanna/domain/model/ghazaliathafez/ghazaliathafez_model.dart';
import 'package:autharization_hanna/pressentation/blocs/detailsghazaliathafezbloc/details_ghazaliat_hafez_bloc.dart';
import 'package:autharization_hanna/pressentation/blocs/detailsghazaliathafezbloc/details_ghazaliat_hafez_event.dart';
import 'package:autharization_hanna/pressentation/blocs/detailsghazaliathafezbloc/details_ghazaliat_hafez_state.dart';
import 'package:autharization_hanna/pressentation/screens/detailsghazaliathafez/music.dart';
import 'package:autharization_hanna/pressentation/screens/ghazaliathafez/ghazaliat_hafez_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:get_storage/get_storage.dart';
import 'package:just_audio/just_audio.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';


class DetailsGhazaliatHafezScreen extends StatefulWidget {
     GhazalItemModelEntity? e;
     int index;
     
   
  DetailsGhazaliatHafezScreen({Key? key,  this.e, required this.index});

  @override
  State<DetailsGhazaliatHafezScreen> createState() => _DetailsGhazaliatHafezScreenState();
}

class _DetailsGhazaliatHafezScreenState extends State<DetailsGhazaliatHafezScreen> {
  @override
  void initState() {
    super.initState();
  WidgetsBinding.instance.addPostFrameCallback((_) {
_playAudio(widget.e?.tafsirAudio?? "");
    startProgress();
  });
   
 BlocProvider.of<DetailsGhazaliatHafezBloc>(context).add(LoadedddEvent(widget.index??0));
// _playAudio('https://api.hafezname.ir/voices/001.mp3');
  }

  Timer? timer;
  AudioPlayer _audioPlayer =AudioPlayer();
   bool isPlaying = false;
    double progressValue = 0.0;
  Duration progresssValue = Duration(seconds: 0);
  Duration bufferedValue = Duration(seconds: 0);

    Future<void> _playAudio(String url) async {
    try {
      await _audioPlayer.setUrl(url);
      await _audioPlayer.pause();
      _audioPlayer.playerStateStream.listen((playerState) {
        setState(() {
          isPlaying = playerState.playing;
        
        });
        // if(playerState.playing){
        //    switch(playerState.processingState){
        //   case ProcessingState.buffering
        //     // TODO: Handle this case.
        // }
        // }
      
      });
    } catch (e) {
      // Handle the exception
      print("Error playing audio: $e");
    }
  }
  @override
  void dispose() {
    _audioPlayer.dispose();
    super.dispose();
  }
 
 



// startProgress(){
//    const tick  = Duration(seconds:1 );
//    int duration = _audioPlayer.duration!.inSeconds - _audioPlayer.position.inSeconds;
//    if(timer!=null){
//     if(timer!.isActive){
//       timer!.cancel();
//       timer=null;
//     }
//     timer = Timer.periodic(tick, (timer) { 
//       duration--;
//       progresssValue = _audioPlayer.position;
//       bufferedValue = _audioPlayer.bufferedPosition;

//       if(duration<=0){
//         timer.cancel();
//         setState(() {
//            progresssValue = Duration(seconds: 0);
//       bufferedValue = Duration(seconds: 0);
//         });
        
//       }
//     });
//    }
// }
startProgress() {
  const tick = Duration(seconds: 1);
  int duration = _audioPlayer.duration!.inSeconds;
  var step =  1 / duration;
  timer = Timer.periodic(tick, (timer) {
    duration--;
    progressValue += step;

    // اگر مقدار progressValue از 1.0 بیشتر شد، آن را به 1.0 تنظیم کنید
    if (progressValue > 1.0) {
      progressValue = 1.0;
    }

    if (duration <= 0) {
      timer.cancel();
      _audioPlayer.stop();
      update(0.0);
      print("musssiiiccc:::");
    } else {
      update(progressValue);
    }
  });
}


void update(double newValue) {
  setState(() {
      // اگر newValue بزرگتر از 0.0 باشد، مقدار progressValue به‌روز شود
      progressValue = newValue;
  
  });
}
  
  @override
  Widget build(BuildContext context) {
  bool isVisible = false;
    return SafeArea(
      child: Scaffold(
        backgroundColor: MyColors.primaryColor,
       body:  BlocBuilder<DetailsGhazaliatHafezBloc,DetailsGhazaliatHafezState>(
       builder: (context, state) {
        print("StateDetails::::::::$state");
          if (state is DetailsGhazaliatHafezLoadingState) {
            return const Center(
              child: CircularProgressIndicator(color: Colors.blue),
            );
          }else if (state is DetailsGhazaliatHafezSuccesState) {
            return   
            Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const MyAppBar(),
                 Expanded(
            child: Stack(
              clipBehavior: Clip.none,
              children: [
              Positioned(
                top: 5,
                left: 29,
                right: 29,
                bottom: 13,
                child: Container(
                  decoration:  BoxDecoration(
                    border: Border.all(color: MyColors.borderBottomColor),
                    color: MyColors.boxBottomColor,
                    borderRadius: const BorderRadius.all(Radius.circular(8)),
                  ),
                  height: MediaQuery.of(context).size.height * 0.8, 
                 child:  Column(
                   children: [
                     const Gap(22),
                     Text(widget.e!.title!,style: Theme.of(context)
                .textTheme
                .titleLarge!.copyWith(fontSize: 12),), 
                //   Text(gGhazaliatHafez!.text!,style: Theme.of(context)
                // .textTheme
                // .titleLarge!.copyWith(fontSize: 12),),
            
            Expanded(
              child: ListView.builder(
                  itemCount:state.detailsghazaliatHafez.length,
                  itemBuilder: (context, index) {
                   //final text = texts[index];
                    // final text = state.detailsghazaliatHafez[index];
                     final isEvenIndex = index.isEven;
                   return 
                      GestureDetector(
              onTap: () {
              },
              child: Padding(
               padding: EdgeInsets.all(8.0),
               child: Text(
               textAlign: isEvenIndex ? TextAlign.right : TextAlign.left,
                    state.detailsghazaliatHafez[index].text??"",
                 style: const TextStyle(fontSize: 16.0),
               ),
                     ),
                      );
                  },
                ),
            ),
           GestureDetector(
          onTap: () {
             showModalBottomSheet(
        
      context: context,
      builder: (BuildContext builder) {
        return Expanded(
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.only(right: 30,left:25),
                  child: Text(
                    
                    textAlign: TextAlign.center,
                  widget.e!.tafsir!,
                          
                    style: Theme.of(context)
                                  .textTheme
                                  .titleLarge!.copyWith(fontSize: 18),),
                ),
                
            
                Positioned(
                  bottom: 0,
                  left: 0,
                  right: 0,
                  child: ElevatedButton(
                    style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all<Color>(MyColors.musicBoxColor),
        
                    ),
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                    child: Text('Close'),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
          },
          child: Text("تفسیر",style: TextStyle(color: Colors.blue),),),
            // Expanded(
            // child: Padding(
            //   padding:  EdgeInsets.only(bottom: MyDimensions.xlarge*5),
            //   child: CustomDivider(endIndent: 50, indent: 50),
            // )),
            
            
            
            // Column(
            //   children: [
            //     Text("تفسیر"),
                
            //     Padding(
            //       padding: const EdgeInsets.only(left: 5,right: 5),
            //       child: Text(widget.e!.tafsir!.toString(),style: Theme.of(context)
            //                     .textTheme
            //                     .titleLarge!.copyWith(fontSize: 12),),
            //     ),
            //   ],
            // ),
            

         //truuuuuu   
          StatefulBuilder(
  builder: (context, setState) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        // First child: "تفسیر" and CustomDivider
        Visibility(
          visible: isVisible,
          maintainSize: true,
          maintainAnimation: true,
          maintainState: true,
          child: Text(
            widget.e!.tafsir!,
            textAlign: TextAlign.center,
            style: Theme.of(context).textTheme.titleLarge!.copyWith(fontSize: 12),
          ),
        ),
        // Second child: Other elements
       
        // TextButton(
        //   onPressed: () {
        //     setState(() {
        //       isVisible = !isVisible;
        //     });
        //     print("visible::::$isVisible");
        //   },
        //   child: Padding(
        //     padding: const EdgeInsets.only(top: 55),
        //     child: Text("تفسیر"),
        //   ),
        // ),
          // Visibility(
          //   visible: isVisible,
          //   child: Container(
          //     height: 200,
          //     child: ListView.builder(
          //       itemCount: 5,
          //       itemBuilder: (context, index) {
          //         return ListTile(
          //           title:  widget.e!.tafsir!,
          //         );
          //       },
          //     ),
          //   ),
          // ),
          // Padding(
          //   padding: const EdgeInsets.only(top: 100),
          //   child: TextButton(
          //     onPressed: () {
          //       setState(() {
          //         isVisible = !isVisible;
          //       });
          //       print("visible::::$isVisible");
          //     },
          //     child: Text("تفسیر"),
          //   ),
          // ),
        
    //     GestureDetector(
    //       onTap: () {
    //          showModalBottomSheet(
    //   context: context,
    //   builder: (BuildContext builder) {
    //     return Container(
    //       height: double.infinity,
    //       child: Column(
    //         mainAxisAlignment: MainAxisAlignment.center,
    //         children: [
    //           Text(
    //            widget.e!.tafsir!,
    //             style: TextStyle(fontSize: 20),
    //           ),
    //           SizedBox(height: 20),
    //           ElevatedButton(
    //             onPressed: () {
    //               Navigator.of(context).pop();
    //             },
    //             child: Text('Close'),
    //           ),
    //         ],
    //       ),
    //     );
    //   },
    // );
    //       },
    //       child: Text("تفسیر",style: TextStyle(color: Colors.blue),)),
       // CustomDivider(endIndent: 50, indent: 50),


      ],
    );
  },
),

// CustomDivider(endIndent: 50, indent: 50),


    
                   ],
                 ),
                ),
              ),

              /////truuu
              Positioned(
          bottom: -10,
          left: 47,
          right: 47,
          child: Container(
            decoration: const BoxDecoration(
              color: MyColors.musicBoxColor,
              borderRadius: BorderRadius.all(Radius.circular(8)),
            ),
            height: MediaQuery.of(context).size.height * 0.10,
            child: Column(
              children: [
                const Gap(5),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [




// GestureDetector(
//  onTap: () async {
//   if (isPlaying) {
//     await _audioPlayer.play();
//     if (timer != null && timer!.isActive) {
//       timer!.cancel();
//     }
//   } else {
//     await _audioPlayer.pause();

//     // تنظیم مقدار اولیه اگر تنها برای اولین بار Play می‌شود
//     if (initialProgress == 1.0) {
//       initialProgress = progressValue;
//     }
    
//     // شروع تابع startProgress با استفاده از initialProgress به عنوان نقطه شروع
//     startProgress();
//   }
//   setState(() {
//     isPlaying = !isPlaying;
//   });
// },

//   child: Image.asset(isPlaying ? 'assets/icons/pause.png' : 'assets/icons/play.png'),
// ),


// Column(
//   children: [
  
 GestureDetector(
    onTap: () async {
      if (isPlaying) {
        await _audioPlayer.pause();
        if (timer != null && timer!.isActive) {
          timer!.cancel();
        }
      } 
   
      setState(() {
        isPlaying = !isPlaying;
      });
    },
    child: Image.asset('assets/icons/pause.png'),
  ),
GestureDetector(
  onTap: () async {
      if (isPlaying) {
        await _audioPlayer.play();
        if (timer != null && timer!.isActive) {
          timer!.cancel();
        }
      } 
    startProgress();
      setState(() {
        isPlaying = !isPlaying;
      });
    },
  child: Image.asset('assets/icons/play.png'),
),


//       child: Image.asset('assets/icons/play.png'),
//     ),
//     GestureDetector(
//       onTap: () async {
//         if (isPlaying) {
//           await _audioPlayer.play();
//           if (timer != null && timer!.isActive) {
//             timer!.cancel();
//           }
//         } else {
//           await _audioPlayer.pause();

//           // تنظیم مقدار اولیه اگر تنها برای اولین بار Play می‌شود
//           if (initialProgress == 0.0) {
//             initialProgress = pausedProgressValue;
//           }

//           // شروع تابع startProgress با استفاده از initialProgress به عنوان نقطه شروع
//           startProgress();
//         }
//         setState(() {
//           isPlaying = !isPlaying;
//         });
//       },
//       child: Image.asset('assets/icons/pause.png'),
//     ),
//   ],
// ),




                  
                  //     GestureDetector(
                  //    onTap: () async {
                  //      await _audioPlayer.play();
                  //         //startProgress();
                  //    },
                  //    child: Image.asset('assets/icons/pause.png'),
                  // ),
                  // GestureDetector(
                  //    onTap: () async {
                  //      await _audioPlayer.pause();
                      
                    
                  //    },
                  //    child: Image.asset('assets/icons/play.png'),
                  // ),  
                  GestureDetector(
  onTap: () async {
    await _audioPlayer.seek(Duration.zero);
    update(0.0); // یا مقدار اولیه مورد نظر خود
  },
  child: Image.asset('assets/icons/Rectangle.png'),
)
 
                  ],
                ),
            
                // LinearPercentIndicator(
                // percent: progressValue,

                // lineHeight: 10.0,
                // backgroundColor: MyColors.backgroundpercentMusicColor,
                // progressColor: MyColors.percentMusicColor,
                // )
                MyProgressBarWidgetMusic(
                  total: _audioPlayer.duration?? Duration.zero,
                  stream: _audioPlayer.positionStream,
                  buffered:_audioPlayer.bufferedPositionStream,
                  onSeek: (positioned){
_audioPlayer.seek(positioned);
                  }
                  
                )
                
            
                // ProgressBar(
                //   thumbCanPaintOutsideBar: false,
                //   timeLabelTextStyle: TextStyle(color: MyColors.musicBoxColor),
                //   thumbColor: MyColors.percentMusicColor,
                //   baseBarColor: MyColors.backgroundpercentMusicColor,
                //   progressBarColor: MyColors.percentMusicColor,
                //   progress:progresssValue, 
                //   buffered: bufferedValue,
                
                //   onSeek: (positioned) {
                //     _audioPlayer.seek(positioned);
                //     _audioPlayer.playing?startProgress(): timer!.cancel();
                //   },
                // total: _audioPlayer.duration??Duration(seconds: 0))
                // LinearPercentIndicator(
                //   percent: progressValue,
                //   backgroundColor: MyColors.backgroundpercentMusicColor,
                //   progressColor: MyColors.percentMusicColor,
                // ),
              ],
            ),
          ),
        ),
            //     Positioned(
            //       bottom: -10,
            //       left: 47,
            //       right: 47,
            //       child: Container(
            //         decoration: const BoxDecoration(
            //   color: MyColors.musicBoxColor,
            // borderRadius: BorderRadius.all(Radius.circular(8))
            //         ),
            // height: MediaQuery.of(context).size.height * 0.10,          
            //         child: Column(
            // children: [
            //   const Gap(5),
            //   Row(
            //     mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            //     children: [
            //       Image.asset('assets/icons/pause.png',),
            //       Image.asset('assets/icons/play.png',),
            //       Image.asset('assets/icons/Rectangle.png',),
            //     ],
            //   ),
            //   const Gap(15),
            //   LinearPercentIndicator(
            //     percent:  1.0,
            //     backgroundColor: MyColors.backgroundpercentMusicColor,
            //     progressColor: MyColors.percentMusicColor,
            //   )
            // ],
            //         ),
            //     ),
            //   ),
              ],
            ),
            ),
                    const Gap(20),
            MyBottomNavigation(),
                  ],
                );
         
       }
       else if (state is DetailsGhazaliatHafezErrorState) {
            return Center(
              child: Text(state.error),
            );
          } else {
            print('cannot detect state DetailsGhazaliat');
            return Container();
          }
       }),
      ),
    );
  }
}


// import 'package:flutter/material.dart';

// void main() {
//   runApp(MyApp());
// }

// class MyApp extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: 'Show/Hide Widget',
//       theme: ThemeData(
//         primarySwatch: Colors.green,
//         visualDensity: VisualDensity.adaptivePlatformDensity,
//       ),
//       home: HomeScreen(),
//     );
//   }
// }



//////////////////////////////////////////
///
///
// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:just_audio/just_audio.dart';

// class _DetailsGhazaliatHafezScreenState extends State<DetailsGhazaliatHafezScreen> {
//   late AudioPlayer _audioPlayer;

//   @override
//   void initState() {
//     super.initState();
//     BlocProvider.of<DetailsGhazaliatHafezBloc>(context).add(LoadedddEvent(widget.index));

//     _audioPlayer = AudioPlayer();
//     _playAudio("https://example.com/your-audio-file.mp3");
//   }

//   Future<void> _playAudio(String url) async {
//     try {
//       await _audioPlayer.setUrl(url);
//       await _audioPlayer.play();
//     } catch (e) {
//       // Handle the exception
//       print("Error playing audio: $e");
//     }
//   }

//   @override
//   void dispose() {
//     _audioPlayer.dispose();
//     super.dispose();
//   }

//   // The rest of your widget code...

// }



///////////////////////
///
///
///اااااا
// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:just_audio/just_audio.dart';

// class _DetailsGhazaliatHafezScreenState extends State<DetailsGhazaliatHafezScreen> {
//   late AudioPlayer _audioPlayer;
//   bool isPlaying = false;

//   @override
//   void initState() {
//     super.initState();
//     BlocProvider.of<DetailsGhazaliatHafezBloc>(context).add(LoadedddEvent(widget.index));

//     _audioPlayer = AudioPlayer();
//     _playAudio("https://example.com/your-audio-file.mp3");
//   }

//   Future<void> _playAudio(String url) async {
//     try {
//       await _audioPlayer.setUrl(url);
//       await _audioPlayer.play();
//       _audioPlayer.playerStateStream.listen((playerState) {
//         setState(() {
//           isPlaying = playerState.playing;
//         });
//       });
//     } catch (e) {
//       // Handle the exception
//       print("Error playing audio: $e");
//     }
//   }

//   Future<void> _togglePlayback() async {
//     if (isPlaying) {
//       await _audioPlayer.pause();
//     } else {
//       await _audioPlayer.play();
//     }
//   }

//   @override
//   void dispose() {
//     _audioPlayer.dispose();
//     super.dispose();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Stack(
//       children: [
//         // Your existing code...

//         Positioned(
//           bottom: -10,
//           left: 47,
//           right: 47,
//           child: Container(
//             decoration: BoxDecoration(
//               color: MyColors.musicBoxColor,
//               borderRadius: BorderRadius.all(Radius.circular(8)),
//             ),
//             height: MediaQuery.of(context).size.height * 0.10,
//             child: Column(
//               children: [
//                 const Gap(5),
//                 Row(
//                   mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//                   children: [
//                     GestureDetector(
//                       onTap: _togglePlayback,
//                       child: Image.asset(
//                         isPlaying ? 'assets/icons/pause.png' : 'assets/icons/play.png',
//                       ),
//                     ),
//                     Image.asset('assets/icons/Rectangle.png'),
//                   ],
//                 ),
//                 const Gap(15),
//                 LinearPercentIndicator(
//                   percent: 1.0,
//                   backgroundColor: MyColors.backgroundpercentMusicColor,
//                   progressColor: MyColors.percentMusicColor,
//                 ),
//               ],
//             ),
//           ),
//         ),
//       ],
//     );
//   }
// }

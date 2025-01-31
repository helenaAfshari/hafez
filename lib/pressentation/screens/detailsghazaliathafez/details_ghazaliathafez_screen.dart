import 'dart:async';
import 'package:hafez/core/appbar/drawer_menu.dart';
import 'package:hafez/core/appbar/my_appbar.dart';
import 'package:hafez/core/resource/constants/my_colors.dart';
import 'package:hafez/core/resource/constants/my_dimensions.dart';
import 'package:hafez/core/resource/constants/my_pading.dart';
import 'package:hafez/core/resource/constants/my_strings.dart';
import 'package:hafez/domain/model/ghazaliathafez/ghazaliathafez_model.dart';
import 'package:hafez/pressentation/blocs/detailsghazaliathafezbloc/details_ghazaliat_hafez_bloc.dart';
import 'package:hafez/pressentation/blocs/detailsghazaliathafezbloc/details_ghazaliat_hafez_event.dart';
import 'package:hafez/pressentation/blocs/detailsghazaliathafezbloc/details_ghazaliat_hafez_state.dart';
import 'package:hafez/pressentation/screens/detailsghazaliathafez/widgets/show_modal_bottom_sheet_widget.dart';
import 'package:hafez/pressentation/screens/detailsghazaliathafez/widgets/tafsir_text_visibility_widget.dart';
import 'package:hafez/pressentation/screens/detailsghazaliathafez/widgets/my_progressbar_widget_music.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:just_audio/just_audio.dart';

class DetailsGhazaliatHafezScreen extends StatefulWidget {
  GhazalItemModelEntity? GhazaliatModel;
  int? index;
  DetailsGhazaliatHafezScreen({
    Key? key,
    this.GhazaliatModel,
    this.index,
  });
  @override
  State<DetailsGhazaliatHafezScreen> createState() =>
      _DetailsGhazaliatHafezScreenState();
}

class _DetailsGhazaliatHafezScreenState
    extends State<DetailsGhazaliatHafezScreen> {
  final GlobalKey<ScaffoldState> _detailsGhazaliatKey = GlobalKey();
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _playAudio(widget.GhazaliatModel!.tafsirAudio ?? "");
    });
    BlocProvider.of<DetailsGhazaliatHafezBloc>(context)
        .add(LoadedddEvent(widget.index ?? 0));
  }

  Timer? timer;
  final AudioPlayer _audioPlayer = AudioPlayer();
  bool isPlaying = false;
  double progressValue = 0.0;
  Future<void> _playAudio(String url) async {
    try {
      await _audioPlayer.setUrl(url);
      await _audioPlayer.pause();
      _audioPlayer.playerStateStream.listen((playerState) {
        setState(() {
          isPlaying = playerState.playing;
        });
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

  startProgress() {
    const tick = Duration(seconds: 1);
    int duration = _audioPlayer.duration!.inSeconds;
    var step = 1 / duration;
    timer = Timer.periodic(tick, (timer) {
      duration--;
      progressValue += step;
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
      progressValue = newValue;
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        key: _detailsGhazaliatKey,
        endDrawer: const DrawerWidget(),
        appBar: CustomAppBarWidget(
          scaffoldKey: _detailsGhazaliatKey,
          showActionIcon: true,
          title: MyStrings.ghazaliatHafezText,
          leading: IconButton(
              onPressed: () => Navigator.pop(context),
              icon: const BackButton()),
        ),
        backgroundColor: MyColors.primaryColor,
        body:
            BlocBuilder<DetailsGhazaliatHafezBloc, DetailsGhazaliatHafezState>(
                builder: (context, state) {
          if (state is DetailsGhazaliatHafezLoadingState) {
            return const Center(
              child: CircularProgressIndicator(
                  color: MyColors.circularProgressIndicatorColor),
            );
          } else if (state is DetailsGhazaliatHafezSuccesState) {
            return Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
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
                          decoration: BoxDecoration(
                            border:
                                Border.all(color: MyColors.borderBottomColor),
                            color: MyColors.boxBottomColor,
                            borderRadius: BorderRadius.all(
                                Radius.circular(MyDimensions.light)),
                          ),
                          height: MediaQuery.of(context).size.height * 0.8,
                          child: Column(
                            children: [
                              Gap(MyDimensions.semiLarge - 2),
                              Text(
                                widget.GhazaliatModel?.title ?? "null",
                              ),

                              //      Text(widget.e!.title!,style: Theme.of(context)
                              // .textTheme
                              // .titleLarge!.copyWith(fontSize: MyDimensions.xLight),),

                              Expanded(
                                child: ListView.builder(
                                  itemCount: state.detailsghazaliatHafez.length,
                                  itemBuilder: (context, index) {
                                    final isEvenIndex = index.isEven;
                                    return GestureDetector(
                                      onTap: () {},
                                      child: Padding(
                                        padding: MyPaddings.all8,
                                        child: Text(
                                          textAlign: isEvenIndex
                                              ? TextAlign.right
                                              : TextAlign.left,
                                          state.detailsghazaliatHafez[index]
                                                  .text ??
                                              "",
                                          style: TextStyle(
                                              fontSize: MyDimensions.medium),
                                        ),
                                      ),
                                    );
                                  },
                                ),
                              ),
                              ShowModalBottomSheetWidget(widget: widget),
                              TafsirTextVisibilityWidget(),
                              Gap(MyDimensions.xlarge + 30),
                            ],
                          ),
                        ),
                      ),
                      Positioned(
                        bottom: -10,
                        left: 47,
                        right: 47,
                        child: Container(
                          decoration: BoxDecoration(
                            color: MyColors.musicBoxColor,
                            borderRadius: BorderRadius.all(
                                Radius.circular(MyDimensions.light)),
                          ),
                          height: 85,
                          child: Column(
                            children: [
                              const Gap(5),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: [
                                  SizedBox(
                                    height: 30,
                                    width: 50,
                                    child: GestureDetector(
                                      onTap: () async {
                                        if (isPlaying) {
                                          await _audioPlayer.pause();
                                        }
                                        setState(() {
                                          isPlaying = !isPlaying;
                                        });
                                      },
                                      child:
                                          Image.asset('assets/icons/pause.png'),
                                    ),
                                  ),
                                  SizedBox(
                                    height: 35,
                                    width: 50,
                                    child: GestureDetector(
                                      onTap: () async {
                                        startProgress();
                                        setState(() async {
                                          await _audioPlayer.play();
                                        });
                                      },
                                      child:
                                          Image.asset('assets/icons/play.png'),
                                    ),
                                  ),
                                  SizedBox(
                                    height: 30,
                                    width: 30,
                                    child: GestureDetector(
                                      onTap: () async {
                                        await _audioPlayer.seek(Duration.zero);
                                        update(0.0);
                                      },
                                      child: Image.asset(
                                          'assets/icons/Rectangle.png'),
                                    ),
                                  )
                                ],
                              ),
                              MyProgressBarWidgetMusic(
                                  total: _audioPlayer.duration ?? Duration.zero,
                                  stream: _audioPlayer.positionStream,
                                  buffered: _audioPlayer.bufferedPositionStream,
                                  onSeek: (positioned) {
                                    _audioPlayer.seek(positioned);
                                  })
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Gap(MyDimensions.semiLarge - 4),
                // const MyBottomNavigation(),
              ],
            );
          } else if (state is DetailsGhazaliatHafezErrorState) {
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

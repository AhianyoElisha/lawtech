import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lawtech/cubit/app_cubits.dart';
import 'package:lawtech/cubit/app_cubits_states.dart';
import 'package:lawtech/widgets/video_player_item.dart';

import '../../widgets/circle_animation.dart';

class ScrollVideosPage extends StatelessWidget {
  const ScrollVideosPage({super.key});

  buildProfile(String profilePhoto) {
    return SizedBox(
      width: 60,
      height: 60,
      child: Stack(
        children: [
          Positioned(
            left: 5,
              child: Container(
                width: 50,
                height: 50,
                padding: const EdgeInsets.all(1),
                decoration: BoxDecoration(
                  color: Colors.black,
                  borderRadius: BorderRadius.circular(25),
                ),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(25),
                    child: Image.asset("img/balloning.png", fit: BoxFit.cover,)
                ),
              )
          )
        ],
      ),
    );
  }

  buildMusicAlbum(String s) {
    return SizedBox(
      width: 60,
      height: 60,
      child: Column(
        children: [
          Container(
            padding: const EdgeInsets.all(1),
            height: 50,
            width: 50,
            decoration: BoxDecoration(
              gradient: const LinearGradient(colors: [
                Colors.grey,
                Colors.black
              ]),
              borderRadius: BorderRadius.circular(25),
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(25),
              child: Image.asset("img/balloning.png", fit: BoxFit.cover,),
            ),
          )
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      body: BlocBuilder<AppCubits, CubitStates>(
        builder: (context, state) {
          if (state is LoadedState) {
            var videos = state.videos;
            return PageView.builder(
                itemCount: videos.length,
                controller: PageController(initialPage: 0, viewportFraction: 1),
                scrollDirection: Axis.vertical,
                itemBuilder: (context, index) {
                  final video = state.videos[index];
                  final size = MediaQuery
                      .of(context)
                      .size;
                  return Stack(
                    children: [
                      VideoPlayerItem(videoUrl: video.assets.mp4,),
                      Column(
                        children: [
                          const SizedBox(
                            height: 100,
                          ),
                          Expanded(
                            child: Row(
                              mainAxisSize: MainAxisSize.max,
                              crossAxisAlignment: CrossAxisAlignment.end,
                              children: [
                                Expanded(
                                  child: Container(
                                    padding: const EdgeInsets.only(
                                      left: 20,
                                    ),
                                    child: Column(
                                      mainAxisSize: MainAxisSize.min,
                                      crossAxisAlignment: CrossAxisAlignment
                                          .start,
                                      mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                      children: [
                                        Text(
                                          "username",
                                          style: const TextStyle(
                                            fontSize: 20,
                                            color: Colors.white,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                        Text(
                                          video.title,
                                          style: const TextStyle(
                                            fontSize: 15,
                                            color: Colors.white,
                                          ),
                                        ),
                                        // Row(
                                        //   children: [
                                        //     const Icon(
                                        //       Icons.music_note,
                                        //       size: 15,
                                        //       color: Colors.white,
                                        //     ),
                                        //     Text(
                                        //       "song name",
                                        //       style: const TextStyle(
                                        //         fontSize: 15,
                                        //         color: Colors.white,
                                        //         fontWeight: FontWeight.bold,
                                        //       ),
                                        //     ),
                                        //   ],
                                        // )
                                        const SizedBox(height: 30,)
                                      ],
                                    ),
                                  ),
                                ),
                                Container(
                                  width: 100,
                                  margin: EdgeInsets.only(top: size.height / 5),
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment
                                        .spaceEvenly,
                                    children: [
                                      buildProfile("profilePhoto"),
                                      Column(
                                        children: [
                                          InkWell(
                                              onTap: () {},
                                              child: Icon(
                                                Icons.favorite, size: 40,
                                                color: Colors.red,)
                                          ),
                                          SizedBox(height: 7,),
                                          Text('2,2k', style: const TextStyle(
                                              fontSize: 20,
                                              color: Colors.white),)
                                        ],
                                      ),
                                      Column(
                                        children: [
                                          InkWell(
                                              onTap: () {},
                                              child: Icon(
                                                Icons.comment, size: 40,
                                                color: Colors.white,)
                                          ),
                                          SizedBox(height: 7,),
                                          Text('12', style: const TextStyle(
                                              fontSize: 20,
                                              color: Colors.white),)
                                        ],
                                      ),
                                      Column(
                                        children: [
                                          InkWell(
                                              onTap: () {},
                                              child: Icon(Icons.reply, size: 40,
                                                color: Colors.white,)
                                          ),
                                          SizedBox(height: 7,),
                                          Text('2', style: const TextStyle(
                                              fontSize: 20,
                                              color: Colors.white),)
                                        ],
                                      ),
                                      CircleAnimation(child: buildMusicAlbum(
                                          "profile photo"),),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      )
                    ],
                  );
                });
          } else   {
            return Container();
          }
        }
      ),
    );
  }
}

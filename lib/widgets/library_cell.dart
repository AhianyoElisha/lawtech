import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:lawtech/misc/colors.dart';
import 'package:lawtech/models/data_model.dart';
import 'package:marquee/marquee.dart';
import 'package:shimmer/shimmer.dart';


class LibraryCell extends StatelessWidget {
  final Books sObj;
  final int index;
  const LibraryCell({super.key, required this.sObj, required this.index});

  @override
  Widget build(BuildContext context) {
    var media = MediaQuery.of(context).size;
    return Container(
      width: 150,
      height: 240,
      decoration: BoxDecoration(
          color: AppColors.libraryBGColor[index % AppColors.libraryBGColor.length],
          borderRadius: BorderRadius.circular(15)),
      padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 4),
      child: Column(
        children: [
          Container(
            width: 150,
            height: 20,
            child: Marquee(
              text: sObj.title.toString(),
              style: const TextStyle(
                  color: Colors.white,
                  fontSize: 17,
                  fontWeight: FontWeight.w700
              ),
              scrollAxis: Axis.horizontal,
              crossAxisAlignment: CrossAxisAlignment.start,
              blankSpace: 20.0,
              velocity: 100.0,
              pauseAfterRound: const Duration(seconds: 1),
              startPadding: 10.0,
              accelerationDuration: const Duration(seconds: 1),
              accelerationCurve: Curves.linear,
              decelerationDuration: const Duration(milliseconds: 500),
              decelerationCurve: Curves.easeOut,
            ),
          ),
          const SizedBox(
            height: 15,
          ),
          ClipRRect(
            borderRadius: BorderRadius.circular(5),
            child: CachedNetworkImage(
              imageUrl: sObj.image,
              imageBuilder: (context, imageProvider) => Container(
                width: media.width * 0.23,
                height: media.width * 0.23 * 1.6,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5),
                  color: Colors.white,
                  image: DecorationImage(
                    image: imageProvider,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              placeholder: (context, url) => Shimmer.fromColors(
                baseColor: Colors.grey[300]!,
                highlightColor: Colors.grey[100]!,
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5),
                    color: Colors.white,
                  ),
                ),
              ),
              errorWidget: (context, url, error) => const Icon(Icons.error),
            ),
          )
        ],
      ),
    );
  }
}
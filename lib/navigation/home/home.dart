import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:lawtech/cubit/app_cubits.dart';
import 'package:lawtech/misc/colors.dart';
import 'package:lawtech/models/data_model.dart';
import 'package:lawtech/widgets/app_text.dart';
import 'package:lawtech/widgets/app_text_large.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:lawtech/widgets/library_cell.dart';
import 'package:shimmer/shimmer.dart';
import '../../cubit/app_cubits_states.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with TickerProviderStateMixin {
  var images = {
    "balloning.png" : "Criminal",
    "hiking.png" : "Civil Rights",
    "kayaking.png" : "Family",
    "snorkling.png" : "Real Estate"
  };
  @override
  Widget build(BuildContext context) {
    TabController tabController = TabController(length: 4, vsync: this);
    return Scaffold(
      body: BlocBuilder<AppCubits, CubitStates>(
        builder: (context, state) {
          if (state is LoadedState) {
            var info = state.videos;
            var books = state.books;
            return SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    padding: const EdgeInsets.only(top: 70, left: 20),
                    child: Row(
                      children: [
                        SvgPicture.asset("icons/bars-sort.svg", width: 24, color: Colors.black54,),
                        Expanded(child: Container()),
                        Container(
                          margin: const EdgeInsets.only(right: 20),
                          width: 50,
                          height: 50,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: Colors.grey.withOpacity(0.5),
                          ),
                        )
                      ],
                    ),
                  ),
                  const SizedBox(height: 20,),
                  Container(
                    margin: const EdgeInsets.only(left: 20),
                    child: AppTextLarge(text: "Discover",),
                  ),
                  const SizedBox(height: 20,),
                  TabBar(
                    dividerColor: Colors.white,
                    labelPadding: const EdgeInsets.only(left: 20, right: 20),
                    labelColor: Colors.black,
                    unselectedLabelColor: Colors.grey,
                    isScrollable: true,
                    indicatorSize: TabBarIndicatorSize.label,
                    indicator: CircleTabIndicator(color: AppColors.mainColor, radius: 4),
                    controller: tabController,
                    tabAlignment: TabAlignment.start,
                    tabs: const [
                      Tab(text: "All",),
                      Tab(text: "Favourites",),
                      Tab(text: "Comments",),
                      Tab(text: "Replies",),
                    ],
                  ),
                  const SizedBox(height: 5),
                  Container(
                    padding: const EdgeInsets.only(left: 20),
                    height: 300,
                    width: double.maxFinite,
                    child: TabBarView(
                      controller: tabController,
                      children: [
                        ListView.builder(
                          scrollDirection: Axis.horizontal,
                          itemCount: info.length,
                          itemBuilder: (BuildContext context, int index) {
                            return GestureDetector(
                              onTap: () => BlocProvider.of<AppCubits>(context).selectedVideo(info[index]),
                              child: Container(
                                margin: const EdgeInsets.only(right: 15, top: 10),
                                width: 200,
                                height: 300,
                                child: CachedNetworkImage(
                                  imageUrl: info[index].assets.thumbnail,
                                  imageBuilder: (context, imageProvider) => Container(
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(20),
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
                                        borderRadius: BorderRadius.circular(20),
                                        color: Colors.white,
                                      ),
                                    ),
                                  ),
                                  errorWidget: (context, url, error) => const Icon(Icons.error),
                                ),
                              ),
                            );
                          },
                        ),
                        Text("There"),
                        Text("Bye"),
                        Text("Hello"),
                      ],
                    ),
                  ),
                  const SizedBox(height: 30,),
                  Container(
                    padding: const EdgeInsets.only(left: 20, right: 20),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        AppTextLarge(text: "Explore the library", size: 22,),
                        AppText(text: "See all", color: AppColors.textColor1,)
                      ],
                    ),
                  ),
                  const SizedBox(height: 10,),
                  Container(
                    height: 240,
                    width: double.maxFinite,
                    margin: const EdgeInsets.only( left: 20),
                    child: ListView.builder(
                        itemCount: books.length,
                        scrollDirection: Axis.horizontal,
                        itemBuilder: (_, index ) {
                          var sObj = books[index];
                          return GestureDetector(
                            onTap: () => BlocProvider.of<AppCubits>(context).selectedBook(books[index]),
                            child: Container(
                              height: 240,
                              margin: const EdgeInsets.only(right: 15),
                              child: LibraryCell(sObj: sObj, index: index),
                            ),
                          );
                        }),
                  )
                ],
              ),
            );
          }
          else {
            return Container();
          }
        },
      ),
    );
  }
}



class CircleTabIndicator extends Decoration {
  final Color color;
  final double radius;

  const CircleTabIndicator({required this.color, required this.radius});
  @override
  BoxPainter createBoxPainter([VoidCallback? onChanged]) {
    // TODO: implement createBoxPainter
    return _CirclePainter( color: color, radius: radius);
  }
}

class _CirclePainter extends BoxPainter {
  final Color color;
  double radius;

  _CirclePainter({required this.color, required this.radius});

  @override
  void paint(Canvas canvas, Offset offset, ImageConfiguration configuration) {
    // TODO: implement paint
    Paint _paint = Paint();
    _paint.color = color;
    _paint.isAntiAlias = true;
    final Offset circleOffset = Offset(configuration.size!.width/2 - radius/2,
        configuration.size!.height - radius);
    canvas.drawCircle(offset + circleOffset, radius, _paint);
  }

}
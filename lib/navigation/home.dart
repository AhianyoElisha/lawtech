import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:lawtech/misc/colors.dart';
import 'package:lawtech/widgets/app_text.dart';
import 'package:lawtech/widgets/app_text_large.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with TickerProviderStateMixin {
  @override
  Widget build(BuildContext context) {
    TabController _tabController = TabController(length: 4, vsync: this);
    return Scaffold(
      body: Column(
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
          const SizedBox(height: 30,),
          Container(
            margin: const EdgeInsets.only(left: 20),
            child: AppTextLarge(text: "Discover",),
          ),
          const SizedBox(height: 30,),
          TabBar(
            dividerColor: Colors.white,
            labelPadding: const EdgeInsets.only(left: 20, right: 20),
            labelColor: Colors.black,
            unselectedLabelColor: Colors.grey,
            isScrollable: true,
            indicatorSize: TabBarIndicatorSize.label,
            indicator: CircleTabIndicator(color: AppColors.mainColor, radius: 4),
            controller: _tabController,
            tabAlignment: TabAlignment.start,
            tabs: [
              Tab(text: "Places",),
              Tab(text: "Inspiration",),
              Tab(text: "Emotions",),
              Tab(text: "Necessary",),
            ],
          ),
          Container(
            padding: const EdgeInsets.only(left: 20),
            height: 300,
            width: double.maxFinite,
            child: TabBarView(
              controller: _tabController,
                children: [
                  ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: 3,
                    itemBuilder: (BuildContext context, int index) {
                      return Container(
                        margin: const EdgeInsets.only(right: 15, top: 10),
                        width: 200,
                        height: 300,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            color: Colors.white,
                            image: const DecorationImage(
                              image: AssetImage("img/mountain.jpeg"),
                              fit: BoxFit.cover,
                            )
                        ),
                      );
                    }
                  ),
                  Text("There"),
                  Text("Bye"),
                  Text("Hello"),
                ]),
          ),
          const SizedBox(height: 30,),
          Container(
            padding: const EdgeInsets.only(left: 20, right: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                AppTextLarge(text: "Explore", size: 22,),
                AppText(text: "See all", color: AppColors.textColor1,)
              ],
            ),
          )
        ],
      ),
    );
  }
}



class CircleTabIndicator extends Decoration {
  final Color color;
  double radius;

  CircleTabIndicator({required this.color, required this.radius});
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
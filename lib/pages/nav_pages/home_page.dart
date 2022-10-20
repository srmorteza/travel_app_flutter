import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:travel/misc/colors.dart';
import 'package:travel/widgets/app_large_text.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with TickerProviderStateMixin {

  @override
  Widget build(BuildContext context) {
    TabController _tabController =TabController(length: 3, vsync: this);
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: const EdgeInsets.only(top: 70, left: 20),
            child: Row(
              children: [
                Icon(
                  Icons.menu,
                  size: 30,
                  color: Colors.black54,
                ),
                Expanded(child: Container()),
                Container(
                  margin: const EdgeInsets.only(right: 20),
                  width: 50,
                  height: 50,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Colors.grey.withOpacity(0.5),
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: 40),
          Container(
            margin: const EdgeInsets.only(left: 20),
            child: AppLargeText(text: "Discover"),
           ),
          SizedBox(height: 30),
          // tabbar view
          Container(
            child: Align(
              alignment: Alignment.centerLeft,
              child: TabBar(
                labelColor: Colors.black,
                unselectedLabelColor: Colors.grey,
                controller: _tabController,
                isScrollable: true,
                labelPadding:const EdgeInsets.only(left: 20,right: 0),
                indicatorSize: TabBarIndicatorSize.label,
                indicator: CirculeTabIndicator(color: AppColors.mainColor , radius: 4) ,
                tabs: [
                  Tab(text: "Places"),
                  Tab(text: "Insprations"),
                  Tab(text: "Emotions",),
                ],
              ),
            ),
          ),
          Container(
            padding: const EdgeInsets.only(left: 20),
            height: 300,
            width: double.maxFinite,
            child: TabBarView(
              controller: _tabController,
              children: [
                ListView.builder(
                  itemCount:3,
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (BuildContext context, int index) {
                    return Container(
                      margin: const EdgeInsets.only(right: 10,top: 10),
                      width: 200,
                      height: 300,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          color: Colors.white ,
                          image: DecorationImage(
                              image: AssetImage(
                                  "img/mountain.jpeg"
                              ),
                              fit: BoxFit.cover
                          )
                      ),
                    );
                  },

                ),
                Text("there"),
                Text("bye"),
              ],
            ),
          ),
        ],
      ),
    );
  }
}



class CirculeTabIndicator extends Decoration{
  final Color color ;
  double radius ;
  CirculeTabIndicator({required this .color , required this.radius});

  @override
  BoxPainter createBoxPainter([VoidCallback? onChanged]) {
    // TODO: implement createBoxPainter
   return _CirculePainter(color:color , radius:radius) ;
  }

}

class _CirculePainter extends BoxPainter{
  final Color color ;
  double radius ;
  _CirculePainter({required this .color , required this.radius});

  @override
  void paint(Canvas canvas, Offset offset, ImageConfiguration configuration) {
    Paint _paint=Paint();
    _paint.color=color ;
    _paint.isAntiAlias=true ;
    final Offset circuleOffset= Offset(configuration.size!.width/1.6-radius/2 , configuration.size!.height-radius);

    canvas.drawCircle(offset+circuleOffset, radius, _paint) ;
  }

}
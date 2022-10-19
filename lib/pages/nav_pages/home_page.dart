import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
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
                indicator: ,
                tabs: [
                  Tab(text: "Places"),
                  Tab(text: "Insprations"),
                  Tab(text: "Emotions",),
                ],
              ),
            ),
          ),
          Container(
            height: 300,
            width: double.maxFinite,
            child: TabBarView(
              controller: _tabController,
              children: [
                Text("hi"),
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
  @override
  BoxPainter createBoxPainter([VoidCallback? onChanged]) {
    // TODO: implement createBoxPainter
    throw UnimplementedError();
  }

}

class _CirculePainter extends BoxPainter{
  @override
  void paint(Canvas canvas, Offset offset, ImageConfiguration configuration) {
    // TODO: implement paint
  }

}
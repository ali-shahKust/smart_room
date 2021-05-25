import 'package:flutter/material.dart';
import 'package:smart_room/screens/lights.dart';
import 'package:smart_room/utils/apptheme.dart';

class Control_Center extends StatefulWidget {
  @override
  _Control_CenterState createState() => _Control_CenterState();
}

class _Control_CenterState extends State<Control_Center> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Apptheme.background,
      appBar: AppBar(
        leading: IconButton(onPressed: () { Navigator.pop(context); }, icon: Icon(Icons.arrow_back_ios,color: Colors.black,),) ,

        elevation: 0,
        title: Text("Control Center",style: TextStyle(fontSize: 20,color: Colors.black),),centerTitle: true,backgroundColor: Color(0xffF3F3F6),),

      body: DefaultTabController(
        length: 4,
        child: Container(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          child: Column(
            children: [
              topTabBar(),

              Expanded(child: TabBarView(children: [
                Lights(),Lights(),Lights(),Lights(),
              ],))
            ],
          ),
        ),
      ),
    );
  }

  Widget topTabBar() {
    return Padding(
      padding: const EdgeInsets.all(12.0),
      child: Container(
        height: 70,
        color: Colors.transparent,
        child: Stack(
          children: <Widget>[
            TabBar(
              indicatorColor: Colors.black,
              labelColor: Colors.black54,
              indicator: UnderlineTabIndicator(
                  borderSide: BorderSide(width: 2.0),
                  insets: EdgeInsets.symmetric(horizontal:36.0)
              ),
              unselectedLabelColor: Colors.grey,
              tabs: [
                Tab(
                  child: Text('Lights'),
                ),
                Tab(
                  child: Text('Devices'),
                ),
                Tab(
                  child: Text('Heating'),
                ),
                Tab(
                  child: Text('Security'),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}

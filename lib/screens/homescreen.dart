import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:perfomancereview/provider/provider.dart';
import 'package:perfomancereview/screens/storiesscreen.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<dataProvider>(context, listen: false);
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.grey,
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Align(
                alignment: Alignment.topLeft,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text('Learn'),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  color: Colors.transparent,
                  height: ScreenUtil().setHeight(200),
                  width: MediaQuery.of(context).size.width - 10,
                  child: ListView.builder(
                      shrinkWrap: true,
                      scrollDirection: Axis.horizontal,
                      itemCount: provider.data.home.stories.length,
                      itemBuilder: (_, index) {
                        return Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: GestureDetector(
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => StoriesScreen(
                                      index: index,
                                    ),
                                  ));
                            },
                            child: Container(
                              decoration: BoxDecoration(
                                color: Colors.white,
                                border: Border.all(
                                    color: Color(int.parse(provider
                                        .data.home.stories[index].borderColor
                                        .replaceAll(
                                            '#', '0xff'))), // Set border color
                                    width: 3.0), // Set border width
                                borderRadius: BorderRadius.all(Radius.circular(
                                    10.0)), // Set rounded corner radius
                              ),
                              height: ScreenUtil().setHeight(300),
                              width: ScreenUtil().setWidth(150),
                              child: Stack(
                                alignment: Alignment.center,
                                textDirection: TextDirection.rtl,
                                fit: StackFit.expand,
                                children: [
                                  Positioned(
                                    //left: 55.w,
                                    //bottom: 50.h,
                                    child: FadeInImage.assetNetwork(
                                      height: ScreenUtil().setHeight(200),
                                      width: ScreenUtil().setWidth(100),
                                      fit: BoxFit.fill,
                                      placeholder: 'images/loadintrans.gif',
                                      image: provider
                                          .data.home.stories[index].cornerImageUrl,
                                    ),
                                  ),
                                  Positioned(
                                    left: 35.w,
                                    top: 30.h,
                                    child: FadeInImage.assetNetwork(
                                      height: ScreenUtil().setHeight(80),
                                      width: ScreenUtil().setWidth(80),
                                      fit: BoxFit.contain,
                                      placeholder: 'images/loadintrans.gif',
                                      image: provider
                                          .data.home.stories[index].iconUrl,
                                    ),
                                  ),
                                  Positioned(
                                    left: 0,
                                    right: 0,
                                    top: 130.h,
                                    bottom: 0,
                                    child: SizedBox(
                                      height: ScreenUtil().setHeight(50),
                                      width: ScreenUtil().setWidth(100),
                                      child: Text(
                                        provider.data.home.stories[index].name,
                                        textAlign: TextAlign.center,
                                        style: TextStyle(
                                            fontWeight: FontWeight.w600,
                                            color: Colors.black38),
                                      ),
                                    ),
                                  )
                                ],
                              ),
                            ),
                          ),
                        );
                      }),
                ),
              ),
              Align(
                alignment: Alignment.topLeft,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text('Popular'),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

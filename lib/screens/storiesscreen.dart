import 'package:flutter/material.dart';
import 'package:perfomancereview/provider/provider.dart';
import 'package:provider/provider.dart';
import 'package:story/story.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class StoriesScreen extends StatelessWidget {
  final int index;
  const StoriesScreen({Key? key, required this.index}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var pageContent = Provider.of<dataProvider>(context, listen: false)
        .data
        .home
        .stories[index];
    return Scaffold(
      body: StoryPageView(
        itemBuilder: (context, pageIndex, storyIndex) {
          return Container(
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            color: Color(
              int.parse(
                pageContent.pages[storyIndex].backgroundColor
                    .replaceAll('#', '0xff'),
              ),
            ),
            child: Stack(
              alignment: Alignment.center,
              textDirection: TextDirection.rtl,
              fit: StackFit.loose,
              children: [
                Positioned(
                  left: 0,
                  right: 0,
                  top: 0,
                  bottom: MediaQuery.of(context).size.height - 120.h,
                  child: SizedBox(
                    height: 50.h,
                    width: MediaQuery.of(context).size.width,
                    child: FadeInImage.assetNetwork(
                      placeholder: 'images/loadintrans.gif',
                      image:pageContent.pages[storyIndex]
                          .topImageUrl,
                    ),
                  ),
                ),
                Positioned(
                  left: 0,
                  right: 0,
                  top: 200.h,
                  bottom: 0,
                  child: SizedBox(
                    height: 50,
                    width: 100,
                    child: Padding(
                      padding: const EdgeInsets.all(18.0),
                      child: Column(
                        children: [
                          StoriesTextWidget(
                            index: index,
                            storyindex: storyIndex,
                          ),
                          SizedBox(
                            height: 30,
                          ),
                          StoriesTextWidget(
                            index: index,
                            storyindex: storyIndex,
                          )
                        ],
                      ),
                    ),
                  ),
                ),
                Positioned(
                  left: 0,
                  right: 0,
                  top: MediaQuery.of(context).size.height - 150,
                  bottom: 0,
                  child: FadeInImage.assetNetwork(
                    fit: BoxFit.fill,
                    width: MediaQuery.of(context).size.width,
                    placeholder: 'images/loadintrans.gif',
                    image: pageContent.pages[storyIndex]
                        .bottomImageUrl,
                  ),
                ),
              ],
            ),
          );
        },
        storyLength: (pageIndex) {
          return pageContent.pages.length;
        },
        pageLength: 1,
        onPageLimitReached: () {
          Navigator.pop(context);
        },
      ),
    );
  }
}

class StoriesTextWidget extends StatelessWidget {
  final int index;
  final storyindex;
  const StoriesTextWidget({Key? key, required this.index, this.storyindex})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    var page = Provider.of<dataProvider>(context, listen: false)
        .data
        .home
        .stories[index]
        .pages[storyindex];
    return Text(
      page.texts[1].text,
      textAlign: TextAlign.center,
      style: TextStyle(
        fontWeight:
            page.texts[1].bold == 'false' ? FontWeight.w700 : FontWeight.bold,
        color: page.textColor == ''
            ? Colors.black
            : Color(
                int.parse(
                  page.textColor.replaceAll('#', '0xff'),
                ),
              ),
      ),
    );
  }
}

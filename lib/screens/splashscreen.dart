import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:perfomancereview/provider/provider.dart';
import 'package:perfomancereview/screens/homescreen.dart';
import 'package:provider/provider.dart';
import 'package:http/http.dart' as http;
import 'package:perfomancereview/model/storymodel.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  //late Future getDetails;
  bool isFetchSuccess = false;

  @override
  void initState() {
    super.initState();
    //getDetails = Provider.of<dataProvider>(context, listen: false).getDetails();
  }

   getDetails() async {
    Uri url = Uri.parse(
        "https://forking.riafy.in/story-console/get-stories-api.php?page=home&type=home&appname=com.rstream.crafts&lang=en");

    // Await the http get response, then decode the json-formatted response.
    final response = await http.get(
      url,
    );

    if (response.statusCode == 200) {
      final storiesobj = storiesFromJson(response.body);
      print(storiesobj.home.stories);
      Provider.of<dataProvider>(context, listen: false).data = storiesobj;
      isFetchSuccess= true;
    } else {
      print('Request failed with status: ${response.statusCode}.');
      isFetchSuccess= false;
    }
  }

  @override
  Widget build(BuildContext context) {
    ScreenUtil.init(
        BoxConstraints(
            maxWidth: MediaQuery.of(context).size.width,
            maxHeight: MediaQuery.of(context).size.height),
        designSize: Size(360, 690),
        orientation: Orientation.portrait);
    return Scaffold(
      body: FutureBuilder(
        future: getDetails(),
        builder: (context, snapshot) {
          var provider = Provider.of<dataProvider>(context, listen: false);
          if (snapshot.connectionState == ConnectionState.done) {
            if (!isFetchSuccess) {
              return Center(child: Text('Sorry..Something went wrong'));
            } else {
              return HomeScreen();
            }
          } else if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: Text('Please wait its loading...'));
          } else
            return Center(child: Text('Error: ${snapshot.error}'));
        },
      ),
    );
  }
}

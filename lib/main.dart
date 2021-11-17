import 'package:flutter/material.dart';
import 'package:perfomancereview/provider/provider.dart';
import 'package:perfomancereview/screens/splashscreen.dart';
import 'package:provider/provider.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();

  runApp(
    MultiProvider(
      providers: [ChangeNotifierProvider.value(value: dataProvider())],
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: Size(360, 690),
      builder: () => MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          textTheme: TextTheme(
              //To support the following, you need to use the first initialization method
              button: TextStyle(fontSize: 45.sp)),
          primarySwatch: Colors.blue,
        ),
        routes: {
          // When navigating to the "/" route, build the FirstScreen widget.
          '/': (context) => SplashScreen(),
          // When navigating to the "/second" route, build the SecondScreen widget.
        },
      ),
    );
  }
}

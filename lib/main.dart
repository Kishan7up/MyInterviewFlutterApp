import 'package:flutter/material.dart';
import 'package:kishanrathoddemoapp/screens/home_screen.dart';
import 'package:kishanrathoddemoapp/screens/splash_screen.dart';
import 'package:kishanrathoddemoapp/utils/generate_utils.dart';

void main() {
  runApp(MyApp());
}



class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();

  ///handles screen transaction based on route name
  static MaterialPageRoute globalGenerateRoute(RouteSettings settings) {
    //if screen have no argument to pass data in next screen while transiting
    // final GlobalKey<ScaffoldState> key = settings.arguments;

    switch (settings.name) {



      case SplashScreen.routeName:
        return getMaterialPageRoute(SplashScreen());


      case HomeScreen.routeName:
        return getMaterialPageRoute(HomeScreen());


      default:
        return getMaterialPageRoute(SplashScreen());
    }



  }
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        onGenerateRoute: MyApp.globalGenerateRoute,
        debugShowCheckedModeBanner: false,
        supportedLocales: [
          Locale('en', 'US'),
        ],

        localeResolutionCallback: (locale, supportedLocales) {

          return supportedLocales.first;
        },
        title: "Flutter base app",
        initialRoute: getInitialRoute());
  }

  ///returns initial route based on condition of logged in/out
  getInitialRoute() {


    return SplashScreen.routeName;


  }
}

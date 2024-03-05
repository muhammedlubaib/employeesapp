import 'package:employeesapp/helper/env/development_env.dart';
import 'package:employeesapp/helper/env/env.dart';
import 'package:employeesapp/helper/env/production_end.dart';
import 'package:employeesapp/helper/env/staging_env.dart';
import 'package:employeesapp/res/style/app_theme.dart';
import 'package:employeesapp/res/style/color.dart';
import 'package:employeesapp/utils/custom_snackbar.dart';

import 'package:employeesapp/utils/routes/app_route.dart';
import 'package:employeesapp/view/login/login_screen_view.dart';
import 'package:employeesapp/view_model/auth_view_model/auth_view_model.dart';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

final globalNavigatorKey = GlobalKey<NavigatorState>();
final _messangerKey = GlobalKey<ScaffoldMessengerState>();

// void main() {
//   runApp(const MyApp());
// }

void main() => getEnvironment();

getEnvironment() async {
  WidgetsFlutterBinding.ensureInitialized();
  SharedPreferences prefs = await SharedPreferences.getInstance();
// 0 - Development, 1 - Staging, 2 - Production
  // fetch environment value in const variable only.
  // set configuration --dart-define=ENVIRONMENT_TYPE=1
  // default production environment will be loaded.
  const environment = int.fromEnvironment(
    'ENVIRONMENT_TYPE',
    defaultValue: 1,
  );
  switch (EnvironmentType.values[environment]) {
    case EnvironmentType.development:
      return DevelopmentEnv();
    case EnvironmentType.staging:
      return StagingEnv();
    case EnvironmentType.production:
      return ProductionEnv();
    default:
      return ProductionEnv();
  }
}

// class MyApp extends StatelessWidget {
//   const MyApp();

//   @override
//   Widget build(BuildContext context) {
//     return MultiProvider(
//       providers: [
//         ChangeNotifierProvider(create: (_) => LoginProvider()),
//       ],
//       child: MaterialApp(
//         key: globalNavigatorKey,
//         onGenerateRoute: AppRoute.onGenerateRoute,
//         debugShowCheckedModeBanner: false,
//         title: 'Flutter Demo',
//         theme: AppThemeData.lightTheme,

//         // home: //
//         //     LoginScreen()
//       ),
//     );
//   }
// }

class MyApp extends StatefulWidget {
  final Env env;

  const MyApp({super.key, required this.env});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  void initState() {
    // SystemChrome.setSystemUIOverlayStyle(
    //   const SystemUiOverlayStyle(statusBarColor: ColorResources.PRIMARY),
    // );
    // SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
    //   systemNavigationBarColor: ColorResources.PRIMARY, // navigation bar color
    //   statusBarColor: ColorResources.PRIMARY, // status bar color
    // ));

    // SystemChrome.setPreferredOrientations([
    //   DeviceOrientation.portraitUp,
    //   DeviceOrientation.portraitDown,
    // ]);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    // FirebaseAnalytics analytics = FirebaseAnalytics.instance;
    // FirebaseAnalyticsObserver observer =
    //     FirebaseAnalyticsObserver(analytics: analytics);

    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => LoginProvider()),
        // ChangeNotifierProvider(create: (_) => CountryPickerProvider()),
      ],
      child: MaterialApp(
        // navigatorObservers: [observer],
        navigatorKey: globalNavigatorKey,
        debugShowCheckedModeBanner: false,

        onGenerateRoute: AppRoute.onGenerateRoute,
        theme: AppThemeData.lightTheme,
        supportedLocales: const [Locale('en', 'IN')],
        locale: const Locale('en', 'IN'),
        // title: AppConstants.appTitle,
      ),
    );
  }
}


// class MyHomePage extends StatefulWidget {
//   const MyHomePage({super.key, required this.title});

//   final String title;

//   @override
//   State<MyHomePage> createState() => _MyHomePageState();
// }

// class _MyHomePageState extends State<MyHomePage> {
//   int _counter = 0;

//   void _incrementCounter() {
//     setState(() {
//       _counter++;
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         backgroundColor: CustomColor.primary,
//         title: Text(widget.title),
//       ),
//       body: Center(
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: <Widget>[
//             const Text(
//               'You have pushed the button this many times:',
//             ),
//             Text(
//               '$_counter',
//               style: Theme.of(context).textTheme.headlineMedium,
//             ),
//           ],
//         ),
//       ),
//       floatingActionButton: FloatingActionButton(
//         backgroundColor: CustomColor.buttonColor,
//         onPressed: _incrementCounter,
//         tooltip: 'Increment',
//         child: const Icon(Icons.add),
//       ), // This trailing comma makes auto-formatting nicer for build methods.
//     );
//   }
// }

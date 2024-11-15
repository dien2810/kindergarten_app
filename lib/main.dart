import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:go_router/go_router.dart';
import 'package:kindergarten_app/src/features/student/screens/dan_thuoc/dan_thuoc_screen.dart';
import 'package:kindergarten_app/src/features/student/screens/homepage/pages/homepage_news.dart';
import 'package:kindergarten_app/src/features/student/screens/notifications/pages/notification_info.dart';
import 'package:kindergarten_app/src/features/student/screens/notifications/pages/notifications.dart';
import 'package:kindergarten_app/src/features/student/screens/remark/pages/remark.dart';
import 'package:kindergarten_app/src/features/student/screens/remark/pages/remark_info.dart';
import 'package:kindergarten_app/src/features/student/screens/survey/pages/survey.dart';
import 'package:kindergarten_app/src/features/student/screens/survey/pages/survey_info.dart';
import 'package:kindergarten_app/src/repository/authentication_repository/authentication_repository.dart';
import 'package:kindergarten_app/src/utils/theme.dart';

import 'firebase_options.dart';
import 'flutter_flow/debug_util.dart';
import 'flutter_flow/flutter_flow_theme.dart';
import 'flutter_flow/nav/nav.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform)
      .then((value) => Get.put(AuthenticationRepository()));
  runApp(const MyApp());
}
class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();

  static _MyAppState of(BuildContext context) =>
      context.findAncestorStateOfType<_MyAppState>()!;
}

class _MyAppState extends State<MyApp> {
  ThemeMode _themeMode = FlutterFlowTheme.themeMode;

  // late AppStateNotifier _appStateNotifier;
  late GoRouter _router;
  String getRoute([RouteMatch? routeMatch]) {
    final RouteMatch lastMatch =
        routeMatch ?? _router.routerDelegate.currentConfiguration.last;
    final RouteMatchList matchList = lastMatch is ImperativeRouteMatch
        ? lastMatch.matches
        : _router.routerDelegate.currentConfiguration;
    return matchList.uri.toString();
  }

  List<String> getRouteStack() =>
      _router.routerDelegate.currentConfiguration.matches
          .map((e) => getRoute(e))
          .toList();

  // late Stream<BaseAuthUser> userStream;
  //
  // final authUserSub = authenticatedUserStream.listen((_) {});

  @override
  void initState() {
    super.initState();

    // _appStateNotifier = AppStateNotifier.instance;
    // _router = createRouter(_appStateNotifier);
    // userStream = ecommerceFlowFirebaseUserStream()
    //   ..listen((user) {
    //     _appStateNotifier.update(user);
    //     debugLogAuthenticatedUser();
    //   });
    // jwtTokenStream.listen((_) {});
    // Future.delayed(
    //   const Duration(milliseconds: 1000),
    //       () => _appStateNotifier.stopShowingSplashImage(),
    // );

    // _router.routerDelegate.addListener(() {
    //   debugLogGlobalProperty(
    //     context,
    //     routePath: getRoute(),
    //     routeStack: getRouteStack(),
    //   );
    // });
  }

  @override
  void dispose() {
    // authUserSub.cancel();

    super.dispose();
  }
  void setThemeMode(ThemeMode mode) => setState(() {
    _themeMode = mode;
    FlutterFlowTheme.saveThemeMode(mode);
  });
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Kindergarten App',
      debugShowCheckedModeBanner: false,
      theme: TAppTheme.lightTheme,
      darkTheme: TAppTheme.darkTheme,
      themeMode: ThemeMode.light,
      //home: const SplashScreen(),
      home: const SurveyInfoWidget(),
      defaultTransition: Transition.leftToRightWithFade,
      transitionDuration: const Duration(milliseconds: 500),
    );
  }
}

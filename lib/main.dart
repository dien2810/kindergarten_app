import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:go_router/go_router.dart';
import 'package:kindergarten_app/src/features/authentication/screens/login_screen/login_screen.dart';
// import 'package:go_router/go_router.dart';
import 'package:kindergarten_app/src/utils/theme.dart';
import 'firebase_options.dart';
import 'flutter_flow/flutter_flow_theme.dart';

void main()  async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
      // .then((value) => Get.put(AuthenticationRepository()));
  runApp(const MyApp());
}

// class MyApp extends StatelessWidget {
//   const MyApp({super.key});
//
//   // This widget is the root of your application.
//   @override
//   Widget build(BuildContext context) {
//     return GetMaterialApp(
//       title: 'Kindergarten App',
//       debugShowCheckedModeBanner: false,
//       theme: TAppTheme.lightTheme,
//       darkTheme: TAppTheme.darkTheme,
//       themeMode: ThemeMode.light,
//       //home: const SplashScreen(),
//       //home: const DanThuocScreen(),
//       //home : const ThongTinHocSinhScreen(),
//       //home: const NgoaiKhoaScreen(),
//       home: const LoginScreen(),
//       //home:  const DanhSachClbScreen(),
//       //home: ThongTinSucKhoeScreen(),
//       defaultTransition: Transition.leftToRightWithFade,
//       transitionDuration: const Duration(milliseconds: 500),
//     );
//   }
// }

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
      home: const LoginScreen(),
      defaultTransition: Transition.leftToRightWithFade,
      transitionDuration: const Duration(milliseconds: 500),
    );
  }
}

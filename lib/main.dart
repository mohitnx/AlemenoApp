import 'package:alemenotest/src/presentation/eating/states/animal_provider.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';

import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:camera/camera.dart';
import 'package:provider/provider.dart';

import 'src/presentation/eating/screens/home_screen.dart';
import 'package:alemenotest/routes.dart';

FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
    FlutterLocalNotificationsPlugin();
Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  //initializeing things like camera, firebase, notification, etc
  await Firebase.initializeApp();
  final cameras = await availableCameras();
  const AndroidInitializationSettings initializationSettingsAndroid =
      AndroidInitializationSettings("@mipmap/ic_launcher");
  const InitializationSettings initializationSettings = InitializationSettings(
    android: initializationSettingsAndroid,
  );
  bool? initialized = await flutterLocalNotificationsPlugin.initialize(
    initializationSettings,
  );

  //returns true if everyting intialized successfully
  debugPrint(initialized.toString());
  runApp(MultiProvider(
      providers: [
        ChangeNotifierProvider<AnimalProvider>(
          create: ((context) => AnimalProvider()),
        )
      ],
      child: MyApp(
        cameras: cameras,
      )));
}

class MyApp extends StatelessWidget {
  final List<CameraDescription>? cameras;
  const MyApp({super.key, this.cameras});
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(396, 880),
      minTextAdapt: true,
      builder: (context, child) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Alemeno Test App',
          theme: ThemeData(
            useMaterial3: true,
            //increasng the appbar height to accomade the padding for back button according to the figma design
            appBarTheme: AppBarTheme(
              toolbarHeight: 100.h,
            ),
          ),
          home: HomeScreen(
            cameras: cameras,
          ),
          onGenerateRoute: (settings) => generateRoute(settings),
        );
      },
    );
  }
}

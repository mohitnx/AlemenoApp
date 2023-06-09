import 'package:alemenotest/src/presentation/eating/screens/confirm_picture.dart';
import 'package:alemenotest/src/presentation/eating/screens/fullscreen_image.dart';
import 'package:alemenotest/src/presentation/eating/screens/meals_history.dart';
import 'package:alemenotest/src/presentation/eating/screens/message_screen.dart';
import 'package:camera/camera.dart';
import 'package:flutter/material.dart';

import 'package:alemenotest/src/presentation/eating/screens/picture_screen.dart';

Route<dynamic> generateRoute(RouteSettings routeSettings) {
  switch (routeSettings.name) {
    case PictureScreen.routeName:
      var cameras = routeSettings.arguments as List<CameraDescription>;
      return MaterialPageRoute(
        settings: routeSettings,
        builder: (_) => PictureScreen(cameras: cameras),
      );

    case MealsHistory.routeName:
      return MaterialPageRoute(
        settings: routeSettings,
        builder: (_) => const MealsHistory(),
      );

    case FullScreen.routeName:
      String imagesUrl = routeSettings.arguments as String;
      return MaterialPageRoute(
        settings: routeSettings,
        builder: (_) => FullScreen(imageUrl: imagesUrl),
      );

    case MessageScreen.routeName:
      return MaterialPageRoute(
        settings: routeSettings,
        builder: (_) => const MessageScreen(),
      );

    case ConfirmPicture.routeName:
      var path = routeSettings.arguments as String;
      return MaterialPageRoute(
        settings: routeSettings,
        builder: (_) => ConfirmPicture(imagePath: path),
      );

    default:
      return MaterialPageRoute(
        settings: routeSettings,
        builder: (_) => const Scaffold(
          body: Center(
            child: Text('Such a page doesnot exist'),
          ),
        ),
      );
  }
}

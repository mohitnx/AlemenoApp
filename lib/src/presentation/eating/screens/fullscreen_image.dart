import 'package:alemenotest/src/constants/constants.dart';
import 'package:flutter/material.dart';

class FullScreen extends StatelessWidget {
  static const String routeName = '/full-screen';
  final String imageUrl;

  const FullScreen({super.key, required this.imageUrl});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: primaryColor,
      body: Center(
        child: InteractiveViewer(
          panEnabled: true,
          minScale: 0.3,
          maxScale: 4,
          child: Image.network(
            imageUrl,
          ),
        ),
      ),
    );
  }
}

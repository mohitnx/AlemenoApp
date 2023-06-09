import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

Widget borderLine(angle) {
  return Transform.rotate(
    angle: angle,
    child: Stack(
      children: [
        SvgPicture.asset(
          'assets/images/vertical_line.svg',
        ),
        SvgPicture.asset(
          'assets/images/horizontal_line.svg',
        )
      ],
    ),
  );
}

import "package:flutter/material.dart";
import 'package:flutter_svg/flutter_svg.dart';

class SocialAuth extends StatelessWidget {
  final String iconPath;
  final String label;
  final Function onPressed;
  SocialAuth({@required this.iconPath, this.label, @required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return FlatButton(
        onPressed: onPressed,
        child: SvgPicture.asset(
          iconPath,
          semanticsLabel: label,
          width: 40.0,
          height: 40.0,
        ));
  }
}

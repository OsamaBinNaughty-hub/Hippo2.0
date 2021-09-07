import 'package:flutter/material.dart';
class CircleAvatarWithIcon extends StatelessWidget {
  final IconData icon;
  Color? color = null;
  CircleAvatarWithIcon({Key? key, required this.icon, this.color}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      child: Icon(
        icon,
        size: 15,
        color: Colors.white,
      ),
      radius: 13,
      backgroundColor: _backgroundColor(color),
    );
  }
  Color _backgroundColor(Color? color){
    if(color == null){
      return Color(0xff4285F4);
    } else {
      return color;
    }
  }
}

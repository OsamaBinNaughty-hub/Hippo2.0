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
class CircleAvatarWithDay extends StatelessWidget {
  final String text;
  Color? color = null;
  bool? chosen = null;
  CircleAvatarWithDay({Key? key, required this.text, this.color, this.chosen}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      child: Text(
        "${text}",
        style: TextStyle(
          color: _textColor(color),
          fontWeight: FontWeight.bold,
          fontSize: 15,
        ),
      ),
      radius: 13,
      backgroundColor: _backgroundColor(color),
    );
  }
  Color _backgroundColor(Color? color){
    if(chosen == false || color == null){
      return Colors.white;
    } else {
      return color;
    }
  }

  Color _textColor(Color? color){
    if(chosen == false || color == null){
      return Colors.black.withOpacity(0.6);
    } else {
      return Colors.white;
    }
  }
}



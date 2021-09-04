import 'package:flutter/material.dart';
class CircleAvatarWithIcon extends StatelessWidget {
  final IconData icon;
  const CircleAvatarWithIcon({Key? key, required this.icon}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      child: Icon(
        icon,
        size: 15,
      ),
      radius: 13,
    );
  }
}

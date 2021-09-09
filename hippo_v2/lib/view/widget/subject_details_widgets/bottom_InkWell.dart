import 'package:flutter/material.dart';

class BottomInkWell extends StatelessWidget {
  final String title;
  final VoidCallback onTap;
  const BottomInkWell({Key? key, required this.title, required this.onTap}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          border: Border(
            top: BorderSide(
                color: Colors.grey.withOpacity(0.2)
            ),
          ),
        ),
        width: double.infinity,
        child: ListTile(
          leading: Icon(Icons.arrow_forward),
          title: Text("${title}", style: TextStyle(color: Colors.black.withOpacity(0.5)),),
        ),
      ),
    );
  }
}

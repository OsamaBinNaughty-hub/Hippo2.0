import 'package:flutter/material.dart';

class Header extends StatelessWidget {
  final List<String>? dates;
  Header(this.dates);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 40,
      child: Card(
        margin: EdgeInsets.fromLTRB(0, 0, 0, 2),
        child: Row(
          children: dates
              .map((day) => Expanded(child: Center(child: Text(day))))
              .toList()
        ),
        elevation: 8,
      ),
    );
  }
}

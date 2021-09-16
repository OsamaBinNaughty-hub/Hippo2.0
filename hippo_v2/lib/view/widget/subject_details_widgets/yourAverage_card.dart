import 'package:flutter/material.dart';
import 'package:hippo_v2/model/subjects.dart';
import 'package:hippo_v2/view/widget/subject_details_widgets/bottom_InkWell.dart';
import 'package:percent_indicator/percent_indicator.dart';

import '../circle_avatar_icon.dart';

class YourAverageCard extends StatefulWidget {
  final Subject subject;
  const YourAverageCard({Key? key, required this.subject}) : super(key: key);

  @override
  _YourAverageCardState createState() => _YourAverageCardState();
}

class _YourAverageCardState extends State<YourAverageCard> {
  @override
  Widget build(BuildContext context) {
    return Card(
      clipBehavior: Clip.antiAlias,
      child: Column(
        children: [
          ListTile(
            leading: CircleAvatarWithIcon(
              icon: Icons.show_chart_outlined,
              color: widget.subject.color,
            ),
            title: Text(
              "Your average",
              style: TextStyle(
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CircularPercentIndicator(
                radius: 90,
                lineWidth: 9.0,
                animation: true,
                animationDuration: 2000,
                percent: 0.9/*widget.subject.percentOfWeightedGrade(grade)*/,
                circularStrokeCap: CircularStrokeCap.round,
                progressColor: Color(0xff18ba7f)/*widget.subject.progressColorOfGrade(grade)*/,
                backgroundColor: Color(0x4D18ba7f)/*widget.subject.backgroundColorOfGrade(grade)*/,
                center: Text(
                  "${18/*widget.subject.totalGradeString(grade)*/}",
                  style: TextStyle(
                    color: Colors.black.withOpacity(0.6),
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              SizedBox(width: 3*8,),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "${/*widget.subject.totalGradeString(theoryGrade)*/18}",
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 22),
                  ),
                  Text(
                    "Theory",
                    style: TextStyle(color: Colors.black.withOpacity(0.6)),
                  ),
                ],
              ),
              SizedBox(width: 3*8,),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "${/*widget.subject.totalGradeString(practicalGrade)*/18}",
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 22),
                  ),
                  Text(
                    "Practical",
                    style: TextStyle(color: Colors.black.withOpacity(0.6)),
                  ),
                ],
              ),
              SizedBox(width: 3*8,),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "${/*widget.subject.totalGradeString(oralGrade)*/18}",
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 22),
                  ),
                  Text(
                    "Oral",
                    style: TextStyle(color: Colors.black.withOpacity(0.6)),
                  ),
                ],
              ),
            ],
          ),
          SizedBox(height: 16.0,),
          BottomInkWell(title: "Edit", onTap: (){})
        ],
      ),
    );
  }
}

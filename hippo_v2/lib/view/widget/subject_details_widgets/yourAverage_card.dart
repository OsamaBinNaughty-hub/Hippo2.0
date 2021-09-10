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
    double? grade = weightedGrade(widget.subject.writtenGrade, widget.subject.practicalGrade, widget.subject.oralGrade);
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
                percent: percentOfWeightedGrade(grade),
                circularStrokeCap: CircularStrokeCap.round,
                progressColor: progressColorOfGrade(grade),
                backgroundColor: backgroundColorOfGrade(grade),
                center: Text(
                  "${weightedGradeOn20(grade)}",
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
                  _grade(widget.subject.writtenGrade),
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
                  _grade(widget.subject.practicalGrade),
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
                  _grade(widget.subject.oralGrade),
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

  double percentOfWeightedGrade(double? weightedGrade){
    if(weightedGrade == null){
      return 0.01;
    } else {
      return weightedGrade/2/10;
    }
  }

  Color progressColorOfGrade(double? weightedGrade){
    if(weightedGrade != null){
      if(weightedGrade >= 10){
        return Color(0xff18ba7f);
      } else {
        return Color(0xffffcc00);
      }
    } else {
      return Color(0xffbababa);
    }
  }

  Color backgroundColorOfGrade(double? weightedGrade){
    if(weightedGrade != null){
      if(weightedGrade >= 10){
        return Color(0x4D18ba7f);
      } else {
        return Color(0x4Dffcc00);
      }
    } else {
      return Color(0x4Dbababa);
    }
  }

  String weightedGradeOn20(double? weightedGrade){
    if(weightedGrade == null){
      return "-";
    } else {
      return "${weightedGrade}";
    }
  }

  Widget _grade(double? grade){
    if(grade == null){
      return Text("-", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 22),);
    } else {
      return Text("${grade}", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 22),);
    }
  }

  // TODO: This code is so shit. It's 2 o'clock at night... give me a break plz
  double? weightedGrade(double? writtenGrade, double? practicalGrade, double? oralGrade){
    String ans = '';
    if(writtenGrade == null){
      if(practicalGrade == null){
        if(oralGrade == null){
          return null;
        } else {
          ans = (oralGrade).toStringAsFixed(1);
        }
      } else {
        if(oralGrade == null){
          ans = (practicalGrade).toStringAsFixed(1);
        } else {
          ans = ((practicalGrade + oralGrade)/2).toStringAsFixed(1);
        }
      }
    } else {
      if(practicalGrade == null && oralGrade == null){
        ans = (writtenGrade).toStringAsFixed(1);
      }
      if(practicalGrade == null && oralGrade != null){
        ans = ((writtenGrade + oralGrade)/2).toStringAsFixed(1);
      }
      if(oralGrade == null && practicalGrade != null){
        ans = ((writtenGrade+practicalGrade)/2).toStringAsFixed(1);
      }
      if(practicalGrade != null && oralGrade != null){
        ans = ((writtenGrade+practicalGrade+oralGrade)/3).toStringAsFixed(1);
      }
    }

    return double.parse(ans);

  }

}

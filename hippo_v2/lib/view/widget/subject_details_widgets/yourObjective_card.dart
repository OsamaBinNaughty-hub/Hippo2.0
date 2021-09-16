import 'package:flutter/material.dart';
import 'package:hippo_v2/model/subjects.dart';
import 'package:hippo_v2/view/widget/subject_details_widgets/bottom_InkWell.dart';
import 'package:percent_indicator/percent_indicator.dart';

class YourObjectiveCard extends StatefulWidget {
  final Subject subject;
  const YourObjectiveCard({Key? key, required this.subject}) : super(key: key);

  @override
  _YourObjectiveCardState createState() => _YourObjectiveCardState();
}

class _YourObjectiveCardState extends State<YourObjectiveCard> {
  @override
  Widget build(BuildContext context) {
    return Card(
      clipBehavior: Clip.antiAlias,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Padding(
            padding: EdgeInsets.fromLTRB(16.0, 16.0, 16.0, 0.0),
            child: Column(
              children: [
                LinearPercentIndicator(
                  width: MediaQuery.of(context).size.width-9*8, // TODO: how does this look on different phones?
                  animation: true,
                  lineHeight: 20.0,
                  animationDuration: 2000,
                  percent: 0.9/*widget.subject.percentTillObjective(grade, objective)*/,
                  animateFromLastPercent: true,
                  center: Text("90%")/*widget.subject.objectivePercentage(widget.subject.percentTillObjective(grade, objective),)*/,
                  linearStrokeCap: LinearStrokeCap.roundAll,
                  progressColor: Color(0xff18ba7f)/*widget.subject.progressColorOfGrade(grade)*/,
                  backgroundColor: Color(0x4D18ba7f)/*widget.subject.backgroundColorOfGrade(grade)*/,
                  maskFilter: MaskFilter.blur(BlurStyle.solid, 3),
                ),
                SizedBox(height: 8.0,),
                Row(
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("Your average", style: TextStyle(color: Colors.black.withOpacity(0.6), fontSize: 12)),
                        SizedBox(height: 4.0,),
                        Text("${18/*widget.subject.totalGradeString(grade)*/}", style: TextStyle(color: Colors.black.withOpacity(0.6), fontWeight: FontWeight.bold, fontSize: 17),)
                      ],
                    ),
                    Spacer(),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("Your objective", style: TextStyle(color: Colors.black.withOpacity(0.6), fontSize: 12)),
                        SizedBox(height: 4.0,),
                        Text(
                          "${20/*widget.subject.totalGradeString(objective)*/}",
                          style: TextStyle(
                            color: Colors.black.withOpacity(0.6),
                            fontWeight: FontWeight.bold,
                            fontSize: 17
                          ),
                        )
                      ],
                    ),
                  ],
                ),
              ],
            ),
          ),
          SizedBox(height: 16.0,),
          BottomInkWell(
            title: "Edit",
            onTap: (){}, // TODO: Edit Objective with AlertDialog
          ),
        ],
      ),
    );
  }



}

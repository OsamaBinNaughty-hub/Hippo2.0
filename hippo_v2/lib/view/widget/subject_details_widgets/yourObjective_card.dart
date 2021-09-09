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
    double? grade = weightedGrade(widget.subject.writtenGrade, widget.subject.practicalGrade, widget.subject.oralGrade);
    double? objective = widget.subject.objective;
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
                  percent: percentTillObjective(grade, objective),
                  animateFromLastPercent: true,
                  center: objectivePercentage(grade),
                  linearStrokeCap: LinearStrokeCap.roundAll,
                  progressColor: progressColorOfGrade(grade),
                  backgroundColor: backgroundColorOfGrade(grade),
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
                        Text("${weightedGradeOn20(grade)}", style: TextStyle(color: Colors.black.withOpacity(0.6), fontWeight: FontWeight.bold, fontSize: 17),)
                      ],
                    ),
                    Spacer(),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("Your objective", style: TextStyle(color: Colors.black.withOpacity(0.6), fontSize: 12)),
                        SizedBox(height: 4.0,),
                        Text("${weightedGradeOn20(objective)}", style: TextStyle(color: Colors.black.withOpacity(0.6), fontWeight: FontWeight.bold, fontSize: 17),)
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

  double percentOfWeightedGrade(double? weightedGrade){
    if(weightedGrade == null){
      return 0.01;
    } else {
      return weightedGrade/2/10;
    }
  }

  Widget objectivePercentage(double? weightedGrade){
    if(weightedGrade == null){
      return Text("");
    } else {
      return Text("${(weightedGrade/2*10).toStringAsFixed(1)}%",style: TextStyle(color: Colors.black.withOpacity(0.6), fontWeight: FontWeight.bold));
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

  double percentTillObjective(double? weightedGrade, double? objective){
    if(objective == null){
      if(weightedGrade != null){
        return 0.01;
      } else {
        return 0.01;
      }
    } else {
      if(weightedGrade != null){
        if(objective > weightedGrade){
          return weightedGrade / objective;
        } else {
          return 1.0;
        }
      } else {
        return 0.01;
      }
    }
  }

}

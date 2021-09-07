import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:hippo_v2/controller/subject_details_page_controller.dart';
import 'package:hippo_v2/model/subjects.dart';
import 'package:hippo_v2/view/widget/base_view.dart';
import 'package:hippo_v2/view/widget/circle_avatar_icon.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';

class SubjectDetails extends StatefulWidget {
  final Subject subject;
  const SubjectDetails({Key? key, required this.subject}) : super(key: key);

  @override
  _SubjectDetailsState createState() => _SubjectDetailsState();
}

class _SubjectDetailsState extends State<SubjectDetails> {
  @override
  Widget build(BuildContext context) {
    return BaseView<SubjectDetailsPageController>(
      onControllerReady: (controller){

      },
      builder: (context, controller, child){
        return Scaffold(
          appBar: AppBar(
            title: Text('${widget.subject.name}'),
          ),
          backgroundColor: Colors.white,
          body: AnnotatedRegion<SystemUiOverlayStyle>(
            value: SystemUiOverlayStyle.light,
            child: GestureDetector(
              onTap: () => FocusScope.of(context).unfocus(),
              child: Stack(
                children: [
                  Container(
                    height: double.infinity,
                    width: double.infinity,
                    decoration: BoxDecoration(
                      color: Colors.white,
                    ),
                  ),
                  Container(
                    height: double.infinity,
                    child: SingleChildScrollView(
                      physics: AlwaysScrollableScrollPhysics(),
                      padding: EdgeInsets.fromLTRB(0, 15.0, 0, 30.0),
                      child: Padding(
                        padding: const EdgeInsets.fromLTRB(16, 16, 16, 16),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Card(
                              clipBehavior: Clip.antiAlias,
                              child: Container(
                                width: double.infinity,
                                child: Column(
                                  children: [
                                    Column(
                                      children: _loadInformationOnCard(),
                                    ),
                                    InkWell(
                                      onTap: (){}, //TODO: Edit Color/Location/Teacher/Note
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
                                          title: Text("Edit", style: TextStyle(color: Colors.black.withOpacity(0.5)),),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            SizedBox(height: 8.0,),
                            Card(
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
                                      Padding(
                                        padding: const EdgeInsets.fromLTRB(16.0, 16.0, 16.0, 16.0),
                                        child: CircularPercentIndicator(
                                          radius: 90,
                                          lineWidth: 9.0,
                                          animation: true,
                                          animationDuration: 2000,
                                          percent: percentOfWeightedGrade(widget.subject.weightedGrade),
                                          circularStrokeCap: CircularStrokeCap.round,
                                          progressColor: progressColorOfGrade(widget.subject.weightedGrade),
                                          backgroundColor: backgroundColorOfGrade(widget.subject.weightedGrade),
                                          center: Text(
                                            "${weightedGradeOn20(widget.subject.weightedGrade)}",
                                            style: TextStyle(color: Colors.black.withOpacity(0.6), fontWeight: FontWeight.bold),
                                          ),
                                        ),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.fromLTRB(16.0, 16.0, 16.0, 16.0),
                                        child: Column(
                                          crossAxisAlignment: CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              "-"
                                            ),
                                            Text(
                                              "Written",
                                              style: TextStyle(color: Colors.black.withOpacity(0.6)),
                                            ),
                                          ],
                                        ),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.fromLTRB(16.0, 16.0, 16.0, 16.0),
                                        child: Column(
                                          crossAxisAlignment: CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                                "-"
                                            ),
                                            Text(
                                              "Oral",
                                              style: TextStyle(color: Colors.black.withOpacity(0.6)),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                            Card(
                              clipBehavior: Clip.antiAlias,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Padding(
                                    padding: EdgeInsets.fromLTRB(16.0, 16.0, 16.0, 0.0),
                                    child: Column(
                                      children: [
                                        LinearPercentIndicator(
                                          width: MediaQuery.of(context).size.width-9*8,
                                          animation: true,
                                          lineHeight: 20.0,
                                          animationDuration: 2000,
                                          percent: percentTillObjective(weightedGradeOn20(widget.subject.weightedGrade), widget.subject.objective),
                                          animateFromLastPercent: true,
                                          center: Text(
                                            "${(percentTillObjective(
                                                weightedGradeOn20(widget.subject.weightedGrade),
                                                widget.subject.objective)*100
                                            ).toStringAsFixed(1)}%",
                                            style: TextStyle(color: Colors.black.withOpacity(0.6), fontWeight: FontWeight.bold),
                                          ),
                                          linearStrokeCap: LinearStrokeCap.roundAll,
                                          progressColor: widget.subject.color,
                                          backgroundColor: widget.subject.color.withOpacity(0.3),
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
                                                Text("${weightedGradeOn20(widget.subject.weightedGrade)}", style: TextStyle(color: Colors.black.withOpacity(0.6), fontWeight: FontWeight.bold, fontSize: 17),)
                                              ],
                                            ),
                                            Spacer(),
                                            Column(
                                              crossAxisAlignment: CrossAxisAlignment.start,
                                              children: [
                                                Text("Your objective", style: TextStyle(color: Colors.black.withOpacity(0.6), fontSize: 12)),
                                                SizedBox(height: 4.0,),
                                                Text("${widget.subject.objective}", style: TextStyle(color: Colors.black.withOpacity(0.6), fontWeight: FontWeight.bold, fontSize: 17),)
                                              ],
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                  ),
                                  SizedBox(height: 16.0,),
                                  InkWell(
                                    onTap: (){}, //TODO: Edit Objective
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
                                        title: Text("Edit", style: TextStyle(color: Colors.black.withOpacity(0.5)),),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  //Image.asset("hippoDrawing.jpg"),
                ],
              ),
            ),
          ),
        );
      },
    );
  }

  double percentTillObjective(double? weightedGradeOn20, double? objective){
    if(objective == null){
      if(weightedGradeOn20 != null){
        return 0.01;
      } else {
        return 0.01;
      }
    } else {
      if(weightedGradeOn20 != null){
        if(objective > weightedGradeOn20){
          return weightedGradeOn20 / objective;
        } else {
          return 1.0;
        }
      } else {
        return 0.01;
      }
    }
  }

  double percentOfWeightedGrade(double? weightedGrade){
    if(weightedGrade == null){
      return 0.01;
    } else {
      return weightedGrade;
    }
  }

  double weightedGradeOn20(double? weightedGrade){
    if(weightedGrade == null){
      return 0.0;
    } else {
      return weightedGrade*100/5;
    }
  }

  Color progressColorOfGrade(double? weightedGrade){
    if(weightedGrade != null){
      if(weightedGrade >= 0.5){
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
      if(weightedGrade >= 0.5){
        return Color(0x4D18ba7f);
      } else {
        return Color(0x4Dffcc00);
      }
    } else {
      return Color(0x4Dbababa);
    }
  }

  List<Widget> _loadInformationOnCard(){
    List<Widget> information = [];
    information.add(SizedBox(height: 8.0,));
    if(widget.subject.location != null){
      information.add(
          ListTile(
            leading: Icon(Icons.my_location_outlined),
            title: Text('${widget.subject.location}'),
            visualDensity: VisualDensity(horizontal: 0, vertical: -4),
          )
      );
    }
    if(widget.subject.teacher != null){
      information.add(
        ListTile(
          leading: Icon(Icons.person_outlined),
          title: Text('${widget.subject.teacher}'),
          visualDensity: VisualDensity(horizontal: 0, vertical: -4),
        )
      );
    }
    if(widget.subject.note != null){
      information.add(
        ListTile(
          leading: Icon(Icons.note),
          title: Text('${widget.subject.note}'),
          visualDensity: VisualDensity(horizontal: 0, vertical: -4),
        )
      );
    }
    information.add(SizedBox(height: 8.0,));
    if(widget.subject.location == null && widget.subject.teacher == null
        && widget.subject.note == null){
      return [
        Padding(
          padding: const EdgeInsets.all(32.0),
          child: Center(
            child: Text("No information", style: TextStyle(color: Colors.black.withOpacity(0.5)),),
          ),
        ),
      ];
    } else {
      return information;
    }
  }
}

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:hippo_v2/controller/subjects_page_controller.dart';
import 'package:hippo_v2/view/widget/base_view.dart';
import 'package:hippo_v2/view/widget/circle_avatar_icon.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';
import 'package:flutter_speed_dial/flutter_speed_dial.dart';

class SubjectsPage extends StatefulWidget {
  const SubjectsPage({
    Key? key,
  }) : super(key: key);

  @override
  _SubjectsPageState createState() => _SubjectsPageState();
}

class _SubjectsPageState extends State<SubjectsPage> {
  var isDialOpen = ValueNotifier<bool>(false);
  @override
  Widget build(BuildContext context) {
    return BaseView<SubjectsPageController>(
      onControllerReady: (controller){

      },
      builder: (context, controller, child){
        return Scaffold(
          appBar: AppBar(
            title: Text('Subjects'),
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
                            SubjectCard(
                              subjectName: "Analyse",
                              classThisWeek: true,
                              timeOfNextClass: "14:00",
                              dayOfNextClass: "Monday",
                              weightedGrade: 0.6,
                              haveGrade: true,
                            ),
                            SubjectCard(
                              subjectName: "Algebra",
                              classThisWeek: false,
                              timeOfNextClass: "08:30",
                              dayOfNextClass: "Friday",
                              weightedGrade: 0.1,
                              haveGrade: true,
                            ),
                            SubjectCard(
                              subjectName: "G&E",
                              classThisWeek: true,
                              timeOfNextClass: "09:45",
                              dayOfNextClass: "Wednesday",
                              weightedGrade: 0.0,
                              haveGrade: false,
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
          floatingActionButton: SpeedDial(
            icon: Icons.add,
            activeIcon: Icons.close,
            spacing: 3,
            spaceBetweenChildren: 4,
            visible: true,
            curve: Curves.bounceInOut,
            children: [
              SpeedDialChild(
                child: Icon(Icons.school_outlined, color: Colors.white,),
                backgroundColor: Color(0xff4285F4),
                onTap: (){
                  //TODO: add subject
                },
                label: "Subject",
                labelStyle:
                TextStyle(fontWeight: FontWeight.w500, color: Colors.white),
                labelBackgroundColor: Colors.black,
              ),
              SpeedDialChild(
                child: Icon(Icons.emoji_events_outlined, color: Colors.white,),
                backgroundColor: Color(0xff4285F4),
                onTap: (){
                  //TODO: add grade
                },
                label: "Grade",
                labelStyle:
                TextStyle(fontWeight: FontWeight.w500, color: Colors.white),
                labelBackgroundColor: Colors.black,
              ),
              SpeedDialChild(
                child: Icon(Icons.science_outlined, color: Colors.white,),
                backgroundColor: Color(0xff4285F4),
                onTap: (){
                  //TODO: import from uni
                },
                label: "Import from University",
                labelStyle:
                TextStyle(fontWeight: FontWeight.w500, color: Colors.white),
                labelBackgroundColor: Colors.black,
              ),
            ],
          ),
        );
      },
    );
  }
}

class SubjectCard extends StatefulWidget {
  final String subjectName;
  final bool classThisWeek;
  final String timeOfNextClass;
  final String dayOfNextClass;
  final double weightedGrade;
  final bool haveGrade;
  const SubjectCard({
    Key? key,
    required this.subjectName,
    required this.classThisWeek,
    required this.timeOfNextClass,
    required this.dayOfNextClass,
    required this.weightedGrade,
    required this.haveGrade,
  }) : super(key: key);

  @override
  _SubjectCardState createState() => _SubjectCardState();
}

class _SubjectCardState extends State<SubjectCard> {
  @override
  Widget build(BuildContext context) {
    return Card(
      clipBehavior: Clip.antiAlias,
      child: InkWell(
        onTap: (){},
        child: Container(
          width: double.infinity,
          child: Column(
            children: [
              ListTile(
                leading: CircleAvatarWithIcon(icon: Icons.school_outlined,),
                trailing: Icon(Icons.keyboard_arrow_right_outlined),
                title: Text(
                  widget.subjectName,
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Color(0xff4285F4),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(16.0, 0.0, 16.0, 8.0),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("Next class", style: TextStyle(color: Colors.black.withOpacity(0.5)),),
                        nextClass(widget.classThisWeek),
                      ],
                    ),
                    Spacer(),
                    CircularPercentIndicator(
                      radius: 40.0,
                      lineWidth: 5.5,
                      animation: true,
                      percent: widget.weightedGrade,
                      circularStrokeCap: CircularStrokeCap.round,
                      progressColor: progressColorOfGrade(widget.weightedGrade, widget.haveGrade),
                      backgroundColor: backgroundColorOfGrade(widget.weightedGrade, widget.haveGrade),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget nextClass(bool classThisWeek){
    if(classThisWeek){
      return Text("${widget.dayOfNextClass} • ${widget.timeOfNextClass}");
    } else {
      return Text("No class this week");
    }
  }

  Color progressColorOfGrade(double weightedGrade, bool haveGrade){
    if(weightedGrade >= 0.5 && haveGrade == true){
      return Color(0xff18ba7f);
    } else if(weightedGrade < 0.5 && haveGrade == true){
      return Color(0xffffcc00);
    } else {
      return Color(0xffbababa);
    }
  }

  Color backgroundColorOfGrade(double weightedGrade, bool haveGrade){
    if(weightedGrade >= 0.5 && haveGrade == true){
      return Color(0x4D18ba7f);
    } else if(weightedGrade < 0.5 && haveGrade == true){
      return Color(0x4Dffcc00);
    } else {
      return Color(0x4Dbababa);
    }
  }

}


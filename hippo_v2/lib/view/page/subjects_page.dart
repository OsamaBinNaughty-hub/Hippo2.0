import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:hippo_v2/controller/subjects_page_controller.dart';
import 'package:hippo_v2/model/subjects.dart';
import 'package:hippo_v2/view/page/subject_details_page.dart';
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
  List<Subject> subjects = [
    Subject(
      id: '0',
      name: 'Analyse',
      color: Colors.orange,
      classThisWeek: true,
      weightedGrade: 0.8,
      dayOfNextClass: 'Monday',
      timeOfNextClass: '15:00',
      writtenGrade: 9.0,
      oralGrade: 8.0,
      location: 'Building A',
      teacher: 'Osama BinNaughty',
      note: 'This is obviously a note',
      objective: 19.0,
    ),
    Subject(
      id: '1',
      name: 'Algebra',
      color: Colors.blue,
      classThisWeek: false,
      weightedGrade: 0.4,
      dayOfNextClass: 'Monday',
      timeOfNextClass: '15:00',
      writtenGrade: 4.0,
      oralGrade: 8.0,
      objective: 10.0,
    ),
    Subject(
      id: '2',
      name: 'G&E',
      color: Colors.purple,
      classThisWeek: true,
      dayOfNextClass: 'Friday',
      timeOfNextClass: '09:00',
      writtenGrade: 9.0,
      oralGrade: 8.0,
      teacher: 'Mr. PooPooHead',
      objective: 10.0,
    ),

  ];

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
                          children: _loadSubjectCards(subjects),
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

  List<Widget> _loadSubjectCards(List<Subject> subjects){
    if(subjects.isNotEmpty){
      return subjects.map((e) => SubjectCard(
        name: e.name,
        classThisWeek: e.classThisWeek,
        weightedGrade: e.weightedGrade,
        dayOfNextClass: e.dayOfNextClass,
        timeOfNextClass: e.timeOfNextClass,
        subject: e,
      )).toList();
    } else {
      return [
        Center(
          child: Text(
            "There are no subjects",
            style: TextStyle(color: Colors.black.withOpacity(0.6)),
          ),
        ),
      ];
    }
  }

}

class SubjectCard extends StatefulWidget {
  final String name;
  final bool? classThisWeek;
  final double? weightedGrade;
  final String? dayOfNextClass;
  final String? timeOfNextClass;
  final Subject subject;
  const SubjectCard({
    Key? key,
    required this.name,
    this.classThisWeek,
    this.weightedGrade,
    this.dayOfNextClass,
    this.timeOfNextClass,
    required this.subject,
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
        onTap: (){
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) =>
                SubjectDetails(subject: widget.subject)
            ),
          );
        },
        child: Container(
          width: double.infinity,
          child: Column(
            children: [
              ListTile(
                leading: CircleAvatarWithIcon(icon: Icons.school_outlined,),
                trailing: Icon(Icons.keyboard_arrow_right_outlined),
                title: Text(
                  widget.name,
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
                      percent: percentOfWeightedGrade(widget.weightedGrade),
                      circularStrokeCap: CircularStrokeCap.round,
                      progressColor: progressColorOfGrade(widget.weightedGrade),
                      backgroundColor: backgroundColorOfGrade(widget.weightedGrade),
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

  double percentOfWeightedGrade(double? weightedGrade){
    if(weightedGrade == null){
      return 0.01;
    } else {
      return weightedGrade;
    }
  }

  Widget nextClass(bool? classThisWeek){
    if(classThisWeek == true && classThisWeek != null){
      return Text("${widget.dayOfNextClass} • ${widget.timeOfNextClass}");
    } else {
      return Text("No class this week");
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

}


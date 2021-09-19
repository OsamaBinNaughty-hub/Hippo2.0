import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:hippo_v2/controller/subjects_page_controller.dart';
import 'package:hippo_v2/model/subjects.dart';
import 'package:hippo_v2/view/page/add_subject_page.dart';
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
  @override
  Widget build(BuildContext context) {
    return BaseView<SubjectsPageController>(
      onControllerReady: (controller){
        controller.initialize();
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
                          children: _loadSubjectCards(controller.subjects),
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
                child: Icon(Icons.school_outlined, color: Color(0xff4285F4),),
                backgroundColor: Colors.white,
                onTap: (){
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) =>
                        AddSubjectPage()
                    ),
                  );
                },
                label: "Subject",
                labelStyle:
                TextStyle(fontWeight: FontWeight.w500, color: Colors.white),
                labelBackgroundColor: Colors.black,
              ),
              SpeedDialChild(
                child: Icon(Icons.science_outlined, color: Color(0xff4285F4),),
                backgroundColor: Colors.white,
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
  final Subject subject;
  const SubjectCard({
    Key? key,
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
                  widget.subject.name,
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
                        Text("No classes this week")/*widget.subject.whatIsNextClass()*/, //TODO: nextclass
                      ],
                    ),
                    Spacer(),
                    CircularPercentIndicator(
                      radius: 40.0,
                      lineWidth: 5.5,
                      animation: true,
                      percent: 0.9/*widget.subject.percentOfWeightedGrade(grade)*/,
                      circularStrokeCap: CircularStrokeCap.round,
                      progressColor: Color(0xff18ba7f)/*widget.subject.progressColorOfGrade(grade)*/,
                      backgroundColor: Color(0x4D18ba7f)/*widget.subject.backgroundColorOfGrade(grade)*/,
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
}


import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_speed_dial/flutter_speed_dial.dart';
import 'package:hippo_v2/controller/subject_details_page_controller.dart';
import 'package:hippo_v2/model/subjects.dart';
import 'package:hippo_v2/view/widget/base_view.dart';
import 'package:hippo_v2/view/widget/circle_avatar_icon.dart';
import 'package:hippo_v2/view/widget/subject_details_widgets/information_card.dart';
import 'package:hippo_v2/view/widget/subject_details_widgets/weeklySchedule_card.dart';
import 'package:hippo_v2/view/widget/subject_details_widgets/yourAverage_card.dart';
import 'package:hippo_v2/view/widget/subject_details_widgets/yourObjective_card.dart';

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
                            //TODO: Information Card
                            InformationCard(subject: widget.subject),
                            SizedBox(height: 8.0,),
                            //TODO: Your average Card
                            YourAverageCard(subject: widget.subject),
                            SizedBox(height: 8.0,),
                            //TODO: Objective Card
                            YourObjectiveCard(subject: widget.subject),
                            SizedBox(height: 8.0,),
                            // TODO: Weekly schedule Card --> fix this dogshit code :(
                            WeeklyScheduleCard(subject: widget.subject),
                            SizedBox(height: 8,),
                            //TODO: Events Card (Homework/Exams/Reminders)
                            Card(
                              clipBehavior: Clip.antiAlias,
                              child: Column(
                                children: [
                                  ListTile(
                                    leading: CircleAvatarWithIcon(
                                      icon: Icons.emoji_events_outlined,
                                      color: widget.subject.color,
                                    ),
                                    title: Text(
                                      "Events",
                                      style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ),
                                  SizedBox(height: 8,),
                                  Padding(
                                    padding: const EdgeInsets.all(32.0),
                                    child: Center(
                                      child: Text("There are no events", style: TextStyle(color: Colors.black.withOpacity(0.5)),),
                                    ),
                                  ),
                                  SizedBox(height: 2*8,),
                                  InkWell(
                                    onTap: (){}, //TODO: Show more --> idk yet (something with events)
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
                                        title: Text("Show more", style: TextStyle(color: Colors.black.withOpacity(0.5)),),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            SizedBox(height: 8,),
                            //TODO: Recent Grades Card
                            Card(
                              clipBehavior: Clip.antiAlias,
                              child: Column(
                                children: [
                                  ListTile(
                                    leading: CircleAvatarWithIcon(
                                      icon: Icons.emoji_events_outlined,
                                      color: widget.subject.color,
                                    ),
                                    title: Text(
                                      "Recent grades",
                                      style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ),
                                  SizedBox(height: 8,),
                                  Padding(
                                    padding: const EdgeInsets.all(32.0),
                                    child: Center(
                                      child: Text("There are no recent grades", style: TextStyle(color: Colors.black.withOpacity(0.5)),),
                                    ),
                                  ),
                                  SizedBox(height: 2*8,),
                                  InkWell(
                                    onTap: (){}, //TODO: Show more --> Grades
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
                                        title: Text("Show more", style: TextStyle(color: Colors.black.withOpacity(0.5)),),
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
          floatingActionButton: SpeedDial(
            icon: Icons.add,
            activeIcon: Icons.close,
            backgroundColor: widget.subject.color,
            spacing: 3,
            spaceBetweenChildren: 4,
            visible: true,
            curve: Curves.bounceInOut,
            children: [
              SpeedDialChild(
                child: Icon(Icons.emoji_events_outlined, color: widget.subject.color,),
                backgroundColor: Colors.white,
                onTap: (){
                  //TODO: add subject
                },
                label: "Grade",
                labelStyle:
                TextStyle(fontWeight: FontWeight.w500, color: Colors.white),
                labelBackgroundColor: Colors.black,
              ),
              SpeedDialChild(
                child: Icon(Icons.home_work_outlined, color: widget.subject.color,),
                backgroundColor: Colors.white,
                onTap: (){
                  //TODO: add grade
                },
                label: "Homework",
                labelStyle:
                TextStyle(fontWeight: FontWeight.w500, color: Colors.white),
                labelBackgroundColor: Colors.black,
              ),
              SpeedDialChild(
                child: Icon(Icons.shopping_bag_outlined, color: widget.subject.color,),
                backgroundColor: Colors.white,
                onTap: (){
                  //TODO: import from uni
                },
                label: "Exam",
                labelStyle:
                TextStyle(fontWeight: FontWeight.w500, color: Colors.white),
                labelBackgroundColor: Colors.black,
              ),
              SpeedDialChild(
                child: Icon(Icons.access_alarm_outlined, color: widget.subject.color,),
                backgroundColor: Colors.white,
                onTap: (){
                  //TODO: import from uni
                },
                label: "Reminder",
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

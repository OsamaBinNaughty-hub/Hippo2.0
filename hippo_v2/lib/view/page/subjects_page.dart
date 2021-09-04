import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:hippo_v2/controller/subjects_page_controller.dart';
import 'package:hippo_v2/view/widget/base_view.dart';
import 'package:hippo_v2/view/widget/circle_avatar_icon.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';

class SubjectsPage extends StatefulWidget {
  const SubjectsPage({Key? key}) : super(key: key);

  @override
  _SubjectsPageState createState() => _SubjectsPageState();
}

class _SubjectsPageState extends State<SubjectsPage> {
  @override
  Widget build(BuildContext context) {
    return BaseView<SubjectsPageController>(
      onControllerReady: (controller){

      },
      builder: (context, controller, child){
        return Scaffold(
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
                        padding: const EdgeInsets.fromLTRB(32, 64, 32, 16),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Subjects',
                              style: TextStyle(fontSize: 25.0),
                            ),
                            SizedBox(height: 8,),
                            Card(
                              clipBehavior: Clip.antiAlias,
                              child: Column(
                                children: [
                                  ListTile(
                                    leading: CircleAvatarWithIcon(icon: Icons.school_outlined,),
                                    trailing: Icon(Icons.keyboard_arrow_right_outlined),
                                    title: Text(
                                      "Analyse",
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
                                            Text("Monday • 14:00")
                                          ],
                                        ),
                                        Spacer(),
                                        CircularPercentIndicator(
                                          radius: 40.0,
                                          lineWidth: 5.5,
                                          animation: true,
                                          percent: 0.3,
                                          circularStrokeCap: CircularStrokeCap.round,
                                          progressColor: Color(0xffffcc00),
                                          backgroundColor: Color(0x4Dffcc00),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Card(
                              clipBehavior: Clip.antiAlias,
                              child: Column(
                                children: [
                                  ListTile(
                                    leading: CircleAvatarWithIcon(icon: Icons.school_outlined,),
                                    trailing: Icon(Icons.keyboard_arrow_right_outlined),
                                    title: Text(
                                      "Algebra",
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
                                            Text("No class this week")
                                          ],
                                        ),
                                        Spacer(),
                                        CircularPercentIndicator(
                                          radius: 40.0,
                                          lineWidth: 5.5,
                                          animation: true,
                                          percent: 0.8,
                                          circularStrokeCap: CircularStrokeCap.round,
                                          progressColor: Color(0xff18ba7f),
                                          backgroundColor: Color(0x4D18ba7f),
                                        ),
                                      ],
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
}

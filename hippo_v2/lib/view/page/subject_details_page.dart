import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:hippo_v2/controller/subject_details_page_controller.dart';
import 'package:hippo_v2/model/subjects.dart';
import 'package:hippo_v2/view/widget/base_view.dart';

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
                            Text(
                              'id: ${widget.subject.id}'
                            ),
                            Text(
                                'classThisWeek: ${widget.subject.classThisWeek}'
                            ),
                            Text(
                                'dayOfNextClass: ${widget.subject.dayOfNextClass}'
                            ),
                            Text(
                                'timeOfNextClass: ${widget.subject.timeOfNextClass}'
                            ),
                            Text(
                                'weightedGrade: ${widget.subject.weightedGrade}'
                            ),
                            Text(
                                'writtenGrade: ${widget.subject.writtenGrade}'
                            ),
                            Text(
                                'oralGrade: ${widget.subject.oralGrade}'
                            ),
                            Text(
                                'location: ${widget.subject.location}'
                            ),
                            Text(
                                'teacher: ${widget.subject.teacher}'
                            ),
                            Text(
                                'note: ${widget.subject.note}'
                            ),
                            Text(
                                'objective ${widget.subject.objective}'
                            ),
                            Text(
                                'color: ${widget.subject.color}'
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

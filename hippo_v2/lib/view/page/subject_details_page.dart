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
                                      onTap: (){},
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

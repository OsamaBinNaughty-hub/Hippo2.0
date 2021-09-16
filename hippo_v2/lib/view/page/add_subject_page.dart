import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:hippo_v2/controller/add_subject_controller.dart';
import 'package:hippo_v2/view/widget/base_view.dart';

class AddSubjectPage extends StatefulWidget {
  const AddSubjectPage({Key? key}) : super(key: key);

  @override
  _AddSubjectPageState createState() => _AddSubjectPageState();
}

class _AddSubjectPageState extends State<AddSubjectPage> {
  @override
  Widget build(BuildContext context) {
    return BaseView<AddSubjectPageController>(
      onControllerReady: (controller){

      },
      builder: (context, controller, child){
        return Scaffold(
          appBar: AppBar(
            actions: [
              Padding(
                padding: EdgeInsets.only(right: 20.0),
                child: TextButton(
                  onPressed: () {}, // TODO: ADD SUBJECT WITH FILLED IN PARAMETERS
                  child: Text(
                    "Add",
                    style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 18),
                  ),
                ),
              ),
            ],
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

                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );

  }
}

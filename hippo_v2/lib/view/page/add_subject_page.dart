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
  final _formkey = GlobalKey<FormState>();
  final _focusNode = FocusNode();
  void _onFieldSubmitted(String value) {
    _focusNode.requestFocus();
  }

  @override
  Widget build(BuildContext context) {
    final onSubjectAdded = (String content) {
      Navigator.pop(context);
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text(content),
      ));
    };
    return BaseView<AddSubjectPageController>(
      onControllerReady: (controller) {
        controller.onSubjectAdded = onSubjectAdded;
      },
      builder: (context, controller, child) {
        return Scaffold(
          appBar: AppBar(
            actions: [
              Padding(
                padding: EdgeInsets.only(right: 20.0),
                child: TextButton(
                  onPressed: () {
                    if (_formkey.currentState!.validate()) {
                      controller.addSubject();
                    }
                  }, // TODO: ADD SUBJECT WITH FILLED IN PARAMETERS
                  child: Text(
                    "Add",
                    style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 18),
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
                            Form(
                              key: _formkey,
                              child: TextFormField(
                                decoration: InputDecoration(
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(30.0),
                                    borderSide: BorderSide(),
                                  ),
                                  labelText: "Name",
                                ),
                                //validator: controller.validateName, TODO: doesn't work
                                onChanged: controller.setSubjectName,
                                autofocus: true,
                                onFieldSubmitted: _onFieldSubmitted,
                                textInputAction: TextInputAction.next,
                                maxLength: 20,
                              ),
                            ),
                            SizedBox(height: 2 * 8.0),
                            Form(
                              child: TextFormField(
                                decoration: InputDecoration(
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(30.0),
                                    borderSide: BorderSide(),
                                  ),
                                  labelText: "Location",
                                ),
                                onChanged: controller.setSubjectLocation,
                                autofocus: true,
                                onFieldSubmitted: _onFieldSubmitted,
                                textInputAction: TextInputAction.next,
                              ),
                            ),
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

class CustomForm extends StatelessWidget {
  final TextEditingController textEditingController;
  final String labelText;

  const CustomForm(
      {Key? key, required this.labelText, required this.textEditingController})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Form(
      key: key,
      child: TextFormField(
        decoration: InputDecoration(
            labelText: labelText,
            fillColor: Colors.white,
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(30.0),
              borderSide: BorderSide(),
            )),
        controller: textEditingController,
      ),
    );
  }
}

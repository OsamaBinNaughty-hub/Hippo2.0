import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:hippo_v2/controller/landing_page_controller.dart';
import 'package:hippo_v2/view/widget/base_view.dart';
import 'package:hippo_v2/view/widget/landing_widgets/multiselect.dart';
import 'package:hippo_v2/view/widget/landing_widgets/landing_textfield.dart';
import 'package:hippo_v2/view/widget/landing_widgets/landing_title.dart';

//TODO: Dependable dropdowns made from previous choice in DropdownList() & DropdownMultiDialog()
//TODO: Put DropdownList() & DropdownMultiDialog() in own file in landing_widgets dir
/** IDEAS:
 * (https://stackoverflow.com/questions/39645641/best-way-to-implement-no-password-sign-in-with-firebase)
 * First name / Last name / vub mail adress / (maybe) student ID
 * Press next button //TODO: design next button
 * --> onPressed: TODO: no-signIn/signUp auth to firebase (https://stackoverflow.com/questions/39645641/best-way-to-implement-no-password-sign-in-with-firebase)
 * Always "logged in" with the TOKEN (while having user information on back-end side)
 * --> Why? : Problems to specific use
**/

class Landing extends StatefulWidget {
  const Landing({ Key? key }) : super(key: key);

  @override
  _LandingState createState() => _LandingState();
}

class _LandingState extends State<Landing> {
  @override
  Widget build(BuildContext context) {
    final onAuthorization = (String content) {
      Navigator.popAndPushNamed(context, '/main');
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
            content: Text(content)
        ),
      );
    };

    return BaseView<LandingController>(
      onControllerReady: (controller){
        controller.onAuthorization = onAuthorization;
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
                            LandingTitle(
                              first: "Welcome", 
                              second: "to", 
                              third: "Hippo2.0", 
                              fontFamily: "Playfair", 
                              fontSize: 45.0, 
                              color: "4285F4", 
                              crossAxisAlignment: CrossAxisAlignment.start,
                            ),
                            SizedBox(height: 5*8,),
                            LandingTextField(
                                labelText: "What's your first name?",
                                validatorText: "That's weird... Don't you have a first name?",
                                keyBoardType: TextInputType.name,
                                textEditingController: controller.firstNameController
                            ),
                            SizedBox(height: 3*8,),
                            LandingTextField(
                                labelText: "What's your last name?",
                                validatorText: "That's weird... Don't you have a last name?",
                                keyBoardType: TextInputType.name,
                                textEditingController: controller.lastNameController
                            ),
                            SizedBox(height: 3*8,),
                            DropdownList(
                              labelText: 'What is your level of education?',
                            ),
                            SizedBox(height: 3*8,),
                            DropdownList(
                              labelText: 'What is your faculty?',
                            ),
                            SizedBox(height: 3*8,),
                            DropdownList(
                              labelText: 'What course are you following?',
                            ),
                            SizedBox(height: 3*8,),
                            //DropdownList(labelText: 'What group are you in? (More than 1 possible)',),
                            //SizedBox(height: 3*8,),
                            DropdownMultiSelectDialog(
                              labelText: "What group are you in? (More than 1 possible)",
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

class DropdownList extends StatefulWidget {
  final String labelText;
  DropdownList({
    required this.labelText
  });

  @override
  _DropdownListState createState() => _DropdownListState();
}

class _DropdownListState extends State<DropdownList> {
  String dropdownValue='Nothing Selected';

  @override
  Widget build(BuildContext context) {
    return InputDecorator(
      decoration: InputDecoration(
          labelText: widget.labelText,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(40.0),
          ),
      ),
      child: DropdownButtonHideUnderline(
        child: Container(
          height: 20.0,
          child: DropdownButton(
            value: dropdownValue,
            onChanged: (String? newValue) {
              setState(() {
                dropdownValue = newValue!;
              });
            },
            items: <String>['Nothing Selected', 'Bachelor', 'Master']
                .map<DropdownMenuItem<String>>((String value) {
              return DropdownMenuItem<String>(
                value: value,
                child: Text(value),
              );
            }).toList(),
          ),
        ),
      ),
    );
  }
}

class DropdownMultiSelectDialog extends StatefulWidget {
  const DropdownMultiSelectDialog({Key? key,
    required this.labelText,
  }) : super(key: key);
  final String labelText;
  @override
  _DropdownMultiSelectDialogState createState() => _DropdownMultiSelectDialogState();
}

class _DropdownMultiSelectDialogState extends State<DropdownMultiSelectDialog> {
  String dropdownValue='Nothing Selected';

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: ()=>showGroupMultiselect(context),
      child: InputDecorator(
        decoration: InputDecoration(
          labelText: widget.labelText,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(40.0),
          ),
        ),
        child: Container(
          height: 20,
          child: Row(
            children: [
              Text(
                dropdownValue,
                style: TextStyle(
                  fontSize: 16
                ),
              ),
              SizedBox(width: 158,),//SCUFFED AS FUCK MAAR IK GEEF GEEN FUCK...
              Icon(
                Icons.arrow_drop_down,
                color: Colors.grey.shade700,
              ),
            ],
          ),
        ),
      ),
    );
  }

  //TODO: automatic showGroupMultiSelect.
  //TODO: CANCEL/SUBMIT BUTTONS NOT WORKING ? ALTHOUGH IT WORKED BEFORE!!!! BULLSHIT
  void showGroupMultiselect(BuildContext context) async {
    final items = <MultiSelectDialogItem<int>>[
      MultiSelectDialogItem(1, 'Group 1'),
      MultiSelectDialogItem(2, 'Group 2'),
      MultiSelectDialogItem(3, 'What the fuck is this bullshit code?'),
    ];

    final selectedValues = await showDialog<Set<int>>(
      context: context,
      builder: (BuildContext context) {
        return MultiSelectDialog(
          items: items,
          initialSelectedValues: [].toSet(),
        );
      },
    );
    print(selectedValues);
  }
}

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:hippo_v2/controller/landing_page_controller.dart';
import 'package:hippo_v2/view/widget/base_view.dart';
import 'package:hippo_v2/view/widget/landing_widgets/landing_title.dart';
import 'package:hippo_v2/view/widget/landing_widgets/multiselect.dart';

class SecondLanding extends StatefulWidget {
  const SecondLanding({Key? key}) : super(key: key);

  @override
  _SecondLandingState createState() => _SecondLandingState();
}

class _SecondLandingState extends State<SecondLanding> {
  @override
  Widget build(BuildContext context) {
    return BaseView<LandingController>(
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
                        child: secondLanding(controller, context),
                      ),
                    ),
                  ),
                  //Image.asset("hippoDrawing.jpg"),
                ],
              ),
            ),
          ),
          floatingActionButton: FloatingActionButton.extended(
            label: Text("Next"),
            icon: Icon(Icons.navigate_next_rounded),
            backgroundColor: Color(0xff4285F4),
            onPressed: (){
              // TODO: AlertDialog with all the subject
            },
          ),
        );
      },
    );
  }
}

Widget secondLanding(LandingController controller, BuildContext context){
  return Column(
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
      SizedBox(height: 12*8,),
      DropdownList(labelText: "What's your level of education?"),
      SizedBox(height: 3*8,),
      DropdownList(labelText: "What's your faculty?"),
      SizedBox(height: 3*8,),
      DropdownList(labelText: "Wich course are you following?"),
    ],
  );
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
              SizedBox(width: 158,), //THIS IS SO SCUFFED, IDGAF THO. LOOKS GOOD.
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
    //print(selectedValues);
  }
}
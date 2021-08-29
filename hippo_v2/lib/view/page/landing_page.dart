import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hippo_v2/controller/landing_page_controller.dart';
import 'package:hippo_v2/view/page/first_landing_page.dart';
import 'package:hippo_v2/view/page/second_landing_page.dart';
import 'package:hippo_v2/view/widget/base_view.dart';

//TODO: Dependable dropdowns made from previous choice in DropdownList() & DropdownMultiDialog()
//TODO: Put DropdownList() & DropdownMultiDialog() in own file in landing_widgets dir
//TODO: Delete BottomNavigationBar (ugly AF) & control the diff tabs with buttons, Using IndexedStack()
/** IDEAS:
 * (https://stackoverflow.com/questions/39645641/best-way-to-implement-no-password-sign-in-with-firebase)
 * First name / Last name / (vub) mail adress / (maybe) student ID
 * Press next button
 * --> onPressed: TODO: no-signIn/signUp auth to firebase (https://stackoverflow.com/questions/39645641/best-way-to-implement-no-password-sign-in-with-firebase)
 * Always "logged in" with the TOKEN (while having user information on back-end side)
 * --> Why? : Problems to specific users,...
**/

class Landing extends StatefulWidget {
  const Landing({Key? key}) : super(key: key);

  @override
  _LandingState createState() => _LandingState();
}

class _LandingState extends State<Landing> {
  int index = 0;
  String fabName = "Next";
  Widget fabIcon = Icon(Icons.navigate_next_rounded);
  FloatingActionButtonLocation fabPos = FloatingActionButtonLocation.endFloat;

  @override
  Widget build(BuildContext context) {
    // first
    // first name | last name | email
    final firstLanding = Navigator(
      initialRoute: "/",
      onGenerateRoute: (settings) {
        return MaterialPageRoute(
          builder: (context) => FirstLanding(),
        );
      },
    );

    // second
    // ICalUI: level | faculty | course | groups | subjects
    final secondLanding = Navigator(
      initialRoute: "/",
      onGenerateRoute: (settings) {
        return MaterialPageRoute(
          builder: (context) => SecondLanding(),
        );
      },
    );


    return BaseView<LandingController>(
      builder: (context, controller, child) {
        return Scaffold(
          body: IndexedStack(
            index: index,
            children: [
              firstLanding,
              secondLanding,
            ],
          ),
          //bottomNavigationBar:
          floatingActionButton: FloatingActionButton.extended(
            label: Text(fabName),
            icon: fabIcon,
            backgroundColor: Color(0xff4285F4),
            onPressed: (){
              setState(() {
                if (index == 1) {
                  index = 0;
                  fabName = "Next";
                  fabIcon = Icon(Icons.navigate_next_rounded);
                  fabPos = FloatingActionButtonLocation.endFloat;
                } else {
                  index = 1;
                  fabName = "Back";
                  fabIcon = Icon(Icons.navigate_before_rounded);
                  fabPos = FloatingActionButtonLocation.startFloat;
                }
              });
            },
          ),
          floatingActionButtonLocation: fabPos,
        );
      },
      onControllerReady: (controller) {
        // I don't know yet
      },
    );
  }
}



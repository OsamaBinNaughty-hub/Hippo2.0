import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hippo_v2/controller/landing_page_controller.dart';
import 'package:hippo_v2/view/page/first_landing_page.dart';
import 'package:hippo_v2/view/page/second_landing_page.dart';
import 'package:hippo_v2/view/page/third_landing_page.dart';
import 'package:hippo_v2/view/widget/base_view.dart';

/** IDEAS:
 * TODO: Nice background art? Something that fills the white.
 * TODO: Put the FAB's on the background (dropdown bug)
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
  bool showBackButton = false;

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

    // third
    // Column with all the groups with checkboxes.
    final thirdLanding = Navigator(
      initialRoute: "/",
      onGenerateRoute: (settings) {
        return MaterialPageRoute(
          builder: (context) => ThirdLanding(),
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
              thirdLanding,
            ],
          ),
          //bottomNavigationBar:
          floatingActionButton: Stack(
            children: [
              Positioned(
                right: 0,
                bottom: 20,
                child: FloatingActionButton.extended(
                  icon: Icon(Icons.navigate_next_rounded),
                  label: Text("Next"),
                  backgroundColor: Color(0xff4285F4),
                  onPressed: (){
                    setState(() {
                      if (index == 1) {
                        index = 2;
                      } else if(index == 0) {
                        index = 1;
                        showBackButton = true;
                      }
                    });
                  },
                ),
              ),
              Positioned(
                left: 30,
                bottom: 20,
                child: Visibility(
                  visible: showBackButton,
                  child: FloatingActionButton.extended(
                    label: Text("Back"),
                    icon: Icon(Icons.navigate_before_rounded),
                    backgroundColor: Color(0xff4285F4),
                    onPressed: (){
                      setState(() {
                        if (index == 2) {
                          index = 1;
                        } else if(index == 1) {
                          index = 0;
                          showBackButton = false;
                        }
                      });
                    },
                  ),
                ),
              ),
            ],
          ),
        );
      },
      onControllerReady: (controller) {
        // I don't know yet
      },
    );
  }
}
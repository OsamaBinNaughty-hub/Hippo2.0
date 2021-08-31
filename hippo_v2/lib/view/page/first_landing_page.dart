import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:hippo_v2/controller/landing_page_controller.dart';
import 'package:hippo_v2/view/widget/base_view.dart';
import 'package:hippo_v2/view/widget/landing_widgets/landing_textfield.dart';
import 'package:hippo_v2/view/widget/landing_widgets/landing_title.dart';

class FirstLanding extends StatefulWidget {
  const FirstLanding({ Key? key }) : super(key: key);

  @override
  _FirstLandingState createState() => _FirstLandingState();
}

class _FirstLandingState extends State<FirstLanding> {
  @override
  Widget build(BuildContext context) {

    // useful?
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
        //controller.onAuthorization = onAuthorization;
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
                        child: firstLanding(controller, context),
                      ),
                    ),
                  ),
                  //Image.asset("hippoDrawing.jpg"), //TODO: why doesn't this asset load?
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}

Widget firstLanding(LandingController controller, BuildContext context){
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
      LandingTextField(
          labelText: "What's your VUB email address?",
          validatorText: "This doesn't look good?",
          keyBoardType: TextInputType.emailAddress,
          textEditingController: controller.emailController
      ),
    ],
  );
}
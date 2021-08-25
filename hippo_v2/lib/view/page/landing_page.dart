import 'package:flutter/material.dart';
import 'package:hippo_v2/controller/landing_page_controller.dart';
import 'package:hippo_v2/view/widget/base_view.dart';

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
          // BLA BLA
        );
      },
    );
  }
}
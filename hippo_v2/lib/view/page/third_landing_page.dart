import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:hippo_v2/controller/landing_page_controller.dart';
import 'package:hippo_v2/view/widget/base_view.dart';
import 'package:hippo_v2/view/widget/landing_widgets/landing_title.dart';

class ThirdLanding extends StatefulWidget {
  const ThirdLanding({Key? key}) : super(key: key);

  @override
  _ThirdLandingState createState() => _ThirdLandingState();
}

class _ThirdLandingState extends State<ThirdLanding> {
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
                            SizedBox(height: 12*8,),
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

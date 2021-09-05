import 'package:flutter/material.dart';
import 'package:hippo_v2/controller/main_page_controller.dart';
import 'package:hippo_v2/view/page/calendar/calendar_page.dart';
import 'package:hippo_v2/view/page/subjects_page.dart';
import 'package:hippo_v2/view/widget/base_view.dart';

class MainPage extends StatelessWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final subjectTab = Navigator(
      initialRoute: "/",
      onGenerateRoute: (settings) {
        return MaterialPageRoute(
          builder: (context) => SubjectsPage(),
        );
      },
    );

    final calendarTab = Navigator(
      initialRoute: "/",
      onGenerateRoute: (settings) {
        return MaterialPageRoute(
          builder: (context) => CalendarPage(),
        );
      },
    );

    return BaseView<MainPageController>(
      builder: (context, controller, child) {
        return Scaffold(
          body: IndexedStack(
            index: controller.tab,
            children: [
              subjectTab,
              calendarTab,
            ],
          ),
          bottomNavigationBar: BottomNavigationBar(
            onTap: controller.onTabSelected,
            currentIndex: controller.tab,
            items: [
              BottomNavigationBarItem(
                icon: Icon(Icons.school_outlined),
                label: "school",
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.calendar_today_outlined),
                label: "Calendar",
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

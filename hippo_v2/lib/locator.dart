import 'package:get_it/get_it.dart';
import 'package:hippo_v2/controller/landing_page_controller.dart';
import 'package:hippo_v2/controller/subject_details_page_controller.dart';

import 'controller/main_page_controller.dart';
import 'controller/subjects_page_controller.dart';

GetIt locator = GetIt.instance;

void setupLocator() {
  locator.registerFactory(() => MainPageController());
  locator.registerFactory(() => SubjectsPageController());
  locator.registerFactory(() => SubjectDetailsPageController());
  locator.registerFactory(() => LandingController());
}
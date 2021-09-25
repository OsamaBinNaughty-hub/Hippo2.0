import 'package:get_it/get_it.dart';
import 'package:hippo_v2/ICalInterface/models/importuni.dart';
import 'package:hippo_v2/controller/add_subject_controller.dart';
import 'package:hippo_v2/controller/landing_page_controller.dart';
import 'package:hippo_v2/controller/subject_details_page_controller.dart';

import 'controller/main_page_controller.dart';
import 'controller/subjects_page_controller.dart';
import 'data/subjects_dao.dart';

GetIt locator = GetIt.instance;

void setupLocator() {
  /// CONTROLLERS
  locator.registerFactory(() => MainPageController());
  locator.registerFactory(() => SubjectsPageController());
  locator.registerFactory(() => AddSubjectPageController());
  locator.registerFactory(() => SubjectDetailsPageController());
  locator.registerFactory(() => LandingController());

  /// Cache
  locator.registerSingleton(ImportFromUniCache());

  /// SERVICES | DAO's
  locator.registerSingleton(SubjectDao());
}

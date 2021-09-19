import 'package:flutter/cupertino.dart';
import 'package:hippo_v2/data/subjects_dao.dart';
import 'package:hippo_v2/locator.dart';
import 'package:hippo_v2/model/subjects.dart';

class SubjectsPageController extends ChangeNotifier{
  List<Subject> _subjects = [];

  List<Subject> get subjects => _subjects;

  set subjects(List<Subject> value){
    if(_subjects == value){
      _subjects = value;
      notifyListeners();
    }
  }

  initialize() async {
    subjects = await locator<SubjectDao>().getAllSortedByName();
  }
}
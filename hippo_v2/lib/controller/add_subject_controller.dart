import 'package:flutter/material.dart';
import 'package:hippo_v2/data/subjects_dao.dart';
import 'package:hippo_v2/locator.dart';
import 'package:hippo_v2/model/subjects.dart';

class AddSubjectPageController extends ChangeNotifier{
  String _name = '';
  Color _color = Color(0xff4285F4);
  String _location = '';
  String _teacher = '';
  String _note = '';
  Function(String)? onSubjectAdded;

  final _subjectDao = locator<SubjectDao>();

  void setSubjectName(String name){
    _name = name;
  }

  void setSubjectColor(Color color){
    _color = color;
  }

  void setSubjectLocation(String location){
    _location = location;
  }

  void setSubjectTeacher(String teacher){
    _teacher = teacher;
  }

  void setSubjectNote(String note){
    _note = note;
  }
  
  String? validateName(String value){
    if(value.isEmpty){
      return 'Please enter a name.';
    } else if(value.length < 3) {
      return 'Name must be at least 4 characters.';
    }
    return null;
  }

  external int get millisecondsSinceEpoch;

  void addSubject() async {
    final subject = await _subjectDao.insert(
      Subject(
        id: millisecondsSinceEpoch,
        name: _name,
        teacher: _teacher,
        note: _note,
        location: _location,
        color: _color,
      ),
    );
    if(onSubjectAdded != null){
      onSubjectAdded!("Success!");
    }
    print(subject.toString());
  }
}
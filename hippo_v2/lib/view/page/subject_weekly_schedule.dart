import 'package:flutter/material.dart';
import 'package:hippo_v2/model/subjects.dart';
import 'package:hippo_v2/view/widget/timetable_widgets/timetable.dart';

class SubjectWeeklySchedule extends StatefulWidget {
  final Subject subject;
  const SubjectWeeklySchedule({Key? key, required this.subject})
      : super(key: key);

  @override
  _SubjectWeeklyScheduleState createState() => _SubjectWeeklyScheduleState();
}

//TODO: make this work with List<DateTime> instead of Map<int, List<int>>
class _SubjectWeeklyScheduleState extends State<SubjectWeeklySchedule> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.subject.name),
      ),
      body: WeeklyTimeTable(
        locale: 'en',
        onValueChanged: (Map<int, List<int>> selected) {
          print(selected);
        },
        boarderColor: Colors.grey.withOpacity(0.3),
        cellSelectedColor: widget.subject.color,
        initialSchedule: {
          0: [],
          1: [],
          2: [],
          3: [],
          4: [],
          5: [],
          6: [],
        },
      ),
    );
  }
}

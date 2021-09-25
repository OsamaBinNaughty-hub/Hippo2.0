import 'package:flutter/material.dart';
import 'package:hippo_v2/model/subjects.dart';
import 'package:hippo_v2/view/page/subject_weekly_schedule.dart';
import 'package:hippo_v2/view/widget/circle_avatar_icon.dart';
import 'package:hippo_v2/view/widget/subject_details_widgets/bottom_InkWell.dart';

class WeeklyScheduleCard extends StatefulWidget {
  final Subject subject;
  const WeeklyScheduleCard({Key? key, required this.subject}) : super(key: key);

  @override
  _WeeklyScheduleCardState createState() => _WeeklyScheduleCardState();
}

//TODO: re-do whole weekly schedule system, this is so scuffed.
class _WeeklyScheduleCardState extends State<WeeklyScheduleCard> {
  @override
  Widget build(BuildContext context) {
    return Card(
      clipBehavior: Clip.antiAlias,
      child: Column(
        children: [
          ListTile(
            leading: CircleAvatarWithIcon(
              icon: Icons.format_list_bulleted_outlined,
              color: widget.subject.color,
            ),
            title: Text(
              "Weekly schedule",
              style: TextStyle(
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          SizedBox(
            height: 3 * 8,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: week(widget.subject),
          ),
          SizedBox(
            height: 4 * 8,
          ),
          BottomInkWell(
              title: "Show more",
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => SubjectWeeklySchedule(
                      subject: widget.subject,
                    ),
                  ),
                );
              }), //TODO: Timetable or AlertDialog.
        ],
      ),
    );
  }

  //TODO: make this work with List<DateTime> instead of Map<int, List<int>>
  List<Widget> week(Subject subject) {
    List<Widget> list = [];
    List days = ['M', 'T', 'W', 'T', 'F', 'S', 'S'];
    Map<int, List<int>> initialSchedule = {
      0: [],
      1: [],
      2: [],
      3: [],
      4: [],
      5: [],
      6: [],
    }; // {0: [], 1: [], 2: [], 3: [], 4: [], 5: [], 6: [],}
    var i = 0;
    while (i < 7) {
      List<int>? timerange = initialSchedule[i];
      bool chosen = false;
      if (timerange!.isNotEmpty) {
        chosen = true;
      }
      list.add(
        CircleAvatarWithDay(
          text: days[i],
          color: subject.color,
          chosen: chosen,
        ),
      );
      print(list[i]);
      i = i + 1;
    }
    // FILLER THIS IS INVINCIBLE
    list.add(
      CircleAvatarWithDay(
        text: 'F',
        color: Colors.white,
        chosen: true,
      ),
    );

    List<Widget> realList = [
      Column(
        children: [
          list[0],
          SizedBox(
            height: 8,
          ),
          list[4],
        ],
      ),
      SizedBox(
        width: 6 * 8,
      ),
      Column(
        children: [
          list[1],
          SizedBox(
            height: 8,
          ),
          list[5],
        ],
      ),
      SizedBox(
        width: 6 * 8,
      ),
      Column(
        children: [
          list[2],
          SizedBox(
            height: 8,
          ),
          list[6],
        ],
      ),
      SizedBox(
        width: 6 * 8,
      ),
      Column(
        children: [
          list[3],
          SizedBox(
            height: 8,
          ),
          list[7],
        ],
      ),
    ];
    return realList;
  }
}

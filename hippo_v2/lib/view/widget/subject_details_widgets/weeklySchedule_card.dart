import 'package:flutter/material.dart';
import 'package:hippo_v2/model/subjects.dart';
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
          SizedBox(height: 3*8,),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Column(
                children: [
                  CircleAvatarWithDay(text: 'M',color: widget.subject.color, chosen: true,),
                  SizedBox(height: 8,),
                  CircleAvatarWithDay(text: 'F',color: widget.subject.color, chosen: true,),
                ],
              ),
              SizedBox(width: 6*8,),
              Column(
                children: [
                  CircleAvatarWithDay(text: 'T',color: widget.subject.color, chosen: false,),
                  SizedBox(height: 8,),
                  CircleAvatarWithDay(text: 'S',color: widget.subject.color, chosen: false,),
                ],
              ),
              SizedBox(width: 6*8,),
              Column(
                children: [
                  CircleAvatarWithDay(text: 'W',color: widget.subject.color, chosen: false,),
                  SizedBox(height: 8,),
                  CircleAvatarWithDay(text: 'S',color: widget.subject.color, chosen: false,),
                ],
              ),
              SizedBox(width: 6*8,),
              Column(
                children: [
                  CircleAvatarWithDay(text: 'T',color: widget.subject.color, chosen: true,),
                  SizedBox(height: 8,),
                  CircleAvatarWithDay(text: 'F',color: Colors.white, chosen: true,),
                ],
              ),
            ],
          ),
          SizedBox(height: 4*8,),
          BottomInkWell(title: "Show more",onTap: (){},) //TODO: Timetable or AlertDialog.
        ],
      ),
    );
  }
}

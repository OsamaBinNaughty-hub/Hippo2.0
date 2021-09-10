import 'package:flutter/material.dart';
import 'package:hippo_v2/model/subjects.dart';

import 'bottom_InkWell.dart';

class InformationCard extends StatefulWidget {
  final Subject subject;
  const InformationCard({Key? key, required this.subject}) : super(key: key);

  @override
  _InformationCardState createState() => _InformationCardState();
}

class _InformationCardState extends State<InformationCard> {
  @override
  Widget build(BuildContext context) {
    return Card(
      clipBehavior: Clip.antiAlias,
      child: Column(
        children: [
          Column(
            children: _loadInformationOnCard(),
          ),
          BottomInkWell(
            title: "Edit",
            onTap: (){}, // TODO: Edit info
          ),
        ],
      ),
    );
  }

  List<Widget> _loadInformationOnCard(){
    List<Widget> information = [];
    information.add(SizedBox(height: 8.0,));
    if(widget.subject.location != null){
      information.add(
          ListTile(
            leading: Icon(Icons.my_location_outlined),
            title: Text('${widget.subject.location}'),
            visualDensity: VisualDensity(horizontal: 0, vertical: -4),
          )
      );
    }
    if(widget.subject.teacher != null){
      information.add(
          ListTile(
            leading: Icon(Icons.person_outlined),
            title: Text('${widget.subject.teacher}'),
            visualDensity: VisualDensity(horizontal: 0, vertical: -4),
          )
      );
    }
    if(widget.subject.note != null){
      information.add(
          ListTile(
            leading: Icon(Icons.note),
            title: Text('${widget.subject.note}'),
            visualDensity: VisualDensity(horizontal: 0, vertical: -4),
          )
      );
    }
    information.add(SizedBox(height: 8.0,));
    if(widget.subject.location == null && widget.subject.teacher == null
        && widget.subject.note == null){
      return [
        Padding(
          padding: const EdgeInsets.all(32.0),
          child: Center(
            child: Text("No information", style: TextStyle(color: Colors.black.withOpacity(0.5)),),
          ),
        ),
      ];
    } else {
      return information;
    }
  }

}

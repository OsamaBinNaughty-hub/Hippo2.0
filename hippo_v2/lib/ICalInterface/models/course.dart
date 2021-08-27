import 'package:hippo_v2/ICalInterface/iCalInterface.dart';

import 'group.dart';

class Course implements ICalInterface{
  final String name;
  final List<ICalInterface> nextData;

  const Course({
    required this.name, 
    required this.nextData
  });
}

const List<Course> bachelorIngenieurswetenschappen = <Course>[
  const Course(name: 'Industriële Wetenschappen', nextData: groupsBachelorIndustrieelIngenieur),
];

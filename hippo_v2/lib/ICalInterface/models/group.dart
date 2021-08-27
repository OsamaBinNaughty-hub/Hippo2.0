import 'package:hippo_v2/ICalInterface/iCalInterface.dart';

import 'subject.dart';

class Group implements ICalInterface{
  final String name;
  final String url;
  final List<ICalInterface> nextData;

  const Group({
    required this.name,
    required this.url,
    required this.nextData
  });
}

const List<Group> groupsBachelorIndustrieelIngenieur = <Group>[
  const Group(name: '1 BA IR. Group A', url: '', nextData: Ba1_IW_subjects),
];
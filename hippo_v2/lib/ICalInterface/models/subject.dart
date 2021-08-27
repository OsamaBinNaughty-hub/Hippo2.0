import 'package:hippo_v2/ICalInterface/iCalInterface.dart';

class Subject implements ICalInterface{
  final String name;
  final List<ICalInterface> nextData;
  const Subject({
    required this.name,
    required this.nextData
  });

}

const List<Subject> Ba1_IW_subjects = <Subject>[
  const Subject(name: 'Analyse', nextData: []),
];
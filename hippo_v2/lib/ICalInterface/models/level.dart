import 'package:hippo_v2/ICalInterface/iCalInterface.dart';

import 'faculty.dart';

class Level implements ICalInterface{
  final String name;
  final List<ICalInterface> nextData;
  const Level({
    required this.name,
    required this.nextData
  });
}

const List<Level> levels = <Level>[
  const Level(name: "Bachelor", nextData: bachelor),
];
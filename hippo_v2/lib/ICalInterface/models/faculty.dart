import 'package:hippo_v2/ICalInterface/iCalInterface.dart';

import 'course.dart';

class Faculty implements ICalInterface{
  final String name;
  final List<ICalInterface> nextData;

  const Faculty({
    required this.name,
    required this.nextData,
  });
}

const List<Faculty> bachelor = <Faculty>[
  const Faculty(name: "Ingenieurswetenschappen", nextData: bachelorIngenieurswetenschappen),
];
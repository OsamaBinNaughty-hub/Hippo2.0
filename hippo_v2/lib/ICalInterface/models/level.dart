import 'package:hippo_v2/ICalInterface/iCalInterface.dart';

import 'faculty.dart';

class Level implements ICalInterface{
  final String name;
  final List<ICalInterface>? nextData;
  const Level({
    required this.name,
    this.nextData
  });
}

const List<Level> Levels = <Level>[
  const Level(name: "Bachelor", nextData: Bachelor),
  const Level(name: "Master", nextData: Master),
  const Level(name: "Schakel- en Voorbereidingsprogramma\'s", nextData: SeV),
  const Level(name: "Master-na-master", nextData: Manama),
  const Level(name: "Postgraduaat",nextData: PGrad),
  const Level(name: "Educatieve Master", nextData: EMaster),
  const Level(name: "Doctoraatsopleiding", nextData: Doctor),
  const Level(name: "Vluchtelingenprogramma", nextData: Vlucht),
];
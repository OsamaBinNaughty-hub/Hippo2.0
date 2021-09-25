import 'package:hippo_v2/ICalInterface/iCalInterface.dart';

class Group implements ICalInterface {
  final String name;
  final String? url;
  final List<ICalInterface>? nextData;

  const Group({required this.name, this.url, this.nextData});

  @override
  String getName() => name;
}

const List<Group> Bachelor_WeBIR_CW = <Group>[
  const Group(name: '1 BA Computerwetenschappen (Keuze)'),
  const Group(name: '1 BA Computerwetenschappen GRP1'),
  const Group(name: '1 BA Computerwetenschappen GRP2'),
  const Group(name: '2 BA Computerwetenschappen GRP1'),
  const Group(name: '2 BA Computerwetenschappen GRP2'),
  const Group(
      name:
          '3 BA Computerwetenschappen VP voor Prof. BA Toegepaste Informatica'),
  const Group(
      name:
          '3 BA Computerwetenschappen VP voor Prof. BA Toegepaste Informatica (Keuze)'),
  const Group(name: '3 BA Computerwetenschappen'),
  const Group(name: '3 BA Computerwetenschappen (Keuze)'),
];

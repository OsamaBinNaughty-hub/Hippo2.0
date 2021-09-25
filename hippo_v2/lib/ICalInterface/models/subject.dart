import 'package:hippo_v2/ICalInterface/iCalInterface.dart';

class Subject implements ICalInterface {
  final String name;
  final int SP;
  final List<int> semester;
  final int? hours_HOC;
  final int? hours_WPO;
  final int? hours_ZELF;
  final List<ICalInterface>? nextData;
  const Subject({
    required this.name,
    required this.SP,
    required this.semester,
    this.hours_HOC,
    this.hours_WPO,
    this.hours_ZELF,
    this.nextData,
  });

  @override
  String getName() => name;
}

const List<Subject> Bachelor_WeBIR_CW_1BA_Keuze = <Subject>[
  const Subject(
      name: 'Basisvaardigheden wiskunde',
      SP: 3,
      semester: [1],
      hours_HOC: 6,
      hours_WPO: 24,
      hours_ZELF: 12),
  const Subject(
      name: 'Privacy, veiligheid en eigendom op het internet',
      SP: 3,
      semester: [1],
      hours_HOC: 16,
      hours_WPO: 16),
  const Subject(
      name: 'Gebruiksinterfaces',
      SP: 3,
      semester: [1],
      hours_HOC: 16,
      hours_WPO: 16),
];

const List<Subject> Bachelor_WeBIR_CW_1BA_GRP1 = <Subject>[
  const Subject(
      name: 'Algoritmen en datastructuren 1',
      SP: 6,
      semester: [1],
      hours_HOC: 26,
      hours_WPO: 26),
  const Subject(
      name: 'Structuur van computerprogramma\'s 1',
      SP: 9,
      semester: [1],
      hours_HOC: 39,
      hours_WPO: 39),
  const Subject(
      name: 'Logica en formele systemen',
      SP: 6,
      semester: [1],
      hours_HOC: 26,
      hours_WPO: 26),
  const Subject(
      name: 'Databanken', SP: 6, semester: [2], hours_HOC: 26, hours_WPO: 26),
  const Subject(
      name: 'Programmeerproject', SP: 6, semester: [1, 2], hours_WPO: 78),
  const Subject(
      name: 'Wiskunde: calculus en lineaire algebra',
      semester: [1, 2],
      SP: 9,
      hours_HOC: 48,
      hours_WPO: 52),
  const Subject(
      name: 'Interpretatie van computerprogramma\'s 1',
      SP: 9,
      semester: [2],
      hours_HOC: 39,
      hours_WPO: 39),
  const Subject(
      name: 'Besturingssystemen en systeemfundamenten',
      SP: 6,
      semester: [2],
      hours_HOC: 26,
      hours_WPO: 26),
];

const List<Subject> Bachelor_WeBIR_CW_1BA_GRP2 = Bachelor_WeBIR_CW_1BA_GRP1;

const List<Subject> Bachelor_WeBIR_CW_2BA_GRP1 = <Subject>[
  const Subject(
      name: 'Structuur van computerprogramma\'s 2',
      SP: 6,
      semester: [1],
      hours_HOC: 2626,
      hours_WPO: 26),
  const Subject(
      name: 'Computersystemen',
      SP: 6,
      semester: [1],
      hours_HOC: 26,
      hours_WPO: 26),
  const Subject(
      name: 'Discrete wiskunde',
      SP: 6,
      semester: [1],
      hours_HOC: 26,
      hours_WPO: 26),
  const Subject(
      name: 'Algoritmen en datascructuren 2',
      SP: 9,
      semester: [1, 2],
      hours_HOC: 39,
      hours_WPO: 39),
  const Subject(
      name: 'Artificiële intelligentie',
      SP: 6,
      semester: [2],
      hours_HOC: 26,
      hours_WPO: 26),
  const Subject(
      name: 'Communicatievaardigheden voor informatici',
      SP: 3,
      semester: [2],
      hours_HOC: 13,
      hours_WPO: 13),
  const Subject(
      name: 'Programmeerproject 2',
      SP: 6,
      semester: [1, 2],
      hours_WPO: 78,
      hours_ZELF: 170),
  const Subject(
      name: 'Objectgericht modelleren',
      SP: 3,
      semester: [1],
      hours_HOC: 18,
      hours_WPO: 18),
  const Subject(
      name: 'Objectgericht programmeren',
      SP: 3,
      semester: [1],
      hours_HOC: 18,
      hours_WPO: 18),
  const Subject(
      name: 'Automaten en berekenbaarheid',
      SP: 6,
      semester: [2],
      hours_HOC: 26,
      hours_WPO: 26),
  const Subject(
      name: 'Kansrekening en statistiek',
      SP: 6,
      semester: [2],
      hours_HOC: 26,
      hours_WPO: 26,
      hours_ZELF: 13),
];

const List<Subject> Bachelor_WeBIR_CW_2BA_GRP2 = Bachelor_WeBIR_CW_2BA_GRP1;

const List<Subject> Bachelor_WeBIR_CW_3BA = <Subject>[
  const Subject(
      name: 'Software engineering',
      SP: 6,
      semester: [1],
      hours_HOC: 26,
      hours_WPO: 75),
  const Subject(
      name: 'Economie en bedrijfsleven', SP: 3, semester: [1], hours_HOC: 26),
  const Subject(
      name: 'Wetenschappelijk rekenen',
      SP: 6,
      semester: [2],
      hours_HOC: 26,
      hours_WPO: 26),
  const Subject(
      name: 'Parallellism en distributie',
      SP: 6,
      semester: [2],
      hours_HOC: 26,
      hours_WPO: 26),
  const Subject(
      name: 'Bachelorproef wetenschappen',
      SP: 6,
      semester: [1, 2],
      hours_ZELF: 170),
];

const List<Subject> Bachelor_WeBIR_CW_3BA_Keuze = <Subject>[
  const Subject(
      name: 'Interpretatie van Computerprogramma\'s 2',
      SP: 6,
      semester: [2],
      hours_HOC: 26,
      hours_WPO: 26),
  const Subject(
      name: 'Machine Learning',
      SP: 6,
      semester: [1],
      hours_HOC: 26,
      hours_WPO: 26),
  const Subject(
      name: 'Multimedia Processing Tools',
      SP: 6,
      semester: [1],
      hours_HOC: 24,
      hours_WPO: 18,
      hours_ZELF: 12),
  const Subject(
      name: 'IT Networks', SP: 6, semester: [1], hours_HOC: 26, hours_WPO: 26),
  const Subject(
      name: 'Web Technologies',
      SP: 6,
      semester: [1],
      hours_HOC: 36,
      hours_WPO: 18,
      hours_ZELF: 12),
  const Subject(
      name: 'Bachelor onderzoeksstage', SP: 3, semester: [1], hours_ZELF: 75),
  const Subject(
      name: 'Privacy, veiligheid en eigendom op internet',
      SP: 3,
      semester: [1],
      hours_HOC: 16,
      hours_WPO: 16),
  const Subject(
      name: 'Gebruikersinterfaces',
      SP: 3,
      semester: [1],
      hours_HOC: 16,
      hours_WPO: 16),
  const Subject(
      name: 'Digitale wiskunde',
      SP: 3,
      semester: [2],
      hours_HOC: 15,
      hours_WPO: 15),
  const Subject(
      name: 'Evolution of Software Languages',
      SP: 3,
      semester: [2],
      hours_HOC: 18,
      hours_WPO: 18),
  const Subject(
      name: 'Fysica: inleiding mechanica',
      SP: 3,
      semester: [1],
      hours_HOC: 18,
      hours_WPO: 22),
  const Subject(
      name: 'Chemie: bouw van de materie en chamische reacties 1',
      SP: 6,
      semester: [1],
      hours_HOC: 52,
      hours_WPO: 26),
  const Subject(
      name: 'Geo-informatiekunde',
      SP: 6,
      semester: [2],
      hours_HOC: 26,
      hours_WPO: 26,
      hours_ZELF: 15),
  const Subject(
      name: 'Algemene biologie',
      SP: 6,
      semester: [1],
      hours_HOC: 26,
      hours_WPO: 39),
  const Subject(
      name: 'Evolutie',
      SP: 3,
      semester: [2],
      hours_HOC: 13,
      hours_WPO: 13,
      hours_ZELF: 13),
  const Subject(
      name: 'Biotechnologie',
      SP: 3,
      semester: [2],
      hours_HOC: 26,
      hours_WPO: 12),
  const Subject(name: 'Sociologie 1', SP: 6, semester: [1], hours_HOC: 39),
  const Subject(name: 'Marketing', SP: 4, semester: [2], hours_HOC: 32),
  const Subject(
      name: 'Sociale psychologie 1', SP: 3, semester: [1], hours_HOC: 26),
  const Subject(
      name: 'Inleiding tot het bedrijfsbeheer',
      SP: 3,
      semester: [1],
      hours_WPO: 26),
  const Subject(
      name: 'Academic English (semester 1)',
      SP: 3,
      semester: [1],
      hours_WPO: 26),
  const Subject(
      name: 'Academic English (semester 2)',
      SP: 3,
      semester: [2],
      hours_WPO: 26),
  const Subject(
      name: 'Ontwikkeling, gebruik en beleid van nieuwe media',
      SP: 6,
      semester: [1],
      hours_HOC: 20,
      hours_WPO: 15,
      hours_ZELF: 128),
  const Subject(
      name: 'Business Aspects of Software Industry',
      SP: 3,
      semester: [1],
      hours_HOC: 26,
      hours_ZELF: 58),
  const Subject(
      name: 'Redelijk eigenzinning: nadenken over mens en maatschappij',
      SP: 3,
      semester: [1, 2],
      hours_HOC: 12,
      hours_WPO: 20,
      hours_ZELF: 30),
];

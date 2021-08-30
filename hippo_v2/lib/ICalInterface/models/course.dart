import 'package:hippo_v2/ICalInterface/iCalInterface.dart';

import 'group.dart';

class Course implements ICalInterface{
  final String name;
  final List<ICalInterface>? nextData;

  const Course({
    required this.name,
    this.nextData
  });
}

const List<Course> Bachelor_LeW = <Course>[
  const Course(name: 'Geschiedenis',),
  const Course(name: 'Kunstwetenschappen en archeologie',),
  const Course(name: 'Taal en letterkunde',),
  const Course(name: 'Toegepaste Taalkunde',),
  const Course(name: 'Wijsbegeerte en moraalwetenschappen',),
  const Course(name: 'Exchange programmes',),
];

const List<Course> Master_LeW = <Course>[
  const Course(name: 'Gender en diversiteit',),
  const Course(name: 'Geschiedenis',),
  const Course(name: 'Journalistiek',),
  const Course(name: 'Kunstwetenschappen en archeologie',),
  const Course(name: 'Linguistics and Literary Studies',),
  const Course(name: 'Research Master of Arts in Philosophy',),
  const Course(name: 'Taal en letterkunde',),
  const Course(name: 'Tolken',),
  const Course(name: 'Vertalen',),
  const Course(name: 'Wijsbegeerte en moraalwetenschappen',),
  const Course(name: 'Exchange programmes',),
];

const List<Course> SeV_LeW = <Course>[
  const Course(name: 'Journalistiek',),
  const Course(name: 'Kunstwetenschappen en archeologie',),
  const Course(name: 'Taal en letterkunde',),
  const Course(name: 'Tolken',),
  const Course(name: 'Vertalen',),
  const Course(name: 'Wijsbegeerte en moraalwetenschappen',),
  const Course(name: 'Geschiedenis',),
];

const List<Course> Manama_LeW = <Course>[
  const Course(name: 'Archivistiek: erfgoed- en hedendaags documentatiebeheer',),
];

const List<Course> EMaster_LeW = <Course>[
  const Course(name: 'Educatieve Master : Cultuurwetenschappen',),
  const Course(name: 'Educatieve Master : Talen',),
];


const List<Course> Bachelor_ReC = <Course>[
  const Course(name: 'Criminologische Wetenschappen',),
  const Course(name: 'Rechten',),
  const Course(name: 'Werkstudenten (WS) Criminologische Wetenschappen',),
  const Course(name: 'Werkstudenten (WS) Rechten',),
];

const List<Course> Master_ReC = <Course>[
  const Course(name: 'Criminologische Wetenschappen',),
  const Course(name: 'Rechten',),
  const Course(name: 'Werkstudenten (WS) Criminologische Wetenschappen',),
  const Course(name: 'Werkstudenten (WS) Rechten',),
  const Course(name: 'Erasmus Programme',),
];

const List<Course> SeV_ReC = <Course>[
  const Course(name: 'Rechten',),
  const Course(name: 'Sociaal recht',),
  const Course(name: 'Werkstudenten (WS) Rechten',),
  const Course(name: 'Internationaal en Europees Recht',),
  const Course(name: 'Samenwerkingsakkoorden',),
];

const List<Course> Manama_ReC = <Course>[
  const Course(name: 'Internationaal en Europees Recht',),
  const Course(name: 'International European Law',),
  const Course(name: 'Maritime Law (UGent)',),
  const Course(name: 'Notariaat',),
  const Course(name: 'Sociaal recht',),
];

const List<Course> PGrad_ReC = <Course>[
  const Course(name: 'Postgraduaat RC',),
];

const List<Course> EMaster_ReC = <Course>[
  const Course(name: 'Educatieve Master : Maatschappijwetenschappen',),
];

const List<Course> Bachelor_PeE = <Course>[
  const Course(name: 'Agogische Wetenschappen',),
  const Course(name: 'Psychologie',),
  const Course(name: 'Werkstudenten (WS) Psychologie',),
];

const List<Course> Master_PeE = <Course>[
  const Course(name: 'Agogische Wetenschappen',),
  const Course(name: 'Educational Sciences',),
  const Course(name: 'Onderwijskunde',),
  const Course(name: 'Psychologie',),
  const Course(name: 'Werkstudenten (WS) Psychologie',),
];

const List<Course> SeV_PeE = <Course>[
  const Course(name: 'Agogische Wetenschappen',),
  const Course(name: 'Psychologie',),
  const Course(name: 'Werkstudenten (WS) Psychologie',),
];

const List<Course> EMaster_PeE = <Course>[
  const Course(name: 'Educatieve Master : Gedragswetenschappen',),
];

const List<Course> Bachelor_SWeSBS = <Course>[
  const Course(name: 'Business Economics',),
  const Course(name: 'Communicatiewetenschappen',),
  const Course(name: 'Handelsingenieur',),
  const Course(name: 'Politieke Wetenschappen',),
  const Course(name: 'Social Sciences',),
  const Course(name: 'Sociologie',),
  const Course(name: 'Toegepaste Economische Wetenschappen',),
  const Course(name: 'Erasmus Programme',),
  const Course(name: 'Werkstudenten (WS) Toegepaste Economische Wetenschappen',),
];

const List<Course> Master_SWeSBS = <Course>[
  const Course(name: 'Handelsingenieur',),
  const Course(name: 'Toegepaste Economische Wetenschappen',),
  const Course(name: 'Bedrijfskunde',),
  const Course(name: 'Business and Technology',),
  const Course(name: 'Communicatiewetenschappen',),
  const Course(name: 'Communication Studies',),
  const Course(name: 'Erasmus Programme',),
  const Course(name: 'International Business',),
  const Course(name: 'Management',),
  const Course(name: 'Political Science',),
  const Course(name: 'Politieke Wetenschappen',),
  const Course(name: 'Sociologie',),
  const Course(name: 'Werkstudenten (WS) Bedrijfskunde',),
  const Course(name: 'Werkstudenten (WS) Politieke Wetenschappen',),
  const Course(name: 'Werkstudenten (WS) Sociologie',),
  const Course(name: 'Werkstudenten (WS) Toegepaste Economische Wetenschappen',),
];

const List<Course> SeV_SWeSBS = <Course>[
  const Course(name: 'Bedrijfskunde',),
  const Course(name: 'Business and Technology',),
  const Course(name: 'Communicatiewetenschappen',),
  const Course(name: 'Communication Studies',),
  const Course(name: 'International Business',),
  const Course(name: 'Management',),
  const Course(name: 'Politieke Wetenschappen',),
  const Course(name: 'Sociologie',),
  const Course(name: 'Toegepaste Economische Wetenschappen',),
  const Course(name: 'Werkstudenten (WS) Bedrijfskunde',),
  const Course(name: 'Werkstudenten (WS) Politieke Wetenschappen',),
  const Course(name: 'Werkstudenten (WS) Sociologie',),
  const Course(name: 'Werkstudenten (WS) Toegepaste Economische Wetenschappen',),

];

const List<Course> Manama_SWeSBS = <Course>[
  const Course(name: 'Euromaster',),
];

const List<Course> EMaster_SWeSBS = <Course>[
  const Course(name: 'Educatieve Master : Economie',),
  const Course(name: 'Educatieve Master : Maatschappijwetenschappen',),
];

const List<Course> Bachelor_IR = <Course>[
  const Course(name: 'Industriële Wetenschappen',),
  const Course(name: 'Ingenieurswetenschappen',),
  const Course(name: 'Ingenieurswetenschappen : Architectuur',),
];

const List<Course> Master_IR = <Course>[
  const Course(name: 'Applied Sciences and Engineering : Applied Computer Science',),
  const Course(name: 'Architectural Engineering',),
  const Course(name: 'Biomedical Engineering',),
  const Course(name: 'Civil Engineering',),
  const Course(name: 'Electrical Engineering',),
  const Course(name: 'Engineering Aeronautics',),
  const Course(name: 'Engineering Energy',),
  const Course(name: 'Engineering Materials',),
  const Course(name: 'Engineering Mechanics-Construction',),
  const Course(name: 'Engineering Process Technology',),
  const Course(name: 'Engineering Vehicle technology and transport',),
  const Course(name: 'Industriële Wetenschappen : elektromica ICT',),
  const Course(name: 'Industriële Wetenschappen Elektromechanica',),
  const Course(name: 'Ingenieurswetenschappen : biomedische wetenschappen',),
  const Course(name: 'Ingenieurswetenschappen : fotonica',),
  const Course(name: 'Ingenieurswetenschappen : toegepaste computerwetenschappen',),
  const Course(name: 'Photonic Engineering',),
  const Course(name: 'Physical Land Resources',),
  const Course(name: 'Water Resources Engineering',),
];

const List<Course> SeV_IR = <Course>[
  const Course(name: 'Industriële Wetenschappen',),
];

const List<Course> EMaster_IR = <Course>[
  const Course(name: 'Educatieve Master : Wetenschappen en Technologie',),
];

const List<Course> Bachelor_WeBIR = <Course>[
  const Course(name: 'Bio-Ingenieurswetenschappen',),
  const Course(name: 'Biologie',),
  const Course(name: 'Chemie',),
  const Course(name: 'Computerwetenschappen',),
  const Course(name: 'Fysica en sterrenkunde',),
  const Course(name: 'Geografie',),
  const Course(name: 'Wiskunde',),
  const Course(name: '7de jaar Bijzonder Wetenschappelijke vorming KA Etterbeek',),
];

const List<Course> Master_WeBIR = <Course>[
  const Course(name: 'Bio-Ingenieurswetenschappen : cel- en genbiotechnologie',),
  const Course(name: 'Bio-Ingenieurswetenschappen : chemie en bioprocestechnologie',),
  const Course(name: 'Biologie',),
  const Course(name: 'Biology',),
  const Course(name: 'Biomolecularie wetenschappen',),
  const Course(name: 'Biomulecar Sciences',),
  const Course(name: 'Chemistry',),
  const Course(name: 'Computer Science',),
  const Course(name: 'Geografie',),
  const Course(name: 'Geography',),
  const Course(name: 'Marine Lacustrince Science Planning',),
  const Course(name: 'Molecular Biology',),
  const Course(name: 'Physics and Astronomy',),
  const Course(name: 'Stedenbouw en de Ruimtelijke Planning',),
  const Course(name: 'Toegepaste Informatica',),
  const Course(name: 'Urban Studies',),
  const Course(name: 'Werkstudenten (WS) Toegepaste Informatica',),
  const Course(name: 'Wiskunde',),
];

const List<Course> SeV_WeBIR = <Course>[
  const Course(name: 'Biologie',),
  const Course(name: 'Computerwetenschappen',),
  const Course(name: 'Fysica en sterrenkunde',),
  const Course(name: 'Geografie',),
  const Course(name: 'Toegepaste Informatica',),
  const Course(name: 'Werkstudenten (WS) Toegepaste Informatica',),
];

const List<Course> Manama_WeBIR = <Course>[
  const Course(name: 'Actuariële Wetenschappen',),
];

const List<Course> EMaster_WeBIR = <Course>[
  const Course(name: 'Educatieve Master : Wetenschappen en Technologie',),
];

const List<Course> Bachelor_GeF = <Course>[
  const Course(name: 'Biomedische Wetenschappen',),
  const Course(name: 'Farmaceutische Wetenschappen',),
  const Course(name: 'Geneeskunde',),
];

const List<Course> Master_GeF = <Course>[
  const Course(name: 'Biomedical Sciences',),
  const Course(name: 'Biomedische wetenschappen',),
  const Course(name: 'Farmaceutische zorg',),
  const Course(name: 'Geneeskunde',),
  const Course(name: 'Geneesmiddelenontwikkeling',),
  const Course(name: 'Gerontological Sciences',),
  const Course(name: 'Management en het beleid van de gezondheidszorg',),
  const Course(name: 'Management, zorg en beleid in de gerontologie',),
  const Course(name: 'Master Classes',),
];

const List<Course> SeV_GeF = <Course>[
  const Course(name: 'Management en het beleid van de gezondzorg',),
  const Course(name: 'Management, zorg en beleid in de gerontologie',),
];

const List<Course> Manama_GeF = <Course>[
  const Course(name: 'Arbeidsgeneeskunde',),
  const Course(name: 'Huisartsgeneeskunde',),
  const Course(name: 'Industrïele farmacie',),
  const Course(name: 'Jeugdgezondheidszorg',),
  const Course(name: 'Specialistische geneeskunde',),
  const Course(name: 'Ziekenhuisfarmacie',),
  const Course(name: 'Ziekenhuishygiëne',),
];

const List<Course> EMaster_GeF = <Course>[
  const Course(name: 'Educatieve Master : Gezondheidswetenschappen',),
];

const List<Course> Bachelor_LOeK = <Course>[
  const Course(name: 'Lichamelijke opvoeding en bewegingswetenschappen',),
  const Course(name: 'Revalidatiewetenschappen en Kinesitherapie',),
];

const List<Course> Master_LOeK = <Course>[
  const Course(name: 'Revalidatiewetenschappen en Kinesitherapie',),
  const Course(name: 'Bewegings- en Sportwetenschappen',),
];

const List<Course> SeV_LOeK = <Course>[
  const Course(name: 'Revalidatiewetenschappen en Kinesitherapie',),
];

const List<Course> Manama_LOeK = <Course>[
  const Course(name: 'Manuele Therapie',),
];

const List<Course> PGrad_LOeK = <Course>[
  const Course(name: 'Postgraduaat Manuele Therapie',),
  const Course(name: 'Postgraduaat Sportmanagement',),
];

const List<Course> EMaster_LOeK = <Course>[
  const Course(name: 'Educatieve Master : Lichamelijke Opvoeding en Bewegingswetenschappen',),
];

const List<Course> EMaster_MILO = <Course>[
  const Course(name: 'EduMa - Verkort Programma',),
  const Course(name: 'EduMa - start 2de semester',),
  const Course(name: 'EduMa in de Cultuurwetenschappen - AR Geschiedenis',),
  const Course(name: 'EduMa in de Cultuurwetenschappen - AR Kunstwetenschappen en erfgoedstudies',),
  const Course(name: 'EduMa in de Cultuurwetenschappen - AR Moraalwetenschappen en humanistiek',),
  const Course(name: 'EduMa in de Economie',),
  const Course(name: 'EduMa in de Gedragswetenschappen AR Agogische wetenschappen',),
  const Course(name: 'EduMa in de Gedragswetenschappen AR Psychologie',),
  const Course(name: 'EduMa in de Gezondheidswetenschappen',),
  const Course(name: 'EduMa in de Lichamelijke wetenschappen',),
  const Course(name: 'EduMa in de Maatschappijwetenschappen AR Communicatiewetenschappen',),
  const Course(name: 'EduMa in de Maatschappijwetenschappen AR Criminologische Wetenschappen',),
  const Course(name: 'EduMa in de Maatschappijwetenschappen AR Politieke wetenschappen en sociologie',),
  const Course(name: 'EduMa in de Maatschappijwetenschappen AR Rechten',),
  const Course(name: 'EduMa in de Wetenschappen en Technologie - AR Biologie',),
  const Course(name: 'EduMa in de Wetenschappen en Technologie - AR Chemie',),
  const Course(name: 'EduMa in de Wetenschappen en Technologie - AR Computerwetenschappen',),
  const Course(name: 'EduMa in de Wetenschappen en Technologie - AR Fysica',),
  const Course(name: 'EduMa in de Wetenschappen en Technologie - Geografie',),
  const Course(name: 'EduMa in de Wetenschappen en Technologie - AR Ingenieurswetenschappen',),
  const Course(name: 'EduMa in de Wetenschappen en Technologie - AR Wiskunde',),
  const Course(name: 'EduMa Talen',),
  const Course(name: 'EduMa LIO-programma',),
  const Course(name: 'EduMa SLO-programma',),
];

const List<Course> Doctor_CD = <Course>[
  const Course(name: 'Doctoral Training Programme',),
];

const List<Course> Vlucht_ICP = <Course>[
  const Course(name: 'InCAMPUS Introductory Programme',),
];

import 'package:hippo_v2/ICalInterface/iCalInterface.dart';

import 'course.dart';

class Faculty implements ICalInterface {
  final String name;
  final List<ICalInterface>? nextData;

  const Faculty({
    required this.name,
    this.nextData,
  });

  @override
  String getName() => name;
}

const List<Faculty> Bachelor = <Faculty>[
  const Faculty(name: 'Letteren en Wijsbegeerte', nextData: Bachelor_LeW),
  const Faculty(name: 'Recht en Criminologie', nextData: Bachelor_ReC),
  const Faculty(
      name: 'Psychologie en Educatiewetenschappen', nextData: Bachelor_PeE),
  const Faculty(
      name: 'Sociale Wetenschappen & Solvay Business School',
      nextData: Bachelor_SWeSBS),
  const Faculty(name: "Ingenieurswetenschappen", nextData: Bachelor_IR),
  const Faculty(
      name: 'Wetenschappen en Bio-Ingenieurswetenschappen',
      nextData: Bachelor_WeBIR),
  const Faculty(name: 'Geneeskunde en Farmacie', nextData: Bachelor_GeF),
  const Faculty(
      name: 'Lichamelijke Opvoeding en Kinesitherapie',
      nextData: Bachelor_LOeK),
];

const List<Faculty> Master = <Faculty>[
  const Faculty(name: 'Letteren en Wijsbegeerte', nextData: Master_LeW),
  const Faculty(name: 'Recht en Criminologie', nextData: Master_ReC),
  const Faculty(
      name: 'Psychologie en Educatiewetenschappen', nextData: Master_PeE),
  const Faculty(
      name: 'Sociale Wetenschappen & Solvay Business School',
      nextData: Master_SWeSBS),
  const Faculty(name: "Ingenieurswetenschappen", nextData: Master_IR),
  const Faculty(
      name: 'Wetenschappen en Bio-Ingenieurswetenschappen',
      nextData: Master_WeBIR),
  const Faculty(name: 'Geneeskunde en Farmacie', nextData: Master_GeF),
  const Faculty(
      name: 'Lichamelijke Opvoeding en Kinesitherapie', nextData: Master_LOeK),
];

const List<Faculty> SeV = <Faculty>[
  const Faculty(name: 'Letteren en Wijsbegeerte', nextData: SeV_LeW),
  const Faculty(name: 'Recht en Criminologie', nextData: SeV_ReC),
  const Faculty(
      name: 'Psychologie en Educatiewetenschappen', nextData: SeV_PeE),
  const Faculty(
      name: 'Sociale Wetenschappen & Solvay Business School',
      nextData: SeV_SWeSBS),
  const Faculty(name: "Ingenieurswetenschappen", nextData: SeV_IR),
  const Faculty(
      name: 'Wetenschappen en Bio-Ingenieurswetenschappen',
      nextData: SeV_WeBIR),
  const Faculty(name: 'Geneeskunde en Farmacie', nextData: SeV_GeF),
  const Faculty(
      name: 'Lichamelijke Opvoeding en Kinesitherapie', nextData: SeV_LOeK),
];

const List<Faculty> Manama = <Faculty>[
  const Faculty(name: 'Letteren en Wijsbegeerte', nextData: Manama_LeW),
  const Faculty(name: 'Recht en Criminologie', nextData: Manama_ReC),
  const Faculty(
      name: 'Sociale Wetenschappen & Solvay Business School',
      nextData: Manama_SWeSBS),
  const Faculty(
      name: 'Wetenschappen en Bio-Ingenieurswetenschappen',
      nextData: Manama_WeBIR),
  const Faculty(name: 'Geneeskunde en Farmacie', nextData: Manama_GeF),
  const Faculty(
      name: 'Lichamelijke Opvoeding en Kinesitherapie', nextData: Manama_LOeK),
];

const List<Faculty> PGrad = <Faculty>[
  const Faculty(name: 'Recht en Criminologie', nextData: PGrad_ReC),
  const Faculty(
      name: 'Lichamelijke Opvoeding en Kinesitherapie', nextData: PGrad_LOeK),
];

const List<Faculty> EMaster = <Faculty>[
  const Faculty(name: 'Letteren en Wijsbegeerte', nextData: EMaster_LeW),
  const Faculty(name: 'Recht en Criminologie', nextData: EMaster_ReC),
  const Faculty(
      name: 'Psychologie en Educatiewetenschappen', nextData: EMaster_PeE),
  const Faculty(
      name: 'Sociale Wetenschappen & Solvay Business School',
      nextData: EMaster_SWeSBS),
  const Faculty(name: "Ingenieurswetenschappen", nextData: EMaster_IR),
  const Faculty(
      name: 'Wetenschappen en Bio-Ingenieurswetenschappen',
      nextData: EMaster_WeBIR),
  const Faculty(name: 'Geneeskunde en Farmacie', nextData: EMaster_GeF),
  const Faculty(
      name: 'Lichamelijke Opvoeding en Kinesitherapie', nextData: EMaster_LOeK),
  const Faculty(
      name: "Multidisciplinair Instituut Lerarenopleiding (MILO)",
      nextData: EMaster_MILO),
];

const List<Faculty> Doctor = <Faculty>[
  const Faculty(name: "Centrale Doctoraatsopleiding", nextData: Doctor_CD),
];

const List<Faculty> Vlucht = <Faculty>[
  const Faculty(name: 'InCAMPUS project', nextData: Vlucht_ICP),
];

import 'package:flutter/material.dart';

class Subject{
  final String id;
  String name;
  bool? classThisWeek = null;
  String? dayOfNextClass = null;
  String? timeOfNextClass = null;
  double? weightedGrade = null;
  double? writtenGrade = null;
  double? practicalGrade = null;
  double? oralGrade = null;
  String? location = null;
  String? teacher = null;
  String? note = null;
  double? objective = null;
  Color color;
  final Map<int, List<int>> initialSchedule;

  Subject({
    required this.id,
    required this.name,
    this.classThisWeek,
    this.dayOfNextClass,
    this.timeOfNextClass,
    this.weightedGrade,
    this.writtenGrade,
    this.practicalGrade,
    this.oralGrade,
    this.location,
    this.teacher,
    this.note,
    this.objective,
    required this.color,
    this.initialSchedule = const {
      0: [],
      1: [],
      2: [],
      3: [],
      4: [],
      5: [],
      6: [],
    },
  });
}
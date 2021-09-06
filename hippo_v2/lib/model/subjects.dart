import 'package:flutter/material.dart';

class Subject{
  final String id;
  String name;
  bool? classThisWeek = null;
  String? dayOfNextClass = null;
  String? timeOfNextClass = null;
  double? weightedGrade = null;
  double? writtenGrade = null;
  double? oralGrade = null;
  String? location = null;
  String? teacher = null;
  String? note = null;
  double? objective = null;
  Color color;

  Subject({
    required this.id,
    required this.name,
    this.classThisWeek,
    this.dayOfNextClass,
    this.timeOfNextClass,
    this.weightedGrade,
    this.writtenGrade,
    this.oralGrade,
    this.location,
    this.teacher,
    this.note,
    this.objective,
    required this.color,
  });
}
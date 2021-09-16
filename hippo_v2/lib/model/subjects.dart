import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

enum GradeType{
  Theory,
  Practical,
  Oral,
  Objective,
  Weighted,
  Generic,
}

//TODO: grading system in grade system:
/*
  * 0 to 10 | 0 to 12 | 0 to 15 | 0 to 20 | 0 to 30 | 0 to 100 | 1 to 6
  * 6 to 1 | 0 to 5 | 0 to 7 | A to F (+ en - allowed)
   */
class Grade{
  String name;
  GradeType type;
  double value;
  double weight;
  DateTime date = DateTime.now();
  String note;

  Grade({
    required this.name,
    this.type = GradeType.Generic,
    this.value = 0.0,
    this.weight = 1.0,
    this.note = '',
    DateTime? date,
  }) {
    this.date = date ?? this.date;
  }

  double get average {
    return this.value;
  }

}

class GradeGroup extends Grade {
  List<Grade> grades = const [];

  GradeGroup({
    required this.grades,
    required name,
    type,
    value,
    weight = 1.0,
    note = '',
    DateTime? date,
  }) : super(
      name: name,
      type: type,
      value: value,
      weight: weight,
      note: note,
      date: date,
  );

  /* //TODO: calculate_avg()
  double get average {
    return grades
        .map((grade) => grade.average*grade.weight) // of zo iets
        .calculate_avg();
  }
*/
}

class Subject{
  final String id;
  String name;
  DateTime? nextClass;
  //GradeGroup grades; TODO: doesn't work
  String location;
  String teacher;
  String note;
  Color color;
  List<DateTime> schedule;

  Subject({
    required this.id,
    required this.name,
    this.nextClass,
    //this.grades = const GradeGroup(grades: [], name: ''),
    this.location = '',
    required this.teacher,
    this.note = '',
    this.color = const Color(0xff4285F4),
    this.schedule = const [],
  });

  Widget whatIsNextClass(){
    DateTime? next = this.nextClass;
    DateTime now = DateTime.now();
    DateFormat weekdayFormatter = DateFormat('EEEE');
    DateFormat timeFormatter = DateFormat('Hm');

    int weekNumber(DateTime date) {
      int dayOfYear = int.parse(DateFormat("D").format(date));
      return ((dayOfYear - date.weekday + 10) / 7).floor();
    }


    if(next != null){
      if(weekNumber(next)==weekNumber(now)){
        String weekday = weekdayFormatter.format(next);
        String time = timeFormatter.format(next);
        return Text("${weekday} • ${time}");
      } else {
        return Text("No class this week");
      }

    } else {
      return Text("No more classes of this subject");
    }
  }

  /*
  double percentOfWeightedGrade(double? grade){
    if(grade == null){
      return 0.01;
    } else {
      return grade / 2 / 10;
    }
  }

  String totalGradeString(double? grade){
    if(grade == null){
      return '-';
    } else {
      return "${grade.toStringAsFixed(1)}";
    }
  }

  Color progressColorOfGrade(double? grade){
    if(grade != null){
      if(grade >= 0.5){
        return Color(0xff18ba7f);
      } else {
        return Color(0xffffcc00);
      }
    } else {
      return Color(0xffbababa);
    }
  }

  Color backgroundColorOfGrade(double? grade){
    if(grade != null){
      if(grade >= 0.5){
        return Color(0x4D18ba7f);
      } else {
        return Color(0x4Dffcc00);
      }
    } else {
      return Color(0x4Dbababa);
    }
  }

  double? weightedGrade(double? TGrade, double? PGrade, double? OGrade,
      double TWeight, double PWeight, double OWeight){
    double res = 0;
    if(TGrade == null && PGrade == null && OGrade == null){
      return null;
    } else {
      if(TGrade != null){
        res = res + TGrade*TWeight;
      }
      if(PGrade != null){
        res = res + PGrade*PWeight;
      }
      if(OGrade != null){
        res = res + OGrade*OWeight;
      }
      return res;
    }
  }

  double? objectiveGrade(){
    List<Grade> grades = this.grades;
    double? grade = null;
    var i=0;
    while(i < grades.length){
      if(grades[i].type == GradeType.Objective){
        grade = grades[i].value;
      }
      i=i+1;
    }
    return grade;
  }

  double? gradeAverage(GradeType type){
    List<Grade> grades = this.grades;
    List<double> list = [];
    double average = 0;
    var i = 0;
    while(i<grades.length){
      if(grades[i].type == type){
        list.add(grades[i].value);
      }
      i=i+1;
    }
    if(list.isEmpty){
      return null;
    } else {
      average = list.reduce((a, b) => a + b);
      average = average/list.length;
      return average;
    }
  }

  double weightPercentageOfGradeAverage(GradeType type){
    List<Weight> weights = this.weights;
    double weight = 0;
    var i = 0;
    while(i<weights.length){
      if(weights[i].type == type){
        weight = weights[i].percentage;
      }
      i=i+1;
    }
    return weight;
  }

  Widget objectivePercentage(double grade){
    if(grade == 0.01){
      return Text("");
    } else {
      return Text(
          "${(grade*100).toStringAsFixed(1)}%",
          style: TextStyle(
              color: Colors.black.withOpacity(0.6),
              fontWeight: FontWeight.bold
          )
      );
    }
  }

  double percentTillObjective(double? weightedGrade, double? objective){
    if(objective == null){
      if(weightedGrade != null){
        return 0.01;
      } else {
        return 0.01;
      }
    } else {
      if(weightedGrade != null){
        if(objective > weightedGrade){
          return weightedGrade / objective;
        } else {
          return 1.0;
        }
      } else {
        return 0.01;
      }
    }
  }
  */


}
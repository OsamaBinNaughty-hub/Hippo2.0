// TODO: better implementation for the LEVELS / FACULTY'S / COURSES / GROUPS / SUBJECTS
// ^ it's way to naive solution right now. Maybe web scraping? Maybe contact VUB for DB access?
// ^ the way it is rn, is way too much work to find every group/subject.
// ^ Maybe get it to work for the 3 years of bachelor Ingenieurswetenschappen & Computerwetenschappen

import 'package:hippo_v2/view/widget/landing_widgets/dropdown.dart';

class ICalInterface implements IDropdownListItem {
  final String name = "Nothing Selected";
  final List<ICalInterface>? nextData = const [];

  // Make sure that usage is still abstract
  ICalInterface() {
    throw Exception("Interfaces should not be initialized");
  }

  // workaround for lack of interface instantiation in Dart
  ICalInterface.getDefault();

  @override
  bool operator ==(Object other) {
    return other is ICalInterface && other.name == name;
  }

  @override
  // TODO: Implement hashCode
  int get hashCode => super.hashCode;

  @override
  String getName() => name;
}

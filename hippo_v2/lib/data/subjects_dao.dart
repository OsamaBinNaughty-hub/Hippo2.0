import 'package:sembast/sembast.dart';
import 'package:hippo_v2/data/app_database.dart';
import 'package:hippo_v2/model/subjects.dart';

class SubjectDao {
  static const String SUBJECT_STORE_NAME = 'subjects';
  // a store with int keys and Map<String, dynamic> values.
  // this store acts like a persistent map, values of which are Subject objects converted to Map
  final _subjectStore = intMapStoreFactory.store(SUBJECT_STORE_NAME);

  // private getter to shorten the amount of code needed to get the
  // singleton instance of an opened db.
  Future<Database> get _db async => await AppDatabase.instance.database;

  Future insert(Subject subject) async {
    await _subjectStore.add(await _db, subject.toMap());
  }

  Future update(Subject subject) async {
    final finder = Finder(filter: Filter.byKey(subject.id));
    await _subjectStore.update(await _db, subject.toMap(), finder: finder);
  }

  Future delete(Subject subject) async {
    final finder = Finder(filter: Filter.byKey(subject.id));
    await _subjectStore.delete(await _db, finder:  finder);
  }

  Future<List<Subject>> getAllSortedByName() async {
    // finder object can also sort data.
    final finder = Finder(sortOrders: [SortOrder('name'),]);
    final recordSnapshots = await _subjectStore.find(await _db, finder:  finder);

    // making a List<Subject> out of List<RecordSnapshot>
    return recordSnapshots.map((snapshot) {
      final subject = Subject.fromMap(snapshot.value);
      subject.id = snapshot.key;
      return subject;
    }).toList();
  }

}
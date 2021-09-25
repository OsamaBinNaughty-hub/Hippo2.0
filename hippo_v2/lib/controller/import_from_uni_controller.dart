import 'package:get_it/get_it.dart';
import 'package:hippo_v2/ICalInterface/models/importuni.dart';
import 'package:hippo_v2/constants.dart';
import 'package:http/http.dart' as http;

abstract class ImportFromUniController {
  static Map<String, dynamic> getOptions(List<String> path) {
    var cache = GetIt.instance<ImportFromUniCache>();

    // Check if loaded already
    if (cache.rawJson == null) {
      return new Map();
    }

    // process data
    return cache.getOptions(path) ?? new Map();
  }

  /// Fetch JSON with cache
  /// Only the first call to this function actually fetches
  /// Race conditions are eliminated with a lock in the data
  /// @params invalidateCache to force refetching has no influence on the locks
  /// @returns true if an actual fetch happened
  static Future<bool> fetchJson({bool invalidateCache = false}) async {
    print("Fetching data");
    var cache = GetIt.instance<ImportFromUniCache>();

    // early return for when cache already exists
    if (invalidateCache || cache.rawJson != null) return false;

    // return early if already fetching
    if (cache.isFetching) return false;

    // acquire lock
    cache.isFetching = true;

    var resp = await http.get(Uri.parse(ICAL_IMPORT_URL));
    if (resp.statusCode != 200) throw Exception("Failed to load JSON");

    // Put data in cache
    cache.importJson(resp.body);

    // release lock
    cache.isFetching = false;

    return true;
  }
}

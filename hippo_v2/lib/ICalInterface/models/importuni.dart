import 'dart:convert';
import 'dart:core';

class ImportFromUniCache {
  Map<String, dynamic>? rawJson;

  /// Lock on fetching
  bool isFetching = false;

  /// Throws when rawJson is not a Map
  void importJson(String rawJson) {
    this.rawJson = jsonDecode(rawJson);
  }

  /// null when path incorrect or cache not loaded yet
  Map<String, dynamic>? getOptions(List<String> path) {
    // walk tree with path
    var current = rawJson;
    for (var part in path) {
      current = current?[part];
    }

    return current;
  }
}

class JsonGroup {
  String url;
  String id;
  String value;

  JsonGroup({
    required this.url,
    required this.id,
    required this.value,
  });
}

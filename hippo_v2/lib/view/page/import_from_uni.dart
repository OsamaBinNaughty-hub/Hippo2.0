import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:hippo_v2/ICalInterface/models/importuni.dart';
import 'package:hippo_v2/controller/import_from_uni_controller.dart';
import 'package:hippo_v2/view/widget/landing_widgets/dropdown.dart';

class ImportFromUni extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => ImportFromUniState();
}

class ImportFromUniState extends State<ImportFromUni> {
  /// Contains selected path
  List<String> path = const [];

  /// Whether or not a valid course has been selected
  bool hasCourseSelected = false;
  bool courseNotFound = false;

  /// Building selection based on path
  List<Widget> buildTreeWalker() => path
      .asMap()
      .entries
      .map((e) => DropdownList<_ListItem>(
          // Get current options
          contentList: ImportFromUniController.getOptions(
                  path.getRange(0, e.key).toList())
              .keys
              .map((e) => _ListItem(e))
              .toList(),
          onChange: (newE) => setState(() {
                // Update path with new selection
                path = path.getRange(0, e.key + 1).toList();
                path[e.key] = newE.getName();
                var next = ImportFromUniController.getOptions(path);

                // Do basic validation and check data
                if (next["url"] != null) {
                  // detecting if last with url
                  hasCourseSelected = true;
                  courseNotFound = false;
                  print("Course detected");
                } else if (next.keys.isEmpty) {
                  // no valid selection
                  courseNotFound = true;
                } else {
                  courseNotFound = false;
                  path.add(next.keys.first);
                }
              }),
          selectItem: _ListItem(e.value))) // => List<DropdownList
      .toList();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: FutureBuilder(
          future: ImportFromUniController.fetchJson(),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              // update path with first layer if empty
              if (path.isEmpty) {
                var cache = GetIt.instance<ImportFromUniCache>();
                path = [cache.rawJson!.keys.first];
              }
              return Column(
                children: [
                  Column(
                    children: buildTreeWalker(),
                  ),
                  if (courseNotFound) Text("Invalid combination"),
                  if (hasCourseSelected)
                    Column(
                        children: ImportFromUniController.getOptions(path)
                            .entries
                            .map((e) => Text("${e.key}: ${e.value}"))
                            .toList()),
                ],
              );
            } else if (snapshot.hasError)
              return Text("Couldn't fetch data");
            else
              return Center(
                child: CircularProgressIndicator(),
              );
          }),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: !hasCourseSelected
            ? null
            : () {
                print("Downloading...");
              },
        backgroundColor:
            !hasCourseSelected ? Color(0xff9299a5) : Color(0xff4285f4),
        foregroundColor:
            !hasCourseSelected ? Color(0xffb3b3b3) : Color(0xffffffff),
        label: Text("Import"),
        icon: const Icon(Icons.cloud_download_outlined),
      ),
    );
  }
}

class _ListItem implements IDropdownListItem {
  String name;

  _ListItem(this.name);

  @override
  String getName() => name;

  @override
  bool operator ==(Object other) {
    return other is _ListItem && this.name == other.name;
  }

  @override
  // TODO: implement hashCode
  int get hashCode => super.hashCode;
}

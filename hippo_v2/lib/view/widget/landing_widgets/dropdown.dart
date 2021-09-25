import 'package:flutter/material.dart';

abstract class IDropdownListItem {
  String getName() => "";
}

class DropdownList<T extends IDropdownListItem> extends StatefulWidget {
  final List<T> contentList;
  final String labelText;
  final String disabledLabelText;
  final bool disabled;
  final Function(T) onChange;
  final T? selectItem;

  DropdownList({
    this.contentList = const [],
    this.labelText = "",
    this.disabledLabelText = "",
    this.disabled = false,
    required this.onChange,
    required this.selectItem,
  });

  @override
  _DropdownListState createState() => _DropdownListState<T>();
}

class _DropdownListState<T extends IDropdownListItem>
    extends State<DropdownList<T>> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        InputDecorator(
          decoration: InputDecoration(
            labelText:
                widget.disabled ? widget.disabledLabelText : widget.labelText,
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(40.0),
            ),
          ),
          child: DropdownButtonHideUnderline(
            child: Container(
              height: 20.0,
              child: DropdownButton<T>(
                isExpanded: true,
                value: widget.selectItem,
                onChanged: (T? value) {
                  if (widget.disabled) {
                    return null;
                  } // disable widget
                  return widget.onChange(value!);
                },
                items: itemsFromList(widget.contentList),
              ),
            ),
          ),
        ),
        SizedBox(
          height: 3 * 8,
        ),
      ],
    );
  }

  List<DropdownMenuItem<T>> itemsFromList(List<T> list) {
    if (widget.disabled == false) {
      return list
          .map<DropdownMenuItem<T>>((T value) => DropdownMenuItem<T>(
                value: value,
                child: Text(value.getName()),
              ))
          .toList();
    } else {
      return []; // to disable the next dropdown
    }
  }
}

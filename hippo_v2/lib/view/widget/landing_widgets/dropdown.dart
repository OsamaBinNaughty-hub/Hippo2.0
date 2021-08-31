import 'package:flutter/material.dart';
import 'package:hippo_v2/ICalInterface/iCalInterface.dart';

class DropdownList extends StatefulWidget {
  final List<ICalInterface> contentList;
  final String labelText;
  final String disabledLabelText;
  final bool disabled;
  final Function(ICalInterface) onChange;
  final ICalInterface? selectItem;

  DropdownList({
    this.contentList = const[],
    this.labelText = "",
    this.disabledLabelText = "",
    this.disabled = false,
    required this.onChange,
    required this.selectItem,
  });

  @override
  _DropdownListState createState() => _DropdownListState();
}

class _DropdownListState extends State<DropdownList> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        InputDecorator(
          decoration: InputDecoration(
            labelText: widget.disabled ? widget.disabledLabelText : widget.labelText,
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(40.0),
            ),
          ),
          child: DropdownButtonHideUnderline(
            child: Container(
              height: 20.0,
              child: DropdownButton<ICalInterface>(
                isExpanded: true,
                value: widget.selectItem,
                onChanged: (ICalInterface? value) {
                  if (widget.disabled) {
                    return null;
                  } // disable widget
                  if(widget.onChange != null){
                    return widget.onChange(value!);
                  }
                },
                items: itemsFromList(widget.contentList),
              ),
            ),
          ),
        ),
        SizedBox(height: 3*8,),
      ],
    );
  }

  List<DropdownMenuItem<ICalInterface>> itemsFromList(List<ICalInterface> list) {
    if(widget.disabled == false) {
      return
        [ICalInterface.getDefault(), ...list].map<
            DropdownMenuItem<ICalInterface>>((ICalInterface value) =>
            DropdownMenuItem<ICalInterface>(
              value: value,
              child: Text(value.name),
            )).toList();
    } else {
      return []; // to disable the next dropdown
    }
  }
}
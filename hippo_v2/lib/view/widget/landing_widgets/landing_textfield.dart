import 'package:flutter/material.dart';

class LandingTextField extends StatefulWidget {
  const LandingTextField({
    required this.labelText,
    required this.validatorText,
    required this.keyBoardType,
    required this.textEditingController,
  });

  final String labelText;
  final String validatorText;
  final TextInputType keyBoardType;
  final TextEditingController textEditingController;

  @override
  _LandingTextFieldState createState() => _LandingTextFieldState();
}

class _LandingTextFieldState extends State<LandingTextField> {
  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: TextFormField(
        decoration: InputDecoration(
            labelText: widget.labelText,
            fillColor: Colors.white,
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(30.0),
              borderSide: BorderSide(),
            )
        ),
        validator: (val){
          if(val == null || val.isEmpty){
            return widget.validatorText;
          } else {
            return null;
          }
        },
        keyboardType: widget.keyBoardType,
        controller: widget.textEditingController,
      ),
    );
  }
}
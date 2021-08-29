import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class LandingController extends ChangeNotifier{
  // call this function if you want to go to MainPage
  late Function(String) onAuthorization;

  TextEditingController firstNameController = new TextEditingController();
  TextEditingController lastNameController = new TextEditingController();
  TextEditingController emailController = new TextEditingController();

  @override
  void dispose() {
    firstNameController.dispose();
    lastNameController.dispose();
    emailController.dispose();
    super.dispose();
  }
}
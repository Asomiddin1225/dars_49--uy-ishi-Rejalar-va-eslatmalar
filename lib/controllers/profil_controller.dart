import 'package:flutter/material.dart';
import 'dart:io';

class ProfileController with ChangeNotifier {
  String _firstName = '';
  String _lastName = '';
  String _phoneNumber = '';
  File? _profilePicture;

  String get firstName => _firstName;
  String get lastName => _lastName;
  String get phoneNumber => _phoneNumber;
  File? get profilePicture => _profilePicture;

  void updateFirstName(String firstName) {
    _firstName = firstName;
    notifyListeners();
  }

  void updateLastName(String lastName) {
    _lastName = lastName;
    notifyListeners();
  }

  void updatePhoneNumber(String phoneNumber) {
    _phoneNumber = phoneNumber;
    notifyListeners();
  }

 
}

import 'package:flutter/material.dart';

class RegistrationData extends ChangeNotifier {
  String _email = '';
  String _name = '';
  String _password = '';
  bool _isFormValid = false;

  String get email => _email;
  String get name => _name;
  String get password => _password;
  bool get isFormValid => _isFormValid;

  void setEmail(String value) {
    _email = value;
    _validateForm();
  }

  void setName(String value) {
    _name = value;
    _validateForm();
  }

  void setPassword(String value) {
    _password = value;
    _validateForm();
  }

  void _validateForm() {
    _isFormValid = _email.isNotEmpty &&
        _name.isNotEmpty &&
        _password.isNotEmpty &&
        _email.contains('@');
    notifyListeners();
  }

  void clearData() {
    _email = '';
    _name = '';
    _password = '';
    _isFormValid = false;
    notifyListeners();
  }
}
import 'package:flutter/material.dart';
import '../Api/ApiService.dart';

class CountryProvider with ChangeNotifier {

  List<dynamic> _countries = [];
  bool _isLoading = false;
  String _errorMessage = '';

  List<dynamic> get countries => _countries;
  bool get isLoading => _isLoading;
  String get errorMessage => _errorMessage;

  Future<void> searchCountries(String query) async {
    if (query.isEmpty) {
      _countries = [];
      notifyListeners();
      return;
    }

    _isLoading = true;
    _errorMessage = '';
    notifyListeners();

    try {
      final results = await ApiService.fetchCountries(query);
      _countries = results;
    } catch (e) {
      _errorMessage = e.toString();
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }
}

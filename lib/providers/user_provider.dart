import 'package:flutter/foundation.dart';
import '../models/user.dart';
import '../services/api_service.dart';

class UserProvider extends ChangeNotifier {
  final ApiService _apiService = ApiService();

  List<User> _users = [];
  List<User> get users => _users;

  List<User> _filtered = [];
  List<User> get filtered => _filtered;

  bool _isLoading = false;
  bool get isLoading => _isLoading;

  String? _error;
  String? get error => _error;

  Future<void> fetchUsers() async {
    _isLoading = true;
    _error = null;
    notifyListeners();

    try {
      _users = await _apiService.fetchUsers();
      _filtered = List<User>.from(_users);
    } catch (e) {
      _error = e.toString();
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }

  Future<void> refresh() async {
    await fetchUsers();
  }

  void search(String query) {
    if (query.isEmpty) {
      _filtered = List<User>.from(_users);
    } else {
      final q = query.toLowerCase();
      _filtered = _users.where((u) => u.name.toLowerCase().contains(q)).toList();
    }
    notifyListeners();
  }
}

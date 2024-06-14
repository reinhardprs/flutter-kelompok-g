import 'package:money_manage/models/cost_model.dart';
import 'package:money_manage/models/type_model.dart';
import 'package:flutter/material.dart';
import '../models/user_model.dart';

final List<double> weeklySpending = [
  50.0,
  30.0,
  40.0,
  20.0,
  60.0,
  70.0,
  80.0,
];

_generateExpenses(int index) {
  List<CostModel> costModel = [];
  DateTime now = DateTime.now();

  if (index == 0) {
    costModel = [
      CostModel(name: 'House Custom 0', cost: 15.0, note: 'Note 1', createdAt: now, lastModifiedAt: now),
      CostModel(name: 'House Custom 1', cost: 25.0, note: 'Note 2', createdAt: now, lastModifiedAt: now),
      CostModel(name: 'House Custom 2', cost: 30.0, note: 'Note 3', createdAt: now, lastModifiedAt: now),
    ];
  } else if (index == 1) {
    costModel = [
      CostModel(name: 'Clothing Custom 0', cost: 18.0, note: 'Note 1', createdAt: now, lastModifiedAt: now),
      CostModel(name: 'Clothing Custom 1', cost: 22.0, note: 'Note 2', createdAt: now, lastModifiedAt: now),
    ];
  } else if (index == 2) {
    costModel = [
      CostModel(name: 'Food Custom 0', cost: 8.0, note: 'Note 1', createdAt: now, lastModifiedAt: now),
      CostModel(name: 'Ketoprak Custom', cost: 12.0, note: 'Note 2', createdAt: now, lastModifiedAt: now),
    ];
  } else if (index == 3) {
    costModel = [
      CostModel(name: 'Utilities Custom 0', cost: 12.0, note: 'Note 1', createdAt: now, lastModifiedAt: now),
      CostModel(name: 'Utilities Custom 1', cost: 15.0, note: 'Note 2', createdAt: now, lastModifiedAt: now),
    ];
  } else if (index == 4) {
    costModel = [
      CostModel(name: 'Entertainment Custom 0', cost: 10.0, note: 'Note 1', createdAt: now, lastModifiedAt: now),
      CostModel(name: 'Entertainment Custom 1', cost: 18.0, note: 'Note 2', createdAt: now, lastModifiedAt: now),
    ];
  } else if (index == 5) {
    costModel = [
      CostModel(name: 'Transport Custom 0', cost: 10.0, note: 'Note 1', createdAt: now, lastModifiedAt: now),
      CostModel(name: 'Transport Custom 1', cost: 15.0, note: 'Note 2', createdAt: now, lastModifiedAt: now),
    ];
  } else {
    costModel = [
      CostModel(name: 'Item 0', cost: 10.0, note: 'Note 1', createdAt: now, lastModifiedAt: now),
      CostModel(name: 'Item 1', cost: 20.0, note: 'Note 2', createdAt: now, lastModifiedAt: now),
      CostModel(name: 'Item 2', cost: 10.0, note: 'Note 3', createdAt: now, lastModifiedAt: now),
      CostModel(name: 'Item 3', cost: 5.0, note: 'Note 4', createdAt: now, lastModifiedAt: now),
      CostModel(name: 'Item 4', cost: 13.0, note: 'Note 5', createdAt: now, lastModifiedAt: now),
      CostModel(name: 'Item 5', cost: 10.0, note: 'Note 6', createdAt: now, lastModifiedAt: now),
    ];
  }

  return costModel;
}



List<TypeModel> typeNames = [
  TypeModel(name: 'House', maxAmount: 2000, expenses: _generateExpenses(0)),
  TypeModel(name: 'Clothing', maxAmount: 200, expenses: _generateExpenses(1)),
  TypeModel(name: 'Food', maxAmount: 400, expenses: _generateExpenses(2)),
  TypeModel(name: 'Utilities', maxAmount: 200, expenses: _generateExpenses(3)),
  TypeModel(name: 'Entertainment', maxAmount: 100, expenses: _generateExpenses(4)),
  TypeModel(name: 'Transport', maxAmount: 100, expenses: _generateExpenses(5)),
];

List<UserModel> userRegistrations = [
  UserModel(
    username: 'user1',
    email: 'user1@example.com',
    password: 'password1',
    phone: '1234567890',
  ),
  UserModel(
    username: 'user2',
    email: 'user2@example.com',
    password: 'password2',
    phone: '0987654321',
  ),
  UserModel(
    username: 'user3',
    email: 'user3@example.com',
    password: 'password3',
    phone: '1122334455',
  ),
];

class UserProvider with ChangeNotifier {
  UserModel? _currentUser;

  UserModel? get currentUser => _currentUser;

  void setCurrentUser(UserModel user) {
    _currentUser = user;
    notifyListeners();
  }

  void updateUserField(String field, String newValue) {
    if (_currentUser != null) {
      switch (field) {
        case 'username':
          _currentUser = UserModel(
            username: newValue,
            email: _currentUser!.email,
            password: _currentUser!.password,
            phone: _currentUser!.phone,
          );
          break;
        case 'email':
          _currentUser = UserModel(
            username: _currentUser!.username,
            email: newValue,
            password: _currentUser!.password,
            phone: _currentUser!.phone,
          );
          break;
        case 'phone':
          _currentUser = UserModel(
            username: _currentUser!.username,
            email: _currentUser!.email,
            password: _currentUser!.password,
            phone: newValue,
          );
          break;
      // Tambahkan case lain sesuai kebutuhan
      }
      notifyListeners();
    }
  }
}

import 'package:flutter/material.dart';
import 'package:money_manage/constants.dart';
import 'package:money_manage/NavBarBottom.dart';
import 'package:money_manage/data/data.dart';
import '../home.dart';
import '../models/cost_model.dart';
import '../models/type_model.dart';

import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class AddData extends StatefulWidget {
  const AddData({Key? key}) : super(key: key);

  @override
  _AddDataState createState() => _AddDataState();
}

class _AddDataState extends State<AddData> {
  String? _selectedItem;
  TextEditingController _nameController = TextEditingController();
  TextEditingController _costController = TextEditingController();
  bool _showTextFields = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          // "Add Your Expense",
          AppLocalizations.of(context)!.addyourExpense,
          style: TextStyle(
            color: kTextColor,
          ),
        ),
      ),
      body: Center(
        child: Container(
          width: 300,
          padding: EdgeInsets.all(20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              DropdownButtonFormField<String>(
                value: _selectedItem,
                onChanged: (String? value) {
                  setState(() {
                    _selectedItem = value;
                    _showTextFields = true;
                    // print('Anda memilih: $_selectedItem');
                  });
                },
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: AppLocalizations.of(context)!.choose,
                  labelStyle: TextStyle(
                    color: kPrimaryColor,
                  ),
                ),
                items: _buildDropdownItems(),
              ),
              SizedBox(height: 20),
              Visibility(
                visible: _showTextFields,
                child: Column(
                  children: [
                    TextField(
                      controller: _nameController,
                      decoration: InputDecoration(
                        labelText: AppLocalizations.of(context)!.expenseName,
                        border: OutlineInputBorder(),
                        labelStyle: TextStyle(
                          color: kPrimaryColor,
                        ),
                      ),
                      style: TextStyle(
                        color: kPrimaryColor,
                      ),
                    ),
                    SizedBox(height: 20),
                    TextField(
                      controller: _costController,
                      decoration: InputDecoration(
                        labelText: AppLocalizations.of(context)!.expenseCost,
                        border: OutlineInputBorder(),
                        labelStyle: TextStyle(
                          color: kPrimaryColor,
                        ),
                      ),
                      keyboardType: TextInputType.number,
                      style: TextStyle(
                        color: kPrimaryColor,
                      ),
                    ),
                    SizedBox(height: 20),
                    ElevatedButton(
                      onPressed: () {
                        _saveCostData();
                        Navigator.pushAndRemoveUntil(
                          context,
                          MaterialPageRoute(builder: (context) => HomePage()),
                          (route) => false,
                        );
                      },
                      child: Text(AppLocalizations.of(context)!.save),
                      style: ElevatedButton.styleFrom(
                        foregroundColor: kPrimaryColor,
                        backgroundColor: kTextColor,
                      ),
                    ),
                    SizedBox(height: 20),
                    // Menampilkan sisa saldo
                    _selectedItem != null
                        ? Text(
                            AppLocalizations.of(context)!.remainingbalance('\$${_calculateRemainingBalance()}'),
                            // 'Sisa Saldo: \$${_calculateRemainingBalance()}',
                            style: TextStyle(
                              color: kPrimaryColor,
                              fontWeight: FontWeight.bold,
                            ),
                          )
                        : SizedBox(),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  List<DropdownMenuItem<String>> _buildDropdownItems() {
    List<DropdownMenuItem<String>> items = [];
    for (TypeModel type in typeNames) {
      items.add(
        DropdownMenuItem<String>(
          value: type.name!,
          child: Text(
            type.name!,
            style: TextStyle(
              color:
                  _selectedItem == type.name ? Colors.grey[800] : kPrimaryColor,
            ),
          ),
        ),
      );
    }
    return items;
  }

  void _saveCostData() {
    String name = _nameController.text.trim();
    double cost = double.tryParse(_costController.text.trim()) ?? 0.0;

    if (name.isNotEmpty && cost > 0) {
      TypeModel selectedType =
          typeNames.firstWhere((type) => type.name == _selectedItem);

      double totalExpenses = 0.0;
      selectedType.expenses!.forEach((expense) {
        totalExpenses += expense.cost!;
      });

      double remainingBalance = selectedType.maxAmount! - totalExpenses;

      if (cost <= remainingBalance) {
        selectedType.expenses!.add(CostModel(name: name, cost: cost));

        _nameController.clear();
        _costController.clear();

        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(AppLocalizations.of(context)!.dataSaved),
          ),
        );
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(AppLocalizations.of(context)!.balanceNotEnough),
            backgroundColor: Colors.red,
          ),
        );
      }
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(AppLocalizations.of(context)!.fieldsMustBeFilled2),
          backgroundColor: Colors.red,
        ),
      );
    }
  }

  String _calculateRemainingBalance() {
    if (_selectedItem != null) {
      TypeModel selectedType =
          typeNames.firstWhere((type) => type.name == _selectedItem);

      double totalExpenses = 0.0;
      selectedType.expenses!.forEach((expense) {
        totalExpenses += expense.cost!;
      });

      double remainingBalance = selectedType.maxAmount! - totalExpenses;

      return remainingBalance.toStringAsFixed(2);
    } else {
      return '';
    }
  }
}

void main() {
  runApp(MaterialApp(
    home: AddData(),
  ));
}

import 'package:flutter/material.dart';
import 'package:money_manage/models/cost_model.dart';
import 'package:money_manage/data/data.dart';

import '../NavBarBottom.dart';
import '../home.dart';
import '../models/type_model.dart';

class AddExpenseScreen extends StatefulWidget {
  final String typeName;

  const AddExpenseScreen({Key? key, required this.typeName}) : super(key: key);

  @override
  _AddExpenseScreenState createState() => _AddExpenseScreenState();
}

class _AddExpenseScreenState extends State<AddExpenseScreen> {
  TextEditingController nameController = TextEditingController();
  TextEditingController costController = TextEditingController();
  TextEditingController noteController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    TypeModel selectedType = typeNames.firstWhere((type) => type.name == widget.typeName);

    double totalExpenses = 0.0;
    selectedType.expenses!.forEach((expense) {
      totalExpenses += expense.cost!;
    });

    double remainingBalance = selectedType.maxAmount! - totalExpenses;

    return Scaffold(
      appBar: AppBar(
        title: Text('Add Expense'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              'Type: ${widget.typeName}',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 10),
            Text(
              'Remaining Balance: \$${remainingBalance.toStringAsFixed(2)}',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 20),
            TextField(
              controller: nameController,
              decoration: InputDecoration(
                labelText: 'Expense Name',
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 20),
            TextField(
              controller: costController,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                labelText: 'Expense Cost',
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 20),
            TextField(
              controller: noteController,
              decoration: InputDecoration(
                labelText: 'Expense Note',
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                _saveCostData();
              },
              child: Text('Add Expense'),
            ),
          ],
        ),
      ),
    );
  }

  void _saveCostData() {
    String name = nameController.text.trim();
    double cost = double.tryParse(costController.text.trim()) ?? 0.0;
    String note = noteController.text.trim();

    if (name.isNotEmpty && cost > 0 && note.isNotEmpty) {
      TypeModel selectedType = typeNames.firstWhere((type) => type.name == widget.typeName);

      double totalExpenses = 0.0;
      selectedType.expenses!.forEach((expense) {
        totalExpenses += expense.cost!;
      });
      double remainingBalance = selectedType.maxAmount! - totalExpenses;

      if (cost <= remainingBalance) {
        selectedType.expenses!.add(CostModel(name: name, cost: cost, note: note));

        nameController.clear();
        costController.clear();
        noteController.clear();

        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('Data saved successfully'),
          ),
        );

        Navigator.pushAndRemoveUntil(
          context,
          MaterialPageRoute(builder: (context) => HomePage()),
              (route) => false,
        );
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('Balance is not enough'),
            backgroundColor: Colors.red,
          ),
        );
      }
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Name, Cost Amount, and Note must be filled in and valid'),
          backgroundColor: Colors.red,
        ),
      );
    }
  }
}

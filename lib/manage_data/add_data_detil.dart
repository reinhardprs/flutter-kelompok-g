import 'package:flutter/material.dart';
import 'package:money_manage/constants.dart';
import 'package:money_manage/models/cost_model.dart';
import 'package:money_manage/data/data.dart';

import '../NavBarBottom.dart';
import '../home.dart';
import '../models/type_model.dart';

import 'package:flutter_gen/gen_l10n/app_localizations.dart';

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
  bool isLoading = false;

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
        title: Text(AppLocalizations.of(context)!.addExpense),
        bottom: isLoading
            ? PreferredSize(
                preferredSize: Size.fromHeight(4.0),
                child: LinearProgressIndicator(color: kSecondaryColor),
              )
            : null,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              // 'Type: ${widget.typeName}',
              // AppLocalizations.of(context)!.about,
              AppLocalizations.of(context)!.type('${widget.typeName}'),
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 10),
            Text(
              AppLocalizations.of(context)!.remainingbalance('\$${remainingBalance.toStringAsFixed(2)}'),
              // 'Remaining Balance: \$${remainingBalance.toStringAsFixed(2)}',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 20),
            TextField(
              controller: nameController,
              decoration: InputDecoration(
                labelText: AppLocalizations.of(context)!.expenseName,
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 20),
            TextField(
              controller: costController,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                labelText: AppLocalizations.of(context)!.expenseCost,
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 20),
            TextField(
              controller: noteController,
              decoration: InputDecoration(
                labelText: AppLocalizations.of(context)!.expenseNote,
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                setState(() {
                  isLoading = true;
                });
                _saveCostData();
              },
              child: Text(AppLocalizations.of(context)!.addExpense),
            ),
          ],
        ),
      ),
    );
  }

  void _saveCostData() async {
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

        await Future.delayed(Duration(seconds: 3));

        selectedType.expenses!.add(CostModel(name: name, cost: cost, note: note));

        nameController.clear();
        costController.clear();
        noteController.clear();

        setState(() {
          isLoading = false;
        });

        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(AppLocalizations.of(context)!.dataSaved),
          ),
        );

        Navigator.pushAndRemoveUntil(
          context,
          MaterialPageRoute(builder: (context) => HomePage()),
              (route) => false,
        );
      } else {
        setState(() {
          isLoading = false;
        });

        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(AppLocalizations.of(context)!.balanceNotEnough),
            backgroundColor: Colors.red,
          ),
        );
      }
    } else {
      setState(() {
          isLoading = false;
        });
        
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(AppLocalizations.of(context)!.fieldsMustBeFilled),
          backgroundColor: Colors.red,
        ),
      );
    }
  }
}
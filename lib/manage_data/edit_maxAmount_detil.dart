import 'package:flutter/material.dart';
import 'package:money_manage/models/type_model.dart';

import '../NavBarBottom.dart';
import '../home.dart';

class EditMaxAmountScreen extends StatefulWidget {
  final TypeModel typeModel;

  const EditMaxAmountScreen({Key? key, required this.typeModel}) : super(key: key);

  @override
  _EditMaxAmountScreenState createState() => _EditMaxAmountScreenState();
}

class _EditMaxAmountScreenState extends State<EditMaxAmountScreen> {
  TextEditingController maxAmountController = TextEditingController();

  @override
  void initState() {
    super.initState();
    maxAmountController.text = widget.typeModel.maxAmount.toString();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Edit Max Amount'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              'Type: ${widget.typeModel.name}',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 20),
            TextField(
              controller: maxAmountController,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                labelText: 'Max Amount',
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                _saveMaxAmount();
              },
              child: Text('Save'),
            ),
          ],
        ),
      ),
    );
  }

  void _saveMaxAmount() {
    double newMaxAmount = double.tryParse(maxAmountController.text.trim()) ?? 0.0;

    double totalExpenses = 0.0;
    widget.typeModel.expenses!.forEach((expense) {
      totalExpenses += expense.cost!;
    });

    if (totalExpenses > newMaxAmount) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Max amount cannot be less than total expenses'),
          backgroundColor: Colors.red,
        ),
      );
    } else {
      setState(() {
        widget.typeModel.maxAmount = newMaxAmount;
      });

      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Max amount updated successfully'),
        ),
      );
      Navigator.pushAndRemoveUntil(
        context,
        MaterialPageRoute(builder: (context) => HomePage()),
            (route) => false,
      );
    }
  }
}

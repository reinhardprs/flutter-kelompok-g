import 'package:flutter/material.dart';
import 'package:money_manage/constants.dart';
import 'data/data.dart';
import 'home.dart';
import 'models/type_model.dart';

class AddTypeNames extends StatefulWidget {
  const AddTypeNames({super.key});

  @override
  _AddTypeNamesState createState() => _AddTypeNamesState();
}

class _AddTypeNamesState extends State<AddTypeNames> {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _maxAmountController = TextEditingController();

  void _addTypeName() {
    String name = _nameController.text;
    double? maxAmount = double.tryParse(_maxAmountController.text);

    if (name.isEmpty || maxAmount == null) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Please enter valid name and max amount!'),
        ),
      );
      return;
    }

    bool nameExists = typeNames.any((type) => type.name == name);

    if (!nameExists) {
      setState(() {
        typeNames.add(TypeModel(name: name, maxAmount: maxAmount, expenses: []));
      });
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('$name has been added successfully!'),
        ),
      );
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => HomePage()),
      );
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('$name already exists!'),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Add Expense Category",
          style: TextStyle(color: kTextColor),
        ),
        centerTitle: true,
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextField(
                controller: _nameController,
                decoration: InputDecoration(
                  labelText: 'Category Name',
                  border: OutlineInputBorder(),
                ),
              ),
              SizedBox(height: 20),
              TextField(
                controller: _maxAmountController,
                decoration: InputDecoration(
                  labelText: 'Max Amount',
                  border: OutlineInputBorder(),
                ),
                keyboardType: TextInputType.number,
              ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: _addTypeName,
                child: Text('Add Category'),
              ),
            ],
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    _nameController.dispose();
    _maxAmountController.dispose();
    super.dispose();
  }
}

import 'package:flutter/material.dart';
import 'package:money_manage/constants.dart';
import 'data/data.dart';
import 'home.dart';
import 'models/type_model.dart';

import 'package:flutter_gen/gen_l10n/app_localizations.dart';

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
          content: Text(AppLocalizations.of(context)!.enterValidNameMax),
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
          content: Text(AppLocalizations.of(context)!.msgNameSuccess('$name')),
        ),
      );
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => HomePage()),
      );
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(AppLocalizations.of(context)!.nameAlreadyExists('$name')),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          AppLocalizations.of(context)!.addExpenseCategory,
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
                  labelText: AppLocalizations.of(context)!.categoryName,
                  border: OutlineInputBorder(),
                ),
              ),
              SizedBox(height: 20),
              TextField(
                controller: _maxAmountController,
                decoration: InputDecoration(
                  labelText: AppLocalizations.of(context)!.maxAmount,
                  border: OutlineInputBorder(),
                ),
                keyboardType: TextInputType.number,
              ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: _addTypeName,
                child: Text(AppLocalizations.of(context)!.addCategory),
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

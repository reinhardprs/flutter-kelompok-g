import 'package:flutter/material.dart';
import 'package:money_manage/constants.dart';
import 'package:money_manage/NavBarBottom.dart';
import 'package:money_manage/data/data.dart';

import '../home.dart';
import '../models/type_model.dart';

import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class EditMaxAmount extends StatefulWidget {
  const EditMaxAmount({Key? key}) : super(key: key);

  @override
  _EditMaxAmountState createState() => _EditMaxAmountState();
}

class _EditMaxAmountState extends State<EditMaxAmount> {
  String? _selectedItem;
  double _maxAmount = 0.0;
  bool _showTextFields = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          AppLocalizations.of(context)!.editMaxAmount,
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
                    _showTextFields = true;
                    _selectedItem = value;
                    _maxAmount = typeNames
                        .firstWhere((type) => type.name == _selectedItem)
                        .maxAmount!;
                  });
                },
                decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderSide: BorderSide(color: kPrimaryColor),
                    ),
                    labelText: AppLocalizations.of(context)!.choose,
                    labelStyle: TextStyle(color: kPrimaryColor),
                ),
                items: _buildDropdownItems(),
              ),
              SizedBox(height: 20),
              Text(
                AppLocalizations.of(context)!.maxAmountNow('$_maxAmount'),
                // 'Max Amount Now: $_maxAmount',
                style: TextStyle(fontSize: 16, color: kPrimaryColor),
              ),
              Visibility(
                visible: _showTextFields,
                child: TextField(
                  decoration: InputDecoration(
                    labelText: AppLocalizations.of(context)!.newMaxAmount,
                    border: OutlineInputBorder(),
                    labelStyle: TextStyle(color: kPrimaryColor),
                  ),
                  keyboardType: TextInputType.number,
                  onChanged: (value) {
                    setState(() {
                      _maxAmount = double.tryParse(value) ?? 0.0;
                    }
                    );
                  },
                  // style: TextStyle(
                  //   color: kTextColor
                  // ),
                ),
              ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  _changeMaxAmount();
                  Navigator.pushAndRemoveUntil(
                    context,
                    MaterialPageRoute(builder: (context) => HomePage()),
                    (route) => false,
                  );
                },
                child: Text(AppLocalizations.of(context)!.change),
              ),
              SizedBox(height: 20),

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
          child: Text(type.name!,
            style: TextStyle(
              color: _selectedItem == type.name ? Colors.grey[800] : kPrimaryColor,
            ),),

        ),
      );
    }
    return items;
  }

  void _changeMaxAmount() {
    if (_selectedItem != null) {
      TypeModel selectedType =
          typeNames.firstWhere((type) => type.name == _selectedItem);
      selectedType.maxAmount = _maxAmount;
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(AppLocalizations.of(context)!.maxAmounSuccess),
        ),
      );
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(AppLocalizations.of(context)!.selectItem),
          backgroundColor: Colors.red,
        ),
      );
    }
  }
}

void main() {
  runApp(MaterialApp(
    home: EditMaxAmount(),
  ));
}

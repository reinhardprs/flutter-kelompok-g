import 'package:flutter/material.dart';
import 'package:money_manage/models/type_model.dart';
import '../NavBarBottom.dart';
import '../home.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class EditMaxAmountScreen extends StatefulWidget {
  final TypeModel typeModel;

  const EditMaxAmountScreen({Key? key, required this.typeModel}) : super(key: key);

  @override
  _EditMaxAmountScreenState createState() => _EditMaxAmountScreenState();
}

class _EditMaxAmountScreenState extends State<EditMaxAmountScreen> {
  TextEditingController maxAmountController = TextEditingController();
  bool _isEditing = false;

  @override
  void initState() {
    super.initState();
    maxAmountController.text = widget.typeModel.maxAmount.toString();
    maxAmountController.addListener(() {
      setState(() {
        _isEditing = maxAmountController.text != widget.typeModel.maxAmount.toString();
      });
    });
  }

  Future<bool> _onWillPop() async {
    if (_isEditing) {
      return (await showDialog(
            context: context,
            builder: (context) => AlertDialog(
              title: Text(AppLocalizations.of(context)!.discardChange),
              content: Text(AppLocalizations.of(context)!.msgdiscardChange),
              actions: <Widget>[
                TextButton(
                  onPressed: () => Navigator.of(context).pop(false),
                  child: Text(AppLocalizations.of(context)!.no),
                ),
                TextButton(
                  onPressed: () => Navigator.of(context).pop(true),
                  child: Text(AppLocalizations.of(context)!.yes),
                ),
              ],
            ),
          )) ??
          false;
    }
    return true;
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: _onWillPop,
      child: Scaffold(
        appBar: AppBar(
          title: Text(AppLocalizations.of(context)!.editMaxAmount),
        ),
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Text(
                AppLocalizations.of(context)!.type('${widget.typeModel.name}'),
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
                  labelText: AppLocalizations.of(context)!.maxAmount,
                  border: OutlineInputBorder(),
                ),
              ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  _saveMaxAmount();
                },
                child: Text(AppLocalizations.of(context)!.save),
              ),
            ],
          ),
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
          content: Text(AppLocalizations.of(context)!.msgmaxAmount),
          backgroundColor: Colors.red,
        ),
      );
    } else {
      setState(() {
        widget.typeModel.maxAmount = newMaxAmount;
        _isEditing = false;
      });

      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(AppLocalizations.of(context)!.maxAmounSuccess),
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

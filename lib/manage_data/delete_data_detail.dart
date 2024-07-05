import 'package:flutter/material.dart';
import 'package:money_manage/models/cost_model.dart';
import 'package:money_manage/models/type_model.dart';

import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class RemoveExpenseScreen extends StatefulWidget {
  final TypeModel typeModel;

  const RemoveExpenseScreen({Key? key, required this.typeModel}) : super(key: key);

  @override
  _RemoveExpenseScreenState createState() => _RemoveExpenseScreenState();
}

class _RemoveExpenseScreenState extends State<RemoveExpenseScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(AppLocalizations.of(context)!.removeExpense),
      ),
      body: ListView.builder(
        itemCount: widget.typeModel.expenses!.length,
        itemBuilder: (context, index) {
          CostModel expense = widget.typeModel.expenses![index];
          return ListTile(
            title: Text(expense.name ?? ''),
            subtitle: Text('\$${expense.cost.toString()}'),
            trailing: IconButton(
              icon: Icon(Icons.delete),
              onPressed: () {
                _removeExpense(index);
              },
            ),
          );
        },
      ),
    );
  }

  void _removeExpense(int index) {
    setState(() {
      widget.typeModel.expenses!.removeAt(index);
    });
  }
}

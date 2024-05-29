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

  @override
  Widget build(BuildContext context) {
    // Menemukan objek TypeModel berdasarkan nama yang dipilih
    TypeModel selectedType = typeNames.firstWhere((type) => type.name == widget.typeName);

    // Menghitung total pengeluaran dari TypeModel yang dipilih
    double totalExpenses = 0.0;
    selectedType.expenses!.forEach((expense) {
      totalExpenses += expense.cost!;
    });

    // Menghitung sisa saldo
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

    if (name.isNotEmpty && cost > 0) {
      // Menemukan objek TypeModel berdasarkan nama yang dipilih
      TypeModel selectedType = typeNames.firstWhere((type) => type.name == widget.typeName);

      // Menghitung total pengeluaran dari TypeModel yang dipilih
      double totalExpenses = 0.0;
      selectedType.expenses!.forEach((expense) {
        totalExpenses += expense.cost!;
      });

      // Menghitung sisa saldo
      double remainingBalance = selectedType.maxAmount! - totalExpenses;

      // Memeriksa apakah saldo mencukupi
      if (cost <= remainingBalance) {
        // Menambahkan CostModel baru ke dalam expenses dari TypeModel yang dipilih
        selectedType.expenses!.add(CostModel(name: name, cost: cost));

        // Membersihkan field input setelah data disimpan
        nameController.clear();
        costController.clear();

        // Memberitahu pengguna bahwa data telah disimpan
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('Data saved successfully'),
          ),
        );

        // Navigasi ke layar NavbarFinal setelah data disimpan
        Navigator.pushAndRemoveUntil(
          context,
          MaterialPageRoute(builder: (context) => HomePage()),
              (route) => false,
        );
      } else {
        // Menampilkan pesan kesalahan jika saldo tidak mencukupi
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('Balance is not enough'),
            backgroundColor: Colors.red,
          ),
        );
      }
    } else {
      // Menampilkan pesan kesalahan jika input tidak valid
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Name and Cost Amount must be filled in and valid'),
          backgroundColor: Colors.red,
        ),
      );
    }
  }

}

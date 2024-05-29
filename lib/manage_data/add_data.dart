import 'package:flutter/material.dart';
import 'package:money_manage/constants.dart';
import 'package:money_manage/NavBarBottom.dart';
import 'package:money_manage/data/data.dart';
import '../home.dart';
import '../models/cost_model.dart';
import '../models/type_model.dart';

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
          "Add Your Expense",
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
                  labelText: 'Choose',
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
                        labelText: 'Nama Cost',
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
                        labelText: 'Jumlah Cost',
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
                      child: Text('Save'),
                      style: ElevatedButton.styleFrom(
                        foregroundColor: kPrimaryColor,
                        backgroundColor: kTextColor,
                      ),
                    ),
                    SizedBox(height: 20),
                    // Menampilkan sisa saldo
                    _selectedItem != null
                        ? Text(
                      'Sisa Saldo: \$${_calculateRemainingBalance()}',
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
              color: _selectedItem == type.name ? Colors.grey[800] : kPrimaryColor,
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
      // Menemukan objek TypeModel berdasarkan nama yang dipilih
      TypeModel selectedType = typeNames.firstWhere((type) => type.name == _selectedItem);

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
        _nameController.clear();
        _costController.clear();

        // Memberitahu pengguna bahwa data telah disimpan
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('Data saved successfully'),
          ),
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

  String _calculateRemainingBalance() {
    if (_selectedItem != null) {
      // Temukan objek TypeModel yang dipilih
      TypeModel selectedType = typeNames.firstWhere((type) => type.name == _selectedItem);

      // Hitung total pengeluaran dari TypeModel yang dipilih
      double totalExpenses = 0.0;
      selectedType.expenses!.forEach((expense) {
        totalExpenses += expense.cost!;
      });

      // Hitung sisa saldo
      double remainingBalance = selectedType.maxAmount! - totalExpenses;

      // Kembalikan sisa saldo dalam bentuk string
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

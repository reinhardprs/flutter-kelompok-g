import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:money_manage/constants.dart';
import 'package:money_manage/models/cost_model.dart';
import 'package:intl/intl.dart';

class TransactionDetailScreen extends StatefulWidget {
  final CostModel transaction;

  const TransactionDetailScreen({Key? key, required this.transaction}) : super(key: key);

  @override
  _TransactionDetailScreenState createState() => _TransactionDetailScreenState();
}

class _TransactionDetailScreenState extends State<TransactionDetailScreen> {
  late TextEditingController _nameController;
  late TextEditingController _noteController;
  DateTime? _createdAt;
  DateTime? _lastModifiedAt;

  @override
  void initState() {
    super.initState();
    _nameController = TextEditingController(text: widget.transaction.name);
    _noteController = TextEditingController(text: widget.transaction.note);
    _createdAt = widget.transaction.createdAt ?? DateTime.now();
    _lastModifiedAt = widget.transaction.lastModifiedAt ?? DateTime.now();
  }

  @override
  void dispose() {
    _nameController.dispose();
    _noteController.dispose();
    super.dispose();
  }

  void _saveChanges() {
    setState(() {
      widget.transaction.name = _nameController.text;
      widget.transaction.note = _noteController.text;
      widget.transaction.lastModifiedAt = _lastModifiedAt;
    });
    Navigator.pop(context);
  }

  Future<void> _pickDateTime(BuildContext context, DateTime initialDate, Function(DateTime) onPicked) async {
    final DateTime? pickedDate = await showDatePicker(
      context: context,
      initialDate: initialDate,
      firstDate: DateTime(2000),
      lastDate: DateTime(2101),
    );

    if (pickedDate != null) {
      final TimeOfDay? pickedTime = await showTimePicker(
        context: context,
        initialTime: TimeOfDay.fromDateTime(initialDate),
      );

      if (pickedTime != null) {
        final pickedDateTime = DateTime(
          pickedDate.year,
          pickedDate.month,
          pickedDate.day,
          pickedTime.hour,
          pickedTime.minute,
        );
        onPicked(pickedDateTime);
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    final dateFormat = DateFormat('EEE, MMM d, yyyy');
    final timeFormat = DateFormat('h:mm a');

    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Transaction Detail',
          style: GoogleFonts.aBeeZee(fontSize: 25, fontWeight: FontWeight.w500, color: kTextColor),
        ),
        actions: [
          IconButton(
            onPressed: _saveChanges,
            icon: Icon(Icons.save),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            TextField(
              controller: _nameController,
              decoration: InputDecoration(
                labelText: 'Transaction Name',
                suffixIcon: Icon(Icons.edit),
              ),
            ),
            SizedBox(height: 20),
            TextField(
              controller: _noteController,
              decoration: InputDecoration(
                labelText: 'Note',
                suffixIcon: Icon(Icons.edit),
              ),
              maxLines: 3,
            ),
            SizedBox(height: 20),
            GestureDetector(
              onTap: () => _pickDateTime(context, _createdAt!, (dateTime) {
                setState(() {
                  _createdAt = dateTime;
                });
              }),
              child: AbsorbPointer(
                child: TextFormField(
                  decoration: InputDecoration(
                    labelText: 'Created At',
                    suffixIcon: Icon(Icons.calendar_today),
                  ),
                  controller: TextEditingController(
                    text: '${dateFormat.format(_createdAt!)} at ${timeFormat.format(_createdAt!)}',
                  ),
                ),
              ),
            ),
            SizedBox(height: 20),
            GestureDetector(
              onTap: () => _pickDateTime(context, _lastModifiedAt!, (dateTime) {
                setState(() {
                  _lastModifiedAt = dateTime;
                });
              }),
              child: AbsorbPointer(
                child: TextFormField(
                  decoration: InputDecoration(
                    labelText: 'Last Modified At',
                    suffixIcon: Icon(Icons.calendar_today),
                  ),
                  controller: TextEditingController(
                    text: '${dateFormat.format(_lastModifiedAt!)} at ${timeFormat.format(_lastModifiedAt!)}',
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

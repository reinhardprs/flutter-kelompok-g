import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:money_manage/constants.dart';
import 'package:money_manage/data/data.dart';

import '../models/type_model.dart';

class CustomChart extends StatefulWidget {
  const CustomChart({Key? key, required this.typeNames}) : super(key: key);
  final List<TypeModel> typeNames;

  @override
  _CustomChartState createState() => _CustomChartState();
}

class _CustomChartState extends State<CustomChart> {
  late DateTime _startDate;
  late DateTime _endDate;
  late List<double> _weeklyExpenses;

  @override
  void initState() {
    super.initState();
    _initializeDates();
    _updateExpenses();
  }

  void _initializeDates() {
    DateTime now = DateTime.now();
    _startDate = now.subtract(Duration(days: now.weekday));
    _endDate = _startDate.add(Duration(days: 6));
  }

  void _updateDates(int days) {
    setState(() {
      _startDate = _startDate.add(Duration(days: days));
      _endDate = _endDate.add(Duration(days: days));
      _updateExpenses();
    });
  }

  void _updateExpenses() {
    setState(() {
      _weeklyExpenses = calculateWeeklySpending(widget.typeNames, _startDate, _endDate);
    });
  }

  @override
  Widget build(BuildContext context) {
    double mostExpensive = _weeklyExpenses.reduce((curr, next) => curr > next ? curr : next);

    String formattedStartDate = DateFormat('MMM dd, yyyy').format(_startDate);
    String formattedEndDate = DateFormat('MMM dd, yyyy').format(_endDate);

    List<String> weekDays = ['Su', 'Mo', 'Tu', 'We', 'Th', 'Fr', 'Sa'];

    return Padding(
      padding: EdgeInsets.all(8),
      child: Column(
        children: [
          Text(
            'Weekly Spending',
            style: GoogleFonts.abel(
              fontSize: 30,
              fontWeight: FontWeight.w600,
              color: kTextColor,
              letterSpacing: 1.0,
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              IconButton(
                onPressed: () {
                  _updateDates(-7);
                },
                icon: Icon(Icons.arrow_back_outlined),
              ),
              Text(
                '$formattedStartDate - $formattedEndDate',
                style: GoogleFonts.abel(
                  fontSize: 20,
                  fontWeight: FontWeight.w500,
                  color: kTextColor,
                ),
              ),
              IconButton(
                onPressed: () {
                  _updateDates(7);
                },
                icon: Icon(Icons.arrow_forward_outlined),
              ),
            ],
          ),
          SizedBox(
            height: 10,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: List.generate(7, (index) {
              return CustomBar(
                day: weekDays[index],
                amountSpent: _weeklyExpenses[index],
                expensive: mostExpensive,
              );
            }),
          ),
          SizedBox(
            height: 15,
          ),
        ],
      ),
    );
  }
}

class CustomBar extends StatelessWidget {
  CustomBar({Key? key, required this.day, required this.amountSpent, required this.expensive}) : super(key: key);
  final String day;
  final double amountSpent;
  final double expensive;
  final double _maxBarHeight = 200;

  @override
  Widget build(BuildContext context) {
    final barHeight = expensive > 0 ? (amountSpent / expensive * _maxBarHeight) : 0;
    return Column(
      children: [
        Text(
          '\$${amountSpent.toStringAsFixed(2)}',
          style: GoogleFonts.abel(
            fontSize: 17,
            fontWeight: FontWeight.w500,
            color: kTextColor,
          ),
        ),
        SizedBox(
          height: 10,
        ),
        Container(
          height: barHeight.toDouble(),
          width: 15,
          decoration: BoxDecoration(
            color: kSecondaryColor,
            borderRadius: BorderRadius.circular(10),
          ),
        ),
        SizedBox(
          height: 10,
        ),
        Text(
          day,
          style: GoogleFonts.abel(
            fontSize: 15,
            fontWeight: FontWeight.w600,
            color: kTextColor,
          ),
        ),
      ],
    );
  }
}

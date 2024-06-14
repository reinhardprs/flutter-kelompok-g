import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:money_manage/constants.dart';

class CustomChart extends StatelessWidget {
  const CustomChart({Key? key, required this.expenses}) : super(key: key);
  final List<double> expenses;

  @override
  Widget build(BuildContext context) {
    double mostExpensive = 0;
    expenses.forEach((double price) {
      if (price > mostExpensive) {
        mostExpensive = price;
      }
    });

    DateTime now = DateTime.now();
    DateTime startDate = now.subtract(Duration(days: now.weekday));
    DateTime endDate = startDate.add(Duration(days: 6));
    String formattedStartDate = DateFormat('MMM dd, yyyy').format(startDate);
    String formattedEndDate = DateFormat('MMM dd, yyyy').format(endDate);

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
                onPressed: () {},
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
                onPressed: () {},
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
                amountSpent: expenses[index],
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
    final barHeight = amountSpent / expensive * _maxBarHeight;
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
          height: barHeight,
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

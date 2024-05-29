import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
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
                'Nov 10, 2020 - Nov 18, 2021',
                style: GoogleFonts.abel(
                    fontSize: 20,
                    fontWeight: FontWeight.w500,
                    color: kTextColor),
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
            children: [
              CustomBar(
                  day: 'Su',
                  amountSpent: expenses[0],
                  expensive: mostExpensive),
              CustomBar(
                  day: 'Mo',
                  amountSpent: expenses[1],
                  expensive: mostExpensive),
              CustomBar(
                  day: 'Tu',
                  amountSpent: expenses[2],
                  expensive: mostExpensive),
              CustomBar(
                  day: 'We',
                  amountSpent: expenses[3],
                  expensive: mostExpensive),
              CustomBar(
                  day: 'Th',
                  amountSpent: expenses[4],
                  expensive: mostExpensive),
              CustomBar(
                  day: 'Fr',
                  amountSpent: expenses[5],
                  expensive: mostExpensive),
              CustomBar(
                  day: 'Sa',
                  amountSpent: expenses[6],
                  expensive: mostExpensive),

            ],
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
  CustomBar(
      {Key? key,
      required this.day,
      required this.amountSpent,
      required this.expensive})
      : super(key: key);
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
              fontSize: 17, fontWeight: FontWeight.w500, color: kTextColor),
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
              fontSize: 15, fontWeight: FontWeight.w600, color: kTextColor),
        ),
      ],
    );
  }
}

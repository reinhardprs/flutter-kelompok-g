import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:money_manage/constants.dart';
import 'package:money_manage/models/cost_model.dart';
import 'package:money_manage/models/type_model.dart';
import 'package:money_manage/widgets/circle_painter.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
// import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'NavBarBottom.dart';
import 'home.dart';
import 'manage_data/add_data_detil.dart';
import 'manage_data/edit_maxAmount_detil.dart';
// import 'manage_data/edit_max_amount.dart';

class DetailScreen extends StatefulWidget {
  final TypeModel? typeModel;
  const DetailScreen({Key? key, this.typeModel}) : super(key: key);

  @override
  State<DetailScreen> createState() => _DetailScreenState();
}

class _DetailScreenState extends State<DetailScreen> {
  @override
  Widget build(BuildContext context) {
    double tAmountSpent = 0;
    widget.typeModel!.expenses!.forEach((CostModel expenses) {
      tAmountSpent += expenses.cost!;
    });
    final double amountLeft = widget.typeModel!.maxAmount! - tAmountSpent;
    final double percentage = amountLeft / widget.typeModel!.maxAmount!;
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Navigator.pushAndRemoveUntil(
              context,
              MaterialPageRoute(builder: (context) => HomePage()),
                  (route) => false,
            );
          },
          icon: Icon(Icons.arrow_back_outlined),
        ),
        title: Text(
          widget.typeModel!.name!,
          style: GoogleFonts.aBeeZee(
            fontSize: 25,
            letterSpacing: 1.0,
            fontWeight: FontWeight.w500,
            color: kTextColor,
          ),
        ),
        actions: [
          IconButton(
            onPressed: () {
              _navigateToAddExpense(context);
            },
            icon: Icon(Icons.add_outlined),
          ),
          IconButton(
            onPressed: () {
              _navigateToEditMaxAmount(context);
            },
            icon: Icon(Icons.edit), // Tambahkan IconButton untuk tombol edit
          ),
          IconButton(
            onPressed: () {
              _showBottomSheet(context);
            },
            icon: Icon(Icons.share),
          )
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              margin: kMargin,
              padding: kPadding,
              height: 340,
              width: 1000,
              decoration: BoxDecoration(
                color: kPrimaryColor,
                borderRadius: kRadius,
              ),
              child: CustomPaint(
                foregroundPainter: CirclePainter(
                  bgColor: Colors.white,
                  lineColor: setupColor(percentage),
                  percentage: percentage,
                  width: 25,
                ),
                child: Center(
                  child: Text(
                    '\$${amountLeft.toStringAsFixed(2)} / \$${widget.typeModel!.maxAmount}',
                    style: GoogleFonts.aubrey(
                      fontWeight: FontWeight.w500,
                      color: kSecondaryColor,
                      fontSize: 30,
                      letterSpacing: 2.0,
                    ),
                  ),
                ),
              ),
            ),
            _buildExpenseList(),
          ],
        ),
      ),
    );
  }

  void _navigateToAddExpense(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => AddExpenseScreen(typeName: widget.typeModel!.name!),
      ),
    ).then((_) {
      // Refresh UI after adding expense
      setState(() {});
    });
  }

  void _navigateToEditMaxAmount(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => EditMaxAmountScreen(typeModel: widget.typeModel!),
      ),
    ).then((_) {
      // Refresh UI after editing max amount
      setState(() {});
    });
  }

  Widget _buildExpenseList() {
    List<Widget> expenseList = [];
    widget.typeModel!.expenses!.forEach((CostModel expense) {
      expenseList.add(
        Dismissible(
          key: UniqueKey(),
          onDismissed: (direction) {
            _removeExpense(expense); // Panggil fungsi untuk menghapus expense
          },
          child: Container(
            width: 1000,
            height: 100,
            margin: kMargin,
            alignment: Alignment.center,
            decoration: BoxDecoration(
              color: kPrimaryColor,
              borderRadius: kRadius,
            ),
            child: Padding(
              padding: kPadding,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    expense.name!.length > 22 ? '${expense.name!.substring(0, 22)}...' : expense.name!,
                    style: GoogleFonts.atma(
                      fontSize: 20,
                      fontWeight: FontWeight.w600,
                      color: kTextColor,
                      letterSpacing: 1.0,
                    ),
                    overflow: TextOverflow.ellipsis,
                  ),
                  Text(
                    '-\$${expense.cost!.toStringAsFixed(2)}',
                    style: GoogleFonts.atma(
                      fontSize: 20,
                      fontWeight: FontWeight.w600,
                      color: kSecondaryColor,
                      letterSpacing: 2.0,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      );
    });
    return Column(
      children: expenseList,
    );
  }

  void _removeExpense(CostModel expense) {
    setState(() {
      widget.typeModel!.expenses!.remove(expense);
    });
  }

void _showBottomSheet(BuildContext context) {
  showModalBottomSheet(
    context: context,
    backgroundColor: kPrimaryColor,
    builder: (context) {
      return Container(
        height: 300,
        child: GridView.builder(
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 3,
            mainAxisSpacing: 10,
            crossAxisSpacing: 10,
          ),
          itemCount: 5,
          itemBuilder: (BuildContext context, int index) {
            List<Map<String, dynamic>> actions = [
              {"icon": FontAwesomeIcons.whatsapp, "label": "WhatsApp"},
              {"icon": FontAwesomeIcons.instagram, "label": "Instagram"},
              {"icon": Icons.facebook, "label": "Facebook"},
              {"icon": Icons.telegram, "label": "Telegram"},
              {"icon": Icons.snapchat, "label": "Snapchat"},
            ];

            return GestureDetector(
              // onTap: () {
              //   switch (index) {
              //     case 0:
              //       // Handle edit action
              //       break;
              //     case 1:
              //       // Handle delete action
              //       break;
              //     case 2:
              //       // Handle share action
              //       break;
              //   }
              // },
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    padding: const EdgeInsets.all(8.0),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      shape: BoxShape.circle,
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.2),
                          spreadRadius: 1,
                          blurRadius: 3,
                          offset: Offset(0, 2),
                        ),
                      ],
                    ),
                    child: Icon(actions[index]["icon"], size: 30, color: kPrimaryColor),
                  ),
                  SizedBox(height: 8),
                  Text(
                    actions[index]["label"],
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                      color: kTextColor,
                    ),
                  ),
                ],
              ),
            );
          },
        ),
      );
    },
  );
}

}

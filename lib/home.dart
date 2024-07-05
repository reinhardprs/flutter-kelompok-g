import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:money_manage/add%20typeNames.dart';
import 'package:money_manage/constants.dart';
import 'package:money_manage/data/data.dart';
import 'package:money_manage/detail_screen.dart';
import 'package:money_manage/models/cost_model.dart';
import 'package:money_manage/models/type_model.dart';
import 'package:money_manage/settings/chat.dart';
import 'package:money_manage/settings/myaccount.dart';
import 'package:money_manage/widgets/chart.dart';
import 'package:provider/provider.dart';
import 'drawer.dart';

import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class HomePage extends StatefulWidget {
  final bool showPhoneNotSetDialog;

  const HomePage({Key? key, this.showPhoneNotSetDialog = false}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  Offset _tapPosition = Offset.zero;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance?.addPostFrameCallback((_) {
      if (widget.showPhoneNotSetDialog) {
        _showPhoneNotSetDialog();
      }
    });
  }

  void _showPhoneNotSetDialog() {
    final userProvider = Provider.of<UserProvider>(context, listen: false);
    final user = userProvider.currentUser;

    if (user != null && user.phone.isEmpty) {
      showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: Text(AppLocalizations.of(context)!.phoneNumberNotSet, style: TextStyle(color: kTextColor)),
            content: Text(AppLocalizations.of(context)!.phoneNumberDialog, style: TextStyle(color: kTextColor)),
            backgroundColor: kPrimaryColor,
            actions: [
              TextButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                child: Text(AppLocalizations.of(context)!.later, style: TextStyle(color: kTextColor)),
              ),
              TextButton(
                onPressed: () {
                  Navigator.of(context).pop();
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => MyAccount()),
                  );
                },
                child: Text(AppLocalizations.of(context)!.setPhoneNumbernow, style: TextStyle(color: kTextColor)),
              ),
            ],
          );
        },
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    final userProvider = Provider.of<UserProvider>(context);
    final username = userProvider.currentUser?.username ?? 'Guest';

    return Scaffold(
      drawer: NavDrawer(),
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            forceElevated: true,
            floating: true,
            expandedHeight: 90,
            flexibleSpace: FlexibleSpaceBar(
              centerTitle: true,
              title: Padding(
                padding: EdgeInsets.only(right: 45),
                child: Text(
                  username,
                  style: GoogleFonts.abel(
                    fontSize: 23,
                    letterSpacing: 1.0,
                    fontWeight: FontWeight.w500,
                    color: kTextColor,
                  ),
                ),
              ),
            ),
            actions: [
              IconButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => ChatPage(chatKey: 'abc123'),
                    ),
                  );
                },
                icon: Padding(
                  padding: EdgeInsets.only(top: 14.0),
                  child: Icon(
                    Icons.support_agent_outlined,
                    size: 40.0,
                    color: kTextColor,
                  ),
                ),
              ),
            ],
          ),
          SliverList(
            delegate: SliverChildBuilderDelegate((context, int index) {
              if (index == 0) {
                return Column(
                  children: [
                    Container(
                      margin: EdgeInsets.all(2),
                      decoration: BoxDecoration(
                        color: kPrimaryColor,
                        borderRadius: BorderRadius.circular(3),
                      ),
                      child: CustomChart(
                        typeNames: typeNames,
                      ),
                    ),
                    SizedBox(height: 7,),
                    Center(
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(8.0),
                        child: Container(
                          color: kPrimaryColor,
                          width: 430,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              IconButton(
                                icon: Icon(Icons.add, color: kTextColor, size: 35),
                                onPressed: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(builder: (context) => AddTypeNames()),
                                  );
                                },
                              ),
                              Text(
                                AppLocalizations.of(context)!.addOtherExpenseCategory,
                                style: TextStyle(color: kTextColor, fontSize: 15),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                );
              } else {
                final TypeModel typeModel = typeNames[index - 1];
                double tAmountSpent = 0;
                typeModel.expenses!.forEach((CostModel expense) {
                  tAmountSpent += expense.cost!;
                });
                return _buildCategories(typeModel, tAmountSpent, index - 1);
              }
            }, childCount: 1 + typeNames.length),
          ),
        ],
      ),
    );
  }

  _buildCategories(TypeModel category, double tAmountSpent, int index) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => DetailScreen(
                      typeModel: category,
                    )));
      },
      onLongPressStart: (details) {
        _tapPosition = details.globalPosition;
      },
      onLongPress: () {
        showMenu(
          context: context,
          position: RelativeRect.fromLTRB(
            _tapPosition.dx,
            _tapPosition.dy,
            MediaQuery.of(context).size.width - _tapPosition.dx,
            MediaQuery.of(context).size.height - _tapPosition.dy,
          ),
          color: kPrimaryColor,
          items: [
            PopupMenuItem(
              value: 'view',
              child: Text(AppLocalizations.of(context)!.view, style: TextStyle(color: kTextColor)),
            ),
            PopupMenuItem(
              value: 'delete',
              child: Text(AppLocalizations.of(context)!.delete, style: TextStyle(color: kTextColor),),
            ),
          ],
        ).then((value) {
          if (value == 'view') {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => DetailScreen(typeModel: category),
              ),
            );
          } else if (value == 'delete') {
            setState(() {
              typeNames.removeAt(index);
            });
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text(AppLocalizations.of(context)!.msgDeleteCategori('${category.name}')),
              ),
            );
          }
        });
      },
      child: AnimatedContainer(
        duration: Duration(milliseconds: 300),
        width: 100,
        height: 130,
        margin: kMargin,
        padding: kPadding,
        decoration: BoxDecoration(
          color: kPrimaryColor,
          borderRadius: kRadius,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  category.name!,
                  style: GoogleFonts.abel(
                    fontSize: 23,
                    color: kTextColor,
                    fontWeight: FontWeight.w600,
                    letterSpacing: 1.0,
                  ),
                ),
                Text(
                  '\$${(category.maxAmount! - tAmountSpent).toStringAsFixed(2)} / \$${category.maxAmount!.toStringAsFixed(2)}',
                  style: GoogleFonts.abel(
                    fontSize: 20,
                    color: kTextColor,
                    fontWeight: FontWeight.w500,
                    letterSpacing: 1.0,
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 18,
            ),
            LayoutBuilder(builder: (context, constraints) {
              final double maxBarWidth = constraints.maxWidth;
              final double percentage =
                  (category.maxAmount! - tAmountSpent) / category.maxAmount!;
              double width = percentage * maxBarWidth;
              if (width < 0) {
                width = 0;
              }
              return Stack(
                children: [
                  Container(
                    height: 28,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(20),
                        bottomRight: Radius.circular(20),
                      ),
                    ),
                  ),
                  Container(
                    height: 29,
                    width: width,
                    decoration: BoxDecoration(
                      color: setupColor(percentage),
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(20),
                        bottomRight: Radius.circular(20),
                      ),
                    ),
                  ),
                ],
              );
            })
          ],
        ),
      ),
    );
  }
}

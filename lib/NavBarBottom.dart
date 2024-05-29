import 'package:flutter/material.dart';
import 'package:flutter_speed_dial/flutter_speed_dial.dart';
import 'package:money_manage/constants.dart';
import 'package:money_manage/settings/setting.dart';
import 'home.dart';
import 'manage_data/add_data.dart';
import 'manage_data/edit_maxAmount.dart';
import 'package:rive/rive.dart';

class NavbarFinal extends StatefulWidget {
  const NavbarFinal({Key? key}) : super(key: key);

  @override
  State<NavbarFinal> createState() => _NavbarFinalState();
}

class _NavbarFinalState extends State<NavbarFinal> with TickerProviderStateMixin {
  int _selectedIndex = 0;
  late AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 170),
      reverseDuration: Duration(milliseconds: 100),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void _onItemTapped(int index) {
    if (_selectedIndex != index) {
      _controller.reset();
      _controller.forward();
      setState(() {
        _selectedIndex = index;
      });
    }
  }

  final List<Widget> _pages = [
    HomePage(),
    AddData(),
    EditMaxAmount(),
    SettingApp(), // Uncomment and create a Settings widget when ready
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          _selectedIndex == 0 ? HomePage() : (_selectedIndex == 1 ? AddData() : (_selectedIndex == 2 ? EditMaxAmount() : SettingApp())),
          Positioned(
            bottom: 15,
            left: 20,
            right: 20,
            child: SafeArea(
              child: ClipRRect(
                borderRadius: BorderRadius.all(Radius.circular(35)),
                child: Container(
                  height: 65,
                  decoration: BoxDecoration(
                    color: kTextColor.withOpacity(0.8),
                    borderRadius: BorderRadius.circular(35),
                    boxShadow: [
                      BoxShadow(
                        color: kPrimaryColor,
                        blurRadius: 4,
                        offset: Offset(4, 8),
                      ),
                    ],
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      AnimatedBuilder(
                        animation: _controller,
                        builder: (context, child) {
                          final scaleValue = _controller.status == AnimationStatus.forward && _selectedIndex == 0
                              ? Tween<double>(begin: 1.0, end: 1.15).animate(
                            CurvedAnimation(
                              parent: _controller,
                              curve: Curves.bounceInOut,
                            ),
                          ).value
                              : 1.0;
                          return Transform.scale(
                            scale: scaleValue,
                            child: IconButton(
                              icon: Icon(Icons.home),
                              color: _selectedIndex == 0 ? kPrimaryColor : kSecondaryColor,
                              onPressed: () => _onItemTapped(0),
                            ),
                          );
                        },
                      ),
                      Stack(
                        children: [
                          AnimatedBuilder(
                            animation: _controller,
                            builder: (context, child) {
                              final scaleValue = _controller.status == AnimationStatus.forward && _selectedIndex == 1
                                  ? Tween<double>(begin: 1.0, end: 1.15).animate(
                                CurvedAnimation(
                                  parent: _controller,
                                  curve: Curves.bounceInOut,
                                ),
                              ).value
                                  : 1.0;
                              return Transform.scale(
                                scale: scaleValue,
                                child: IconButton(
                                  icon: Icon(Icons.add),
                                  color: _selectedIndex == 1 ? kPrimaryColor : kSecondaryColor,
                                  onPressed: () => _onItemTapped(1),
                                ),
                              );
                            },
                          ),
                          Positioned(
                            bottom: 0,
                            left: 0,
                            right: 0,
                            child: SpeedDial(
                              foregroundColor: Colors.white,
                              backgroundColor: kSecondaryColor,
                              child: Icon(Icons.add),
                              childMargin: EdgeInsets.symmetric(vertical: 20, horizontal: 10),
                              children: [
                                SpeedDialChild(
                                  label: "Edit Max Amount",
                                  child: Icon(Icons.edit),
                                  shape: CircleBorder(),
                                  onTap: () {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(builder: (context) => EditMaxAmount()),
                                    );
                                  },
                                ),
                                SpeedDialChild(
                                  label: "Add Expense",
                                  child: Icon(Icons.add),
                                  shape: CircleBorder(),
                                  onTap: () {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(builder: (context) => AddData()),
                                    );
                                  },
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                      AnimatedBuilder(
                        animation: _controller,
                        builder: (context, child) {
                          final scaleValue = _controller.status == AnimationStatus.forward && _selectedIndex == 3
                              ? Tween<double>(begin: 1.0, end: 1.15).animate(
                            CurvedAnimation(
                              parent: _controller,
                              curve: Curves.bounceInOut,
                            ),
                          ).value
                              : 1.0;
                          return Transform.scale(
                            scale: scaleValue,
                            child: IconButton(
                              icon: Icon(Icons.settings_outlined),
                              color: _selectedIndex == 3 ? kPrimaryColor : kSecondaryColor,
                              onPressed: () => _onItemTapped(3),
                            ),
                          );
                        },
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

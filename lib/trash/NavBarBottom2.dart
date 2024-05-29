// import 'package:animated_bottom_navigation_bar/animated_bottom_navigation_bar.dart';
// import 'package:flutter/material.dart';
// import '../constants.dart';
// import '../home.dart';
// import '../manage_data/add_data.dart';
// import '../manage_data/edit_maxAmount.dart';
// import 'package:flutter_speed_dial/flutter_speed_dial.dart';
//
// class NavBar2 extends StatefulWidget {
//   const NavBar2({Key? key}) : super(key: key);
//
//   @override
//   State<NavBar2> createState() => _NavBar2State();
// }
// class _NavBar2State extends State<NavBar2> {
//   int selected = 0;
//
//   Widget bodyPage(int index){
//     if(index == 0){
//       return HomePage();
//     }
//     else if(index == 1){
//       return AddData();
//     }
//     else{
//       return EditMaxAmount();
//     }
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: kPrimaryColor,
//       floatingActionButton: SpeedDial(
//         foregroundColor: Colors.white,
//         backgroundColor: kSecondaryColor,
//         child: Icon(Icons.add),
//         childMargin: EdgeInsets.symmetric(vertical: 20, horizontal: 10),
//         children: [
//           SpeedDialChild(
//             label: "Edit Max Amount",
//             child: Icon(Icons.edit),
//             shape: CircleBorder(),
//             onTap: () {
//               Navigator.push(
//                 context,
//                 MaterialPageRoute(builder: (context) => EditMaxAmount()),
//               );
//             },
//           ),
//           SpeedDialChild(
//             label: "Add Expense",
//             child: Icon(Icons.add),
//             shape: CircleBorder(),
//             onTap: () {
//               Navigator.push(
//                 context,
//                 MaterialPageRoute(builder: (context) => AddData()),
//               );
//             },
//           ),
//         ],
//       ),
//       floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
//       body: bodyPage(selected),
//       bottomNavigationBar: Container(
//         decoration: BoxDecoration(
//             color: kPrimaryColor,
//             borderRadius: BorderRadius.all(Radius.circular(35))),
//         child: AnimatedBottomNavigationBar(
//           backgroundColor: Colors.white,
//           activeIndex: selected,
//           icons: [
//             Icons.home,
//             Icons.settings_outlined,
//           ],
//           gapLocation: GapLocation.center,
//           activeColor: kPrimaryColor,
//           inactiveColor: kSecondaryColor,
//           onTap: (int index) {
//             setState(() {
//               selected = index;
//             });
//           },
//         ),
//       ),
//     );
//   }
// }

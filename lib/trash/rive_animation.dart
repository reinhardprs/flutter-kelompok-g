// import 'package:flutter/material.dart ';
// import 'package:flutter/services.dart';
// import 'package:rive/rive.dart';
//
// class Rave_Animation extends StatefulWidget {
//   const Rave_Animation({super.key});
//
//   @override
//   State<Rave_Animation> createState() => _Rave_AnimationState();
// }
//
// class _Rave_AnimationState extends State<Rave_Animation> {
//   Artboard? riveArtboard;
//   @override
//   // void initState() {
//   //   super.initState();
//   //   rootBundle.load("assets/RiveAssets/linkedin_icons_community.riv").then((data) async{
//   //     try{
//   //       final file = RiveFile.import(data);
//   //       final artboard = file.mainArtboard;
//   //       var controller = StateMachineController.fromArtboard(artboard, 'settings');
//   //       if (controller!=null){
//   //         artboard.addController(controller);
//   //       }
//   //       setState(() => riveArtboard = artboard);
//   //     } catch (e){
//   //       print(e);
//   //     }
//   //   },);
//   // }
//
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Stack(
//         children: [
//           const RiveAnimation.asset("assets/RiveAssets/shapes.riv"),
//         ],
//       ),
//     );
//   }
// }

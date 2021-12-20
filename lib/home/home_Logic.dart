// import 'package:flutter/material.dart';
//
// class Logic {
//   int currentPlayerInt;
//   Color defaultColor;
//   String currentPlayerString;
//
//   Logic(this.currentPlayerInt, this.defaultColor, this.currentPlayerString);
// }
//
// class Game {
//   static List<int> xPlayer = [];
//   static List<int> oPlayer = [];
//
//   static bool boolNumOfPlayers = false;
//
//   static int currentPlayerNum = 1;
//   static String currentPlayer = '';
//   static Color currentColor = Colors.white;
//
//   static addStep(int index) {
//     currentPlayerNum == 1 ? xPlayer.add(index) : oPlayer.add(index);
//     print(xPlayer.toString());
//     print(oPlayer.toString());
//   }
//
//   static onTapLogic() {
//     if (currentPlayerNum == 1) {
//       currentColor = Colors.lightGreenAccent;
//       currentPlayer = 'X';
//       currentPlayerNum = 2;
//     } else if (currentPlayerNum == 2) {
//       currentColor = Colors.lightBlueAccent;
//       currentPlayer = 'O';
//       currentPlayerNum = 1;
//     }
//   }
//
//   // static changeColor() {
//   //   currentColor = Colors.red;
//   // }
//
// }
//
// //addStep(int index) {
// //     currentPlayerInt == 1 ? xPlayer.add(index) : oPlayer.add(index);
// //     print(xPlayer.toString());
// //     print(oPlayer.toString());
// //   }
// //
// //   onTapLogic() {
// //     if (currentPlayerInt == 1) {
// //       defaultColor = Colors.lightGreenAccent;
// //       currentPlayerString = 'X';
// //       currentPlayerInt = 2;
// //       print('Logic is $currentPlayerInt $defaultColor $currentPlayerString');
// //     } else if (currentPlayerInt == 2) {
// //       defaultColor = Colors.lightBlueAccent;
// //       currentPlayerString = 'O';
// //       currentPlayerInt = 1;
// //       print('Logic is $currentPlayerInt $defaultColor $currentPlayerString');
// //     }
// //     print('Last $currentPlayerInt');
// //   }

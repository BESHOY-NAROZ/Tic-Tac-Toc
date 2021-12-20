import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:h_f_tic_tac_toc/state_management/states.dart';
import 'package:h_f_tic_tac_toc/state_management/tic_object.dart';

class TicCubit extends Cubit<TicStates> {
  TicCubit() : super(InitialState());
  static TicCubit getShopCubit(context) => BlocProvider.of(context);

  static List<int> xPlayer = [];
  static List<int> oPlayer = [];

  bool boolNumOfPlayers = false;
  bool noWinner = false;

  int turn = 0;

  switchListTile(bool changedValue) {
    boolNumOfPlayers = changedValue;
    emit(OnSwitchListTile());
  }

  int currentPlayerNum = 1;
  String currentPlayer = 'X';
  Color currentColor = Colors.white;
  List<CardObject> cardObjectList = [];

  resetGame() {
    currentColor = Colors.white;
    currentPlayer = 'X';
    currentPlayerNum = 1;
    noWinner = false;
    cardObjectList = [];
    oPlayer = [];
    xPlayer = [];
    turn = 0;
    emit(ResetGame());
  }

  checkWinner() {
    if ((xPlayer.contains(0) && xPlayer.contains(1) && xPlayer.contains(2)) ||
        (xPlayer.contains(3) && xPlayer.contains(4) && xPlayer.contains(5)) ||
        (xPlayer.contains(6) && xPlayer.contains(7) && xPlayer.contains(8)) ||
        (xPlayer.contains(0) && xPlayer.contains(3) && xPlayer.contains(6)) ||
        (xPlayer.contains(1) && xPlayer.contains(4) && xPlayer.contains(7)) ||
        (xPlayer.contains(2) && xPlayer.contains(5) && xPlayer.contains(8)) ||
        (xPlayer.contains(0) && xPlayer.contains(4) && xPlayer.contains(8)) ||
        (xPlayer.contains(2) && xPlayer.contains(4) && xPlayer.contains(6))) {
      noWinner = true;
      currentPlayer = 'X Winner';
      turn = 0;
      currentColor = Colors.lightGreenAccent;
    } else if ((oPlayer.contains(0) &&
            oPlayer.contains(1) &&
            oPlayer.contains(2)) ||
        (oPlayer.contains(3) && oPlayer.contains(4) && oPlayer.contains(5)) ||
        (oPlayer.contains(6) && oPlayer.contains(7) && oPlayer.contains(8)) ||
        (oPlayer.contains(0) && oPlayer.contains(3) && oPlayer.contains(6)) ||
        (oPlayer.contains(1) && oPlayer.contains(4) && oPlayer.contains(7)) ||
        (oPlayer.contains(2) && oPlayer.contains(5) && oPlayer.contains(8)) ||
        (oPlayer.contains(0) && oPlayer.contains(4) && oPlayer.contains(8)) ||
        (oPlayer.contains(2) && oPlayer.contains(4) && oPlayer.contains(6))) {
      currentPlayer = 'O Winner';
      noWinner = true;
      turn = 0;
      currentColor = Colors.lightBlueAccent;
    }
    emit(CheckWinner());
  }

  randomOrTwo(int currentIndex) {
    if (!boolNumOfPlayers) {
      turn++;
      turn++;
      addStepRandom(currentIndex);
      onTapLogicRandom(currentIndex);
    } else if (boolNumOfPlayers) {
      turn++;
      addStepTwo(currentIndex);
      onTapLogicTwo(currentIndex);
    }
    print(turn);
    checkWinner();
  }

  addStepRandom(int currentIndex) {
    if (currentPlayerNum == 1) {
      xPlayer.add(currentIndex);
    }
  }

  onTapLogicRandom(int currentIndex) {
    cardObjectList[currentIndex] =
        CardObject(objectPlayer: 'X', objectColor: Colors.lightGreenAccent);
    currentColor = Colors.lightBlueAccent;
    currentPlayer = 'O';
    randomPlayer();
    emit(OnTapLogic());
  }

  static List<int> rPlayer = [];
  randomPlayer() {
    int index;
    for (int i = 0; i < 9; i++) {
      if (!xPlayer.contains(i) && !oPlayer.contains(i)) {
        rPlayer.add(i);
      }
    }

    print('rPlayer $rPlayer');
    Random random = Random();
    if (turn <= 8) {
      int randomNumber = random.nextInt(rPlayer.length);
      index = rPlayer[randomNumber];
      currentColor = Colors.lightGreenAccent;
      currentPlayer = 'X';
      oPlayer.add(index);
      cardObjectList[index] =
          CardObject(objectPlayer: 'O', objectColor: Colors.lightBlueAccent);
    }

    print('randomNumber $index');
    rPlayer = [];

    emit(RandomPlayer());
  }

  addStepTwo(int currentIndex) {
    currentPlayerNum == 1
        ? xPlayer.add(currentIndex)
        : oPlayer.add(currentIndex);
    print(xPlayer.toString());
    print(oPlayer.toString());
  }

  onTapLogicTwo(int currentIndex) {
    if (currentPlayerNum == 1) {
      cardObjectList[currentIndex] =
          CardObject(objectPlayer: 'X', objectColor: Colors.lightGreenAccent);
      currentColor = Colors.lightBlueAccent;
      currentPlayer = 'O';
      // print(cardObjectList[currentIndex].objectPlayer);
      currentPlayerNum = 2;
    } else if (currentPlayerNum == 2) {
      cardObjectList[currentIndex] =
          CardObject(objectPlayer: 'O', objectColor: Colors.lightBlueAccent);
      // print(cardObjectList[currentIndex].objectPlayer);
      currentColor = Colors.lightGreenAccent;
      currentPlayer = 'X';
      currentPlayerNum = 1;
    }
    emit(OnTapLogic());
  }

  // static changeColor() {
  //   currentColor = Colors.red;
  // }

//addStep(int index) {
//     currentPlayerInt == 1 ? xPlayer.add(index) : oPlayer.add(index);
//     print(xPlayer.toString());
//     print(oPlayer.toString());
//   }
//
//   onTapLogic() {
//     if (currentPlayerInt == 1) {
//       defaultColor = Colors.lightGreenAccent;
//       currentPlayerString = 'X';
//       currentPlayerInt = 2;
//       print('Logic is $currentPlayerInt $defaultColor $currentPlayerString');
//     } else if (currentPlayerInt == 2) {
//       defaultColor = Colors.lightBlueAccent;
//       currentPlayerString = 'O';
//       currentPlayerInt = 1;
//       print('Logic is $currentPlayerInt $defaultColor $currentPlayerString');
//     }
//     print('Last $currentPlayerInt');
//   }

}

// addStep(int index) {
//   currentPlayerNum == 1 ? xPlayer.add(index) : oPlayer.add(index);
//   print(xPlayer.toString());
//   print(oPlayer.toString());
// }
//
// onTapLogic(int currentIndex) {
//   if (currentPlayerNum == 1) {
//     cardObjectList[currentIndex] =
//         CardObject(objectPlayer: 'X', objectColor: Colors.lightGreenAccent);
//     currentColor = Colors.lightBlueAccent;
//     currentPlayer = 'O';
//     // print(cardObjectList[currentIndex].objectPlayer);
//     currentPlayerNum = 2;
//   } else if (currentPlayerNum == 2) {
//     cardObjectList[currentIndex] =
//         CardObject(objectPlayer: 'O', objectColor: Colors.lightBlueAccent);
//     // print(cardObjectList[currentIndex].objectPlayer);
//     currentColor = Colors.lightGreenAccent;
//     currentPlayer = 'X';
//     currentPlayerNum = 1;
//   }
//   emit(OnTapLogic());
// }
extension ContainsAll on List {}

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:h_f_tic_tac_toc/const.dart';
import 'package:h_f_tic_tac_toc/size_config.dart';
import 'package:h_f_tic_tac_toc/state_management/cubit.dart';
import 'package:h_f_tic_tac_toc/state_management/states.dart';
import 'package:h_f_tic_tac_toc/state_management/tic_object.dart';

class HomeBody2 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);

    return BlocConsumer<TicCubit, TicStates>(
      listener: (BuildContext context, TicStates state) {},
      builder: (BuildContext context, TicStates state) {
        TicCubit ticCubit = TicCubit.getShopCubit(context);
        return Scaffold(
          backgroundColor: primaryColor,
          body: SafeArea(
            child: Padding(
              padding: EdgeInsets.symmetric(
                  horizontal: SizeConfig.defaultSize * 0.8),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  SwitchListTile.adaptive(
                    value: ticCubit.boolNumOfPlayers,
                    onChanged: (changedValue) {
                      ticCubit.switchListTile(changedValue);
                    },
                    title: Text(
                      'Turn on/off two players',
                      style: TextStyle(
                        color: Colors.white,
                      ),
                    ),
                  ),
                  Text.rich(
                    TextSpan(
                      children: [
                        !(ticCubit.turn >= 9)
                            ? (!ticCubit.noWinner)
                                ? TextSpan(
                                    text: 'IT\'S '.toUpperCase(),
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold,
                                        fontSize: SizeConfig.defaultSize * 5),
                                  )
                                : TextSpan(text: '')
                            : TextSpan(text: ''),
                        TextSpan(
                          text: ticCubit.turn >= 9
                              ? 'DRAW'
                              : ticCubit.currentPlayer.toUpperCase(),
                          style: TextStyle(
                              color: ticCubit.currentColor,
                              fontWeight: FontWeight.bold,
                              fontSize: SizeConfig.defaultSize * 8),
                        ),
                        !(ticCubit.turn >= 9)
                            ? (!ticCubit.noWinner)
                                ? TextSpan(
                                    text: ' turn'.toUpperCase(),
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold,
                                        fontSize: SizeConfig.defaultSize * 5),
                                  )
                                : TextSpan(text: '')
                            : TextSpan(text: ''),
                      ],
                    ),
                  ),
                  GridView.builder(
                    shrinkWrap: true,
                    itemCount: 9,
                    physics: BouncingScrollPhysics(),
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      childAspectRatio: kDefaultPadding / 15,
                      crossAxisCount: 3,
                      mainAxisSpacing: kDefaultPadding,
                      crossAxisSpacing: kDefaultPadding,
                    ),
                    itemBuilder: (BuildContext context, int index) {
                      ticCubit.cardObjectList.add(CardObject(
                          objectPlayerNum: index,
                          objectColor: Colors.white,
                          objectPlayer: ''));
                      return singleCard(ticCubit, index);
                    },
                  ),
                  Spacer(),
                  Padding(
                    padding: EdgeInsets.only(bottom: SizeConfig.defaultSize),
                    child: RaisedButton.icon(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8)),
                      elevation: 20,
                      onPressed: () {
                        ticCubit.resetGame();
                      },
                      icon: Icon(Icons.repeat),
                      label: Text(
                        'Repeat the game',
                        style: TextStyle(color: primaryColor),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }

  InkWell singleCard(TicCubit ticCubit, int index) {
    return InkWell(
      onTap: ((ticCubit.currentPlayer == 'X Winner') ||
              (ticCubit.currentPlayer == 'O Winner') ||
              (ticCubit.cardObjectList[index].objectColor != Colors.white))
          ? null
          : () {
              ticCubit.randomOrTwo(index);
            },
      child: Container(
        decoration: BoxDecoration(
            color: ticCubit.cardObjectList[index].objectColor,
            borderRadius: BorderRadius.circular(10)),
        child: Center(
          child: Text(
            ticCubit.cardObjectList[index].objectPlayer,
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 70),
          ),
        ),
      ),
    );
  }
}

// class SingleCard extends StatelessWidget {
//   TicCubit ticCubit;
//   int currentIndex;
//
//   SingleCard(this.ticCubit, this.currentIndex);
//
//   @override
//   Widget build(BuildContext context) {
//     return InkWell(
//       onTap: ticCubit.currentColor != Colors.white
//           ? null
//           : () {
//               ticCubit.addStep(currentIndex);
//               ticCubit.onTapLogic(currentIndex);
//             },
//       child: Container(
//         decoration: BoxDecoration(
//             color: ticCubit.currentColor,
//             borderRadius: BorderRadius.circular(10)),
//         child: Center(
//           child: Text(
//             ticCubit.currentPlayer,
//             style: TextStyle(fontWeight: FontWeight.bold, fontSize: 50),
//           ),
//         ),
//       ),
//     );
//   }
// }

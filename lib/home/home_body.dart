import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:h_f_tic_tac_toc/const.dart';
import 'package:h_f_tic_tac_toc/size_config.dart';

class HomeBody extends StatefulWidget {
  @override
  _HomeBodyState createState() => _HomeBodyState();
}

class _HomeBodyState extends State<HomeBody> {
  bool boolNumOfPlayers = false;
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      backgroundColor: primaryColor,
      body: SafeArea(
        child: Padding(
          padding:
              EdgeInsets.symmetric(horizontal: SizeConfig.defaultSize * 0.8),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              SwitchListTile.adaptive(
                value: boolNumOfPlayers,
                onChanged: (changedValue) {
                  setState(() {
                    boolNumOfPlayers = changedValue;
                  });
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
                    text: 'IT\'S '.toUpperCase(),
                    style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: SizeConfig.defaultSize * 5),
                    children: [
                      TextSpan(
                        text: 'x '.toUpperCase(),
                        style: TextStyle(
                            color: Colors.lightGreenAccent,
                            fontWeight: FontWeight.bold,
                            fontSize: SizeConfig.defaultSize * 8),
                      ),
                      TextSpan(
                        text: 'turn'.toUpperCase(),
                        style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: SizeConfig.defaultSize * 5),
                      ),
                    ]),
              ),
              GridView.builder(
                shrinkWrap: true,
                itemCount: 9,
                physics: BouncingScrollPhysics(),
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 3,
                  mainAxisSpacing: kDefaultPadding,
                  crossAxisSpacing: kDefaultPadding,
                ),
                itemBuilder: (BuildContext context, int index) {
                  return SingleCard(index);
                },
              ),
              Spacer(),
              Padding(
                padding: EdgeInsets.only(bottom: SizeConfig.defaultSize),
                child: RaisedButton.icon(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8)),
                  elevation: 20,
                  onPressed: () {},
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
  }
}

class SingleCard extends StatefulWidget {
  final int currentIndex;

  SingleCard(this.currentIndex);

  @override
  _SingleCardState createState() => _SingleCardState();
}

int currentPlayerInt = 1;
String currentPlayerString = '';

class _SingleCardState extends State<SingleCard> {
  Color defaultColor = Colors.white;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: defaultColor != Colors.white
          ? null
          : () {
              setState(() {
                if (currentPlayerInt == 1) {
                  defaultColor = Colors.lightGreenAccent;
                  print('first $currentPlayerInt');
                  currentPlayerString = 'X';
                  currentPlayerInt = 2;
                } else if (currentPlayerInt == 2) {
                  defaultColor = Colors.lightBlueAccent;
                  print('second $currentPlayerInt');
                  currentPlayerString = 'O';
                  currentPlayerInt = 1;
                }
              });
            },
      child: Container(
        decoration: BoxDecoration(
            color: defaultColor, borderRadius: BorderRadius.circular(10)),
        child: Center(
          child: Text(
            currentPlayerString,
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 50),
          ),
        ),
      ),
    );
  }
}

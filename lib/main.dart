import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:h_f_tic_tac_toc/home/home_body2.dart';
import 'package:h_f_tic_tac_toc/state_management/cubit.dart';
import 'package:h_f_tic_tac_toc/state_management/states.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (context) => TicCubit(),
        child: BlocConsumer<TicCubit, TicStates>(
          listener: (BuildContext context, state) {},
          builder: (BuildContext context, state) {
            return MaterialApp(
              debugShowCheckedModeBanner: false,
              theme: ThemeData(
                primarySwatch: Colors.blue,
              ),
              home: HomeBody2(),
            );
          },
        ));
  }
}

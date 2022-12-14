

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:travel/cubit/app_cubit_state.dart';
import 'package:travel/cubit/app_cubits.dart';
import 'package:travel/pages/detail_page.dart';
import 'package:travel/pages/home_page.dart';
import 'package:travel/pages/nav_pages/main_page.dart';
import 'package:travel/pages/wellcome_page.dart';

class AppCubitLogics extends StatefulWidget {
  const AppCubitLogics({Key? key}) : super(key: key);

  @override
  State<AppCubitLogics> createState() => _AppCubitLogicsState();
}

class _AppCubitLogicsState extends State<AppCubitLogics> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<AppCubits, CubitState>(
        builder: (context,state){
          if (state is WelcomeState){
            return WellcomPage();
          }
          if (state is LoadedState){
            return MainPage();
          }
          if (state is DetailState){
            return DetailPage();
          }
          if (state is LodingState){
            return Center(child: CircularProgressIndicator(),);
          }else{
            return Container();
          }
        },
      ),

    );
  }
}

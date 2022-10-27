import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:travel/cubit/app_cubit_state.dart';
import 'package:travel/cubit/app_cubits.dart';
import 'package:travel/misc/colors.dart';
import 'package:travel/widgets/app_buttons.dart';
import 'package:travel/widgets/app_large_text.dart';
import 'package:travel/widgets/app_text.dart';
import 'package:travel/widgets/responsive_button.dart';

class DetailPage extends StatefulWidget {
  const DetailPage({Key? key}) : super(key: key);

  @override
  State<DetailPage> createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  int gotenstars=3;
  int selectedIndex =-1;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AppCubits,CubitState>(builder: (context,state){
      DetailState detail =state as DetailState;
      return Scaffold(
        body: Container(
          width: double.maxFinite,
          height: double.maxFinite,
          child: Stack(
            children: [
              Positioned(
                  left: 0,
                  right: 0,
                  child: Container(
                    width: double.maxFinite,
                    height: 350,
                    decoration: BoxDecoration(
                        image: DecorationImage(
                          image: NetworkImage("http://mark.bslmeiyu.com/uploads/"+detail.places.img),
                          fit: BoxFit.cover,
                        )),
                  )),
              Positioned(
                  left: 20,
                  top: 50,
                  child: Row(
                    children: [
                      IconButton(
                        onPressed: () {
                          BlocProvider.of<AppCubits>(context).goHome();
                        },
                        icon: Icon(Icons.menu),
                        color: Colors.white,
                      ),
                    ],
                  )),
              Positioned(
                  top: 320,
                  child: Container(
                    padding: const EdgeInsets.only(left: 20, right: 20, top: 30),
                    width: MediaQuery.of(context).size.width,
                    height: 500,
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.only(
                          topRight: Radius.circular(30),
                          topLeft: Radius.circular(30),
                        )),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            AppLargeText(
                              text: detail.places.name,
                              color: Colors.black54,
                            ),
                            AppLargeText(
                              text: "\$ "+detail.places.price.toString(),
                              color: AppColors.mainColor,
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Row(
                          children: [
                            Icon(
                              Icons.location_on,
                              color: AppColors.mainColor,
                            ),
                            SizedBox(
                              width: 5,
                            ),
                            AppText(
                              text: detail.places.location,
                              color: AppColors.textColor1,
                            )
                          ],
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Row(
                          children: [
                            Wrap(
                              children: List.generate(5, (index) {
                                return Icon(Icons.star , color:index<detail.places.stars? AppColors.starColor: AppColors.textColor2,);
                              }),
                            ),
                            SizedBox(width: 15,),
                            AppText(text: "("+detail.places.stars.toString()+")" , color: AppColors.textColor2,),

                          ],
                        ),
                        SizedBox( height: 25,),
                        AppLargeText(text: "People", color: Colors.black.withOpacity(0.8), size: 20,),
                        SizedBox( height: 5,),
                        AppText(text: "number of people in your group", color: AppColors.mainTextColor,),
                        SizedBox( height: 10,),
                        Wrap(
                          children: List.generate(5, (index) {
                            return InkWell(
                              onTap: (){
                                setState(() {
                                  selectedIndex =index ;
                                });

                              },
                              child: Container(
                                margin: const EdgeInsets.only(right: 10),
                                child: AppButtons(
                                  size: 50,
                                  color:selectedIndex ==index ?Colors.white: Colors.black,
                                  backgroundColor: selectedIndex ==index ?Colors.black :AppColors.buttonBackground,
                                  borderColor:selectedIndex ==index ?Colors.black:AppColors.buttonBackground,
                                  text: (index+1).toString(),

                                ),
                              ),
                            );
                          }),
                        ),
                        SizedBox( height: 20,),
                        AppLargeText(text: "Description", color: Colors.black.withOpacity(0.8),size: 20,),
                        SizedBox( height: 5,),
                        AppText(text: detail.places.description, color: AppColors.mainTextColor,)


                      ],
                    ),
                  )),
              Positioned(
                  bottom: 20,
                  left: 20,
                  right: 20,
                  child: Row(
                    children: [
                      AppButtons(
                        size: 60,
                        color: AppColors.textColor1,
                        backgroundColor: Colors.white,
                        borderColor: AppColors.textColor1,
                        isIcon:true,
                        icon: Icons.favorite_border,),
                      SizedBox(width: 20,),
                      ResponsiveButton(
                        isResponsive: true,

                      )
                    ],
                  )
              ),
            ],
          ),
        ),
      );
    }) ;
      
      
      

  }
}


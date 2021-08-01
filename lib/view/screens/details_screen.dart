import 'package:cocking_time/cubit/favorite_cubit.dart';
import 'package:cocking_time/cubit/home_cubit.dart';
import 'package:cocking_time/cubit/home_states.dart';
import 'package:cocking_time/view/widgets/custom_drower.dart';
import 'package:cocking_time/view/widgets/functions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../constant.dart';

class DetailsScreen extends StatelessWidget {
  static const routeName = 'DetailsScreen';
  // List<Ingredient>? ingredients = [];
  @override
  Widget build(BuildContext context) {
    final Map<dynamic, dynamic> argument =
        ModalRoute.of(context)!.settings.arguments! as Map;
    final thumb = argument['thumb'] as String;
    final index = argument['index'] as int;
    return Scaffold(
      drawer: CustomDrawer(),
      body: SafeArea(
        child: BlocConsumer<HomeCubit, HomeStates>(
          listener: (context, state) {},
          builder: (context, state) {
            final HomeCubit cubit = HomeCubit.get(context);
            // void fillIngredients() {
            //   // ignore: avoid_function_literals_in_foreach_calls
            //   ingredients!.forEach((element) {
            //     element.size = phoneSize(context);
            //     element.context = context;
            //     element.index = index;
            //     element.ingredientItem =
            //         cubit.randomMeals![index].strIngredient1;
            //     element.quantity = cubit.randomMeals![index].strMeasure1;
            //   });
            // }
            // fillIngredients();
            return Stack(
              children: [
                Image.network(
                  thumb,
                  fit: BoxFit.cover,
                ),
                buildAppbarDetais(context, cubit, index),
                Align(
                  alignment: Alignment.bottomCenter,
                  child: Container(
                    width: phoneSize(context).width,
                    height: phoneSize(context).height / 1.8,
                    decoration: const BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(30.0),
                          topRight: Radius.circular(30.0),
                        )),
                    child: Container(
                      width: phoneSize(context).width,
                      height: phoneSize(context).height / 1.9,
                      decoration: const BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(30.0),
                            topRight: Radius.circular(30.0),
                          )),
                      child: SingleChildScrollView(
                          child: Column(
                        children: [
                          Padding(
                            padding:
                                const EdgeInsets.only(top: 10.0, bottom: 30.0),
                            child: Container(
                              decoration: BoxDecoration(
                                  color: Colors.grey[400],
                                  borderRadius: BorderRadius.circular(10.0)),
                              width: 40.0,
                              height: 4.0,
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 10.0),
                            child: Row(
                              children: [
                                Text(
                                  cubit.randomMeals![index].strMeal!,
                                  style: googleStyle(context),
                                  // style: googleStyleSmall(context)
                                  //     .copyWith(fontWeight: FontWeight.w400),
                                ),
                              ],
                            ),
                          ),
                          const SizedBox(height: 20.0),
                          coloredListBuilder(context),
                          Padding(
                            padding:
                                const EdgeInsets.symmetric(horizontal: 10.0),
                            child: SizedBox(
                              height: 50.0,
                              width: phoneSize(context).width - 10,
                              child: Row(
                                children: [
                                  Expanded(
                                    child: Text(
                                        'Category: ${cubit.randomMeals![index].strCategory}',
                                        style: googleStyleSmall(context)
                                            .copyWith(
                                                fontWeight: FontWeight.w400)),
                                  ),
                                  const SizedBox(width: 10.0),
                                  Expanded(
                                    child: Text(
                                        'Area: ${cubit.randomMeals![index].strArea}',
                                        style: googleStyleSmall(context)
                                            .copyWith(
                                                fontWeight: FontWeight.w400)),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          Padding(
                              padding: const EdgeInsets.symmetric(
                                horizontal: 15.0,
                                vertical: 8.0,
                              ),
                              child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      'ingredients: ',
                                      style: googleStyle(context),
                                    ),
                                    const SizedBox(height: 10.0),
                                    SizedBox(
                                      height: 100.0,
                                      child: ListView.builder(
                                        itemCount: cubit.randomMeals![index]
                                            .mealIngerientd!.length,
                                        itemBuilder: (context, index) {
                                          return buildIngredientsItem(
                                            phoneSize(context),
                                            context,
                                            index,
                                            cubit.randomMeals![index]
                                            .mealIngerientd![index].ingredientItem,
                                             cubit.randomMeals![index]
                                            .mealIngerientd![index].measure,
                                          );
                                        },
                                      ),
                                    ),
                                    // buildIngredientsItem(
                                    //   phoneSize(context),
                                    //   context,
                                    //   index,
                                    //   cubit.randomMeals![index].strIngredient1!,
                                    //   cubit.randomMeals![index].strMeasure1!,
                                    // ),
                                    // buildIngredientsItem(
                                    //   phoneSize(context),
                                    //   context,
                                    //   index,
                                    //   cubit.randomMeals![index].strIngredient2!,
                                    //   cubit.randomMeals![index].strMeasure2!,
                                    // ),
                                    // buildIngredientsItem(
                                    //   phoneSize(context),
                                    //   context,
                                    //   index,
                                    //   cubit.randomMeals![index].strIngredient3!,
                                    //   cubit.randomMeals![index].strMeasure3!,
                                    // ),
                                    // buildIngredientsItem(
                                    //   phoneSize(context),
                                    //   context,
                                    //   index,
                                    //   cubit.randomMeals![index].strIngredient4!,
                                    //   cubit.randomMeals![index].strMeasure4!,
                                    // ),
                                    // buildIngredientsItem(
                                    //   phoneSize(context),
                                    //   context,
                                    //   index,
                                    //   cubit.randomMeals![index].strIngredient5!,
                                    //   cubit.randomMeals![index].strMeasure5!,
                                    // ),
                                    // buildIngredientsItem(
                                    //   phoneSize(context),
                                    //   context,
                                    //   index,
                                    //   cubit.randomMeals![index].strIngredient6!,
                                    //   cubit.randomMeals![index].strMeasure6!,
                                    // ),
                                    // buildIngredientsItem(
                                    //   phoneSize(context),
                                    //   context,
                                    //   index,
                                    //   cubit.randomMeals![index].strIngredient7!,
                                    //   cubit.randomMeals![index].strMeasure7!,
                                    // ),
                                    // buildIngredientsItem(
                                    //   phoneSize(context),
                                    //   context,
                                    //   index,
                                    //   cubit.randomMeals![index].strIngredient8!,
                                    //   cubit.randomMeals![index].strMeasure8!,
                                    // ),
                                    // buildIngredientsItem(
                                    //   phoneSize(context),
                                    //   context,
                                    //   index,
                                    //   cubit.randomMeals![index].strIngredient9!,
                                    //   cubit.randomMeals![index].strMeasure9!,
                                    // ),
                                    // buildIngredientsItem(
                                    //   phoneSize(context),
                                    //   context,
                                    //   index,
                                    //   cubit
                                    //       .randomMeals![index].strIngredient10!,
                                    //   cubit.randomMeals![index].strMeasure10!,
                                    // ),
                                    // buildIngredientsItem(
                                    //   phoneSize(context),
                                    //   context,
                                    //   index,
                                    //   cubit
                                    //       .randomMeals![index].strIngredient11!,
                                    //   cubit.randomMeals![index].strMeasure11!,
                                    // ),

                                    // buildIngredientsItem(
                                    //   phoneSize(context),
                                    //   context,
                                    //   index,
                                    //   cubit
                                    //       .randomMeals![index].strIngredient12!,
                                    //   cubit.randomMeals![index].strMeasure12!,
                                    // ),
                                    // buildIngredientsItem(
                                    //   phoneSize(context),
                                    //   context,
                                    //   index,
                                    //   cubit
                                    //       .randomMeals![index].strIngredient13!,
                                    //   cubit.randomMeals![index].strMeasure13!,
                                    // ),
                                    // buildIngredientsItem(
                                    //   phoneSize(context),
                                    //   context,
                                    //   index,
                                    //   cubit
                                    //       .randomMeals![index].strIngredient14!,
                                    //   cubit.randomMeals![index].strMeasure14!,
                                    // ),
                                    // buildIngredientsItem(
                                    //   phoneSize(context),
                                    //   context,
                                    //   index,
                                    //   cubit
                                    //       .randomMeals![index].strIngredient15!,
                                    //   cubit.randomMeals![index].strMeasure15!,
                                    // ),
                                    // buildIngredientsItem(
                                    //   phoneSize(context),
                                    //   context,
                                    //   index,
                                    //   cubit
                                    //       .randomMeals![index].strIngredient16!,
                                    //   cubit.randomMeals![index].strMeasure16!,
                                    // ),
                                    // buildIngredientsItem(
                                    //   phoneSize(context),
                                    //   context,
                                    //   index,
                                    //   cubit
                                    //       .randomMeals![index].strIngredient17!,
                                    //   cubit.randomMeals![index].strMeasure17!,
                                    // ),
                                    // buildIngredientsItem(
                                    //   phoneSize(context),
                                    //   context,
                                    //   index,
                                    //   cubit
                                    //       .randomMeals![index].strIngredient18!,
                                    //   cubit.randomMeals![index].strMeasure18!,
                                    // ),

                                    // buildIngredientsItem(
                                    //   phoneSize(context),
                                    //   context,
                                    //   index,
                                    //   cubit
                                    //       .randomMeals![index].strIngredient19!,
                                    //   cubit.randomMeals![index].strMeasure19!,
                                    // ),
                                    // buildIngredientsItem(
                                    //   phoneSize(context),
                                    //   context,
                                    //   index,
                                    //   cubit
                                    //       .randomMeals![index].strIngredient20!,
                                    //   cubit.randomMeals![index].strMeasure20!,
                                    // ),
                                    const SizedBox(height: 30.0),
                                    Text(
                                      'Instructions: ',
                                      style: googleStyle(context),
                                    ),
                                    const SizedBox(height: 15.0),
                                    Text(
                                      cubit
                                          .randomMeals![index].strInstructions!,
                                      style: googleStyleSmall(context),
                                    ),
                                  ]))
                        ],
                      )),
                    ),
                  ),
                )
              ],
            );
          },
        ),
      ),
    );
  }

  SizedBox buildIngredientsItem(
    Size size,
    BuildContext context,
    int myIndex,
    String ingredientItem,
    String quantity,
  ) {
    return SizedBox(
      width: size.width - 10,
      child: ingredientItem.isNotEmpty
          ? rowingredients(context, ingredientItem, quantity)
          : Container(),
    );
  }

  Row rowingredients(BuildContext context, String text, String quantity) {
    return Row(
      children: [
        Container(
          width: 10.0,
          height: 10.0,
          decoration:
              const BoxDecoration(color: Colors.orange, shape: BoxShape.circle),
        ),
        const SizedBox(width: 15.0),
        SizedBox(
          height: 35,
          width: phoneSize(context).width * 0.8,
          child: text.isNotEmpty
              ? Row(
                  children: [
                    Text(
                      text,
                      style: googleStyleSmall(context),
                    ),
                    const SizedBox(width: 10.0),
                    Expanded(
                      child: Text(
                        quantity,
                        style: googleStyleSmall(context),
                      ),
                    ),
                  ],
                )
              : const SizedBox(),
        ),
        const SizedBox(height: 10.0),
      ],
    );
  }
}
/*
import 'package:coocking_time/constant.dart';
// import 'package:coocking_time/model/ingriedent.dart';
// import 'package:coocking_time/provider/favoriteProvider.dart';
import 'package:coocking_time/widgets/drawer.dart';
import 'package:flutter/material.dart';
import 'package:coocking_time/services/mainApi.dart';
import 'package:provider/provider.dart';

import '../function.dart';

//TODO: ui need some work here
//readius and text
class DetailsScreen extends StatelessWidget {
  static const String routeName = 'DetailsScreen';

  // List<Ingriedent> _list = [];

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    Map<dynamic, dynamic> argument = ModalRoute.of(context).settings.arguments;
    var arguments = argument['thumb'];
    var myIndex = argument['index'];
    var myIndex0 = argument['index'];
    var myNum = argument['num'];
//1=meals
//2=randommeals
    // print(myIndex0);
    return Scaffold(
      drawer: CustumDrawer(),
      /*myNum== 1
       ? api.meals[myIndex].strMeal
       : api.randomMeals[myIndex0].strMeal, */
      appBar: buildAppBarWithFavoriteIcon(
          context,
          myNum == 1
              ? Provider.of<Api>(context).allMeals[myIndex]
              : Provider.of<Api>(context).randomMeals[myIndex0]),
      body: Stack(
        children: [
          Image.network(
            arguments.toString(),
            fit: BoxFit.cover,
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              width: size.width,
              height: size.height / 1.9,
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(30.0),
                    topRight: Radius.circular(30.0),
                  )),
              child: Container(
                //
                width: size.width,
                height: size.height / 1.9,
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(30.0),
                      topRight: Radius.circular(30.0),
                    )),
                child: SingleChildScrollView(
                  child: Consumer<Api>(
                    builder: (ctx, api, widget) {
                      return Column(
                        children: [
                          Padding(
                            padding:
                                const EdgeInsets.only(top: 10.0, bottom: 30.0),
                            child: Container(
                              decoration: BoxDecoration(
                                  color: Colors.grey[400],
                                  borderRadius: BorderRadius.circular(10.0)),
                              width: 40.0,
                              height: 4.0,
                            ),
                          ),
                          Padding(
                            padding:
                                const EdgeInsets.symmetric(horizontal: 10.0),
                            child: Container(
                              height: 50.0,
                              width: size.width - 10,
                              child: Row(
                                children: [
                                  Expanded(
                                    child: Text(
                                      myNum == 1
                                          ? 'Category: ${api.allMeals[myIndex].strCategory}'
                                          : 'Category: ${api.randomMeals[myIndex0].strCategory}',
                                      style: kStyleSmall,
                                    ),
                                  ),
                                   const SizedBox(width: 10.0),
                                  Expanded(
                                    child: Text(
                                      myNum == 1
                                          ? 'Area: ${api.allMeals[myIndex].strArea}'
                                          : 'Area: ${api.randomMeals[myIndex0].strArea}',
                                      style: kStyleSmall,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(15.0),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  myNum == 1
                                      ? api.allMeals[myIndex].strMeal
                                      : api.randomMeals[myIndex0].strMeal,
                                  style: kStyle1,
                                ),
                                SizedBox(height: 30.0),
                                Text(
                                  'ingredients: ',
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 20.0),
                                ),
                                SizedBox(height: 10.0),
                                buildIngredientsItem(
                                    size,
                                    context,
                                    myIndex,
                                    myNum == 1
                                        ? api.allMeals[myIndex].strIngredient1
                                        
                                    myNum == 1
                                        ? api.allMeals[myIndex].strMeasure1
                                        : api
                                            .randomMeals[myIndex0].strMeasure1),
                                buildIngredientsItem(
                                    size,
                                    context,
                                    myIndex,
                                    myNum == 1
                                        ? api.allMeals[myIndex].strIngredient2
                                        : api.randomMeals[myIndex0]
                                            .strIngredient2,
                                    myNum == 1
                                        ? api.allMeals[myIndex].strMeasure2
                                        : api
                                            .randomMeals[myIndex0].strMeasure2),
                                buildIngredientsItem(
                                    size,
                                    context,
                                    myIndex,
                                    myNum == 1
                                        ? api.allMeals[myIndex].strIngredient3
                                        : api.randomMeals[myIndex0]
                                            .strIngredient3,
                                    myNum == 1
                                        ? api.allMeals[myIndex].strMeasure3
                                        : api
                                            .randomMeals[myIndex0].strMeasure3),
                                buildIngredientsItem(
                                    size,
                                    context,
                                    myIndex,
                                    myNum == 1
                                        ? api.allMeals[myIndex].strIngredient4
                                        : api.randomMeals[myIndex0]
                                            .strIngredient4,
                                    myNum == 1
                                        ? api.allMeals[myIndex].strMeasure4
                                        : api
                                            .randomMeals[myIndex0].strMeasure4),
                                buildIngredientsItem(
                                    size,
                                    context,
                                    myIndex,
                                    myNum == 1
                                        ? api.allMeals[myIndex].strIngredient5
                                        : api.randomMeals[myIndex0]
                                            .strIngredient5,
                                    myNum == 1
                                        ? api.allMeals[myIndex].strMeasure5
                                        : api.allMeals[myIndex].strMeasure5),
                                buildIngredientsItem(
                                    size,
                                    context,
                                    myIndex,
                                    myNum == 1
                                        ? api.allMeals[myIndex].strIngredient6
                                        : api.randomMeals[myIndex0]
                                            .strIngredient6,
                                    myNum == 1
                                        ? api.allMeals[myIndex].strMeasure6
                                        : api
                                            .randomMeals[myIndex0].strMeasure6),
                                buildIngredientsItem(
                                    size,
                                    context,
                                    myIndex,
                                    myNum == 1
                                        ? api.allMeals[myIndex].strIngredient7
                                        : api.randomMeals[myIndex0]
                                            .strIngredient7,
                                    myNum == 1
                                        ? api.allMeals[myIndex].strMeasure7
                                        : api
                                            .randomMeals[myIndex0].strMeasure7),
                                buildIngredientsItem(
                                    size,
                                    context,
                                    myIndex,
                                    myNum == 1
                                        ? api.allMeals[myIndex].strIngredient8
                                        : api.randomMeals[myIndex0]
                                            .strIngredient8,
                                    myNum == 1
                                        ? api.allMeals[myIndex].strMeasure8
                                        : api
                                            .randomMeals[myIndex0].strMeasure8),
                                buildIngredientsItem(
                                    size,
                                    context,
                                    myIndex,
                                    myNum == 1
                                        ? api.allMeals[myIndex].strIngredient9
                                        : api.randomMeals[myIndex0]
                                            .strIngredient9,
                                    myNum == 1
                                        ? api.allMeals[myIndex].strMeasure9
                                        : api
                                            .randomMeals[myIndex0].strMeasure9),
                                buildIngredientsItem(
                                    size,
                                    context,
                                    myIndex,
                                    myNum == 1
                                        ? api.allMeals[myIndex].strIngredient10
                                        : api.randomMeals[myIndex0]
                                            .strIngredient10,
                                    myNum == 1
                                        ? api.allMeals[myIndex].strMeasure10
                                        : api.randomMeals[myIndex0]
                                            .strMeasure10),
                                buildIngredientsItem(
                                    size,
                                    context,
                                    myIndex,
                                    myNum == 1
                                        ? api.allMeals[myIndex].strIngredient11
                                        : api.randomMeals[myIndex0]
                                            .strIngredient11,
                                    myNum == 1
                                        ? api.allMeals[myIndex].strMeasure11
                                        : api.randomMeals[myIndex0]
                                            .strMeasure11),
                                buildIngredientsItem(
                                    size,
                                    context,
                                    myIndex,
                                    myNum == 1
                                        ? api.allMeals[myIndex].strIngredient12
                                        : api.randomMeals[myIndex0]
                                            .strIngredient12,
                                    myNum == 1
                                        ? api.allMeals[myIndex].strMeasure12
                                        : api.randomMeals[myIndex0]
                                            .strMeasure12),
                                buildIngredientsItem(
                                    size,
                                    context,
                                    myIndex,
                                    myNum == 1
                                        ? api.allMeals[myIndex].strIngredient13
                                        : api.randomMeals[myIndex0]
                                            .strIngredient13,
                                    myNum == 1
                                        ? api.allMeals[myIndex].strMeasure13
                                        : api.randomMeals[myIndex0]
                                            .strMeasure13),
                                buildIngredientsItem(
                                    size,
                                    context,
                                    myIndex,
                                    myNum == 1
                                        ? api.allMeals[myIndex].strIngredient14
                                        : api.randomMeals[myIndex0]
                                            .strIngredient14,
                                    myNum == 1
                                        ? api.allMeals[myIndex].strMeasure14
                                        : api.randomMeals[myIndex0]
                                            .strMeasure14),
                                buildIngredientsItem(
                                    size,
                                    context,
                                    myIndex,
                                    myNum == 1
                                        ? api.allMeals[myIndex].strIngredient15
                                        : api.randomMeals[myIndex0]
                                            .strIngredient15,
                                    myNum == 1
                                        ? api.allMeals[myIndex].strMeasure15
                                        : api.randomMeals[myIndex0]
                                            .strMeasure15),
                                buildIngredientsItem(
                                    size,
                                    context,
                                    myIndex,
                                    myNum == 1
                                        ? api.allMeals[myIndex].strIngredient16
                                        : api.randomMeals[myIndex0]
                                            .strIngredient16,
                                    myNum == 1
                                        ? api.allMeals[myIndex].strMeasure16
                                        : api.randomMeals[myIndex0]
                                            .strMeasure16),
                                buildIngredientsItem(
                                    size,
                                    context,
                                    myIndex,
                                    myNum == 1
                                        ? api.allMeals[myIndex].strIngredient17
                                        : api.randomMeals[myIndex0]
                                            .strIngredient17,
                                    myNum == 1
                                        ? api.allMeals[myIndex].strMeasure17
                                        : api.randomMeals[myIndex0]
                                            .strMeasure17),
                                buildIngredientsItem(
                                    size,
                                    context,
                                    myIndex,
                                    myNum == 1
                                        ? api.allMeals[myIndex].strIngredient18
                                        : api.randomMeals[myIndex0]
                                            .strIngredient18,
                                    myNum == 1
                                        ? api.allMeals[myIndex].strMeasure18
                                        : api.randomMeals[myIndex0]
                                            .strMeasure18),
                                buildIngredientsItem(
                                    size,
                                    context,
                                    myIndex,
                                    myNum == 1
                                        ? api.allMeals[myIndex].strIngredient19
                                        : api.randomMeals[myIndex0]
                                            .strIngredient19,
                                    myNum == 1
                                        ? api.allMeals[myIndex].strMeasure19
                                        : api.randomMeals[myIndex0]
                                            .strMeasure19),
                                buildIngredientsItem(
                                    size,
                                    context,
                                    myIndex,
                                    myNum == 1
                                        ? api.allMeals[myIndex].strIngredient20
                                        : api.randomMeals[myIndex0]
                                            .strIngredient20,
                                    myNum == 1
                                        ? api.allMeals[myIndex].strMeasure20
                                        : api.randomMeals[myIndex0]
                                            .strMeasure20),
                                SizedBox(height: 30.0),
                                Text(
                                  'Instructions: ',
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 20.0),
                                ),
                                SizedBox(height: 15.0),
                                Text(
                                  api.allMeals[myIndex].strInstructions,
                                  style: kStyleSmall,
                                ),
                              ],
                            ),
                          )
                        ],
                      );
                    },
                  ),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }

  Container buildIngredientsItem(Size size, BuildContext context, int myIndex,
      String ingredientItem, String quantity) {
    return Container(
      // height: 180,
      width: size.width - 10,
      child: ingredientItem.isNotEmpty
          ? rowingredients(context, ingredientItem, quantity)
          : Container(),
    );
  }

  Row rowingredients(BuildContext context, String text, String quantity) {
    return Row(
      children: [
        Container(
          width: 10.0,
          height: 10.0,
          decoration:
              BoxDecoration(color: Colors.orange, shape: BoxShape.circle),
        ),
        SizedBox(width: 15.0),
        Container(
          height: 50,
          width: MediaQuery.of(context).size.width * 0.8,
          child: text.isNotEmpty
              ? Row(
                  children: [
                    Text(
                      text,
                      style: kStyleSmall,
                    ),
                    SizedBox(width: 10.0),
                    Expanded(
                      child: Text(
                        quantity,
                        style: kStyleSmall,
                      ),
                    ),
                  ],
                )
              : Container(),
        ),
        SizedBox(
          height: 10.0,
        ),
      ],
    );
  }
}

 */
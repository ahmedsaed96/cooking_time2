import 'package:cocking_time/cubit/area_cubit.dart';

import 'package:cocking_time/cubit/home_cubit.dart';
import 'package:cocking_time/cubit/home_states.dart';
import 'package:cocking_time/local/shared_prefrences.dart';
import 'package:cocking_time/view/widgets/custom_drower.dart';
import 'package:cocking_time/view/widgets/functions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../constant.dart';

class AreaMealDetails extends StatelessWidget {
  static const routeName = 'AreaMealDetails';
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
            return Stack(
              children: [
                Image.network(
                  thumb,
                  // fit: BoxFit.cover,
                ),
                buildAppbarDetais(context, cubit, index,
                    AreaCubit.get(context).allAreas[index]),
                Align(
                  alignment: Alignment.bottomCenter,
                  child: Container(
                    width: phoneSize(context).width,
                    height: phoneSize(context).height / 1.8,
                    decoration: BoxDecoration(
                        color:
                            MySharedPrefrences.getString(key: 'mode') == 'true'
                                ? Colors.white
                                : Colors.blueGrey,
                        borderRadius: const BorderRadius.only(
                          topLeft: Radius.circular(30.0),
                          topRight: Radius.circular(30.0),
                        )),
                    child: Column(
                      children: [
                        const SizedBox(height: 10.0),
                        Container(
                          width: phoneSize(context).width,
                          height: phoneSize(context).height / 1.9,
                          decoration: const BoxDecoration(
                              borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(30.0),
                            topRight: Radius.circular(30.0),
                          )),
                          child: SingleChildScrollView(
                              child: Column(
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(
                                    top: 10.0, bottom: 30.0),
                                child: Container(
                                  decoration: BoxDecoration(
                                      color: Colors.grey[400],
                                      borderRadius:
                                          BorderRadius.circular(10.0)),
                                  width: 40.0,
                                  height: 4.0,
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(left: 10.0),
                                child: Row(
                                  children: [
                                    Expanded(
                                      child: SizedBox(
                                        child: Text(
                                          AreaCubit.get(context)
                                              .allAreas[index]
                                              .strMeal!,
                                          maxLines: 3,
                                          style: googleStyle(context),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              const SizedBox(height: 20.0),
                              coloredListBuilder(context),
                              Padding(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 10.0),
                                child: SizedBox(
                                  height: 50.0,
                                  width: phoneSize(context).width - 10,
                                  child: Row(
                                    children: [
                                      Expanded(
                                        child: Text(
                                            'Category: ${AreaCubit.get(context).allAreas[index].strCategory}',
                                            style: googleStyleSmall(context)
                                                .copyWith(
                                                    fontWeight:
                                                        FontWeight.w400)),
                                      ),
                                      const SizedBox(width: 10.0),
                                      Expanded(
                                        child: Text(
                                            'Area: ${AreaCubit.get(context).allAreas[index].strArea}',
                                            style: googleStyleSmall(context)
                                                .copyWith(
                                                    fontWeight:
                                                        FontWeight.w400)),
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
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          'ingredients: ',
                                          style: googleStyle(context),
                                        ),
                                        const SizedBox(height: 10.0),
                                        ListView.builder(
                                          shrinkWrap: true,
                                          physics:
                                              const NeverScrollableScrollPhysics(),
                                          itemCount: AreaCubit.get(context)
                                              .allAreas[index]
                                              .mealIngerientd!
                                              .length,
                                          itemBuilder: (context, myIndex) {
                                            return buildIngredientsItem(
                                              phoneSize(context),
                                              context,
                                              myIndex,
                                              AreaCubit.get(context)
                                                  .allAreas[index]
                                                  .mealIngerientd![myIndex]
                                                  .ingredientItem,
                                              AreaCubit.get(context)
                                                  .allAreas[index]
                                                  .mealIngerientd![myIndex]
                                                  .measure,
                                            );
                                          },
                                        ),
                                        const SizedBox(height: 30.0),
                                        Text(
                                          'Instructions: ',
                                          style: googleStyle(context),
                                        ),
                                        const SizedBox(height: 15.0),
                                        Text(
                                          AreaCubit.get(context)
                                              .allAreas[index]
                                              .strInstructions!,
                                          style: googleStyleSmall(context)
                                              .copyWith(
                                            fontWeight: FontWeight.w400,
                                            wordSpacing: 1.0,
                                            letterSpacing: 1.0,
                                          ),
                                        ),
                                      ]))
                            ],
                          )),
                        ),
                      ],
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

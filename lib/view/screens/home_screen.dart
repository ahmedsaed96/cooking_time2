import 'package:cocking_time/constant.dart';
import 'package:cocking_time/cubit/home_cubit.dart';
import 'package:cocking_time/cubit/home_states.dart';
import 'package:cocking_time/cubit/settins_cubit.dart';
import 'package:cocking_time/models/meal_model.dart';
import 'package:cocking_time/view/screens/details_screen.dart';
import 'package:cocking_time/view/screens/recommended_item_detalis.dart';
import 'package:cocking_time/view/widgets/custom_drower.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeScreen extends StatelessWidget {
  static const routeName = 'HomeScreen';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0.0,
      ),
      drawer: CustomDrawer(),
      body: BlocConsumer<HomeCubit, HomeStates>(
        listener: (context, state) {},
        builder: (context, state) => SafeArea(
          child: HomeCubit.get(context).randomMeals!.isEmpty
              ? const Center(
                  child: CircularProgressIndicator(),
                )
              : Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: SingleChildScrollView(
                    physics: const BouncingScrollPhysics(),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        BuildHeaderText(),
                        BuildTextField(),
                        Text(
                          'Today recipe',
                          style: googleStyle(context),
                        ),
                        const SizedBox(height: 10.0),
                        SizedBox(
                          height: 200.0,
                          child: ListView.builder(
                            shrinkWrap: true,
                            physics: const BouncingScrollPhysics(),
                            scrollDirection: Axis.horizontal,
                            itemCount:
                                HomeCubit.get(context).randomMeals!.length,
                            //1
                            itemBuilder: (context, index) => BuildCardItem(
                              height: phoneSize(context).height / 4,
                              width: phoneSize(context).width / 2.5,
                              recipeName: true,
                              index: index,
                              list: HomeCubit.get(context).randomMeals,
                              boxFit: BoxFit.fitHeight,
                              onTab: () {
                                return Navigator.of(context).pushNamed(
                                  DetailsScreen.routeName,
                                  arguments: {
                                    'thumb': HomeCubit.get(context)
                                        .randomMeals![index]
                                        .strMealThumb!,
                                    'index': index,
                                  },
                                );
                              },
                            ),
                          ),
                        ),
                        BuildRecommendedRow(),
                        const SizedBox(height: 10.0),
                        SizedBox(
                          height: 590.0,
                          child: HomeCubit.get(context).allMeals!.isNotEmpty
                              ? ListView.builder(
                                  physics: const NeverScrollableScrollPhysics(),
                                  itemCount: 4,
                                  // itemCount: HomeCubit.get(context).allMeals!.length,
                                  itemBuilder: (context, myIndex) => Row(
                                    children: [
                                      //2
                                      BuildCardItem(
                                        height: phoneSize(context).height / 5,
                                        width: phoneSize(context).width / 3.5,
                                        recipeName: false,
                                        index: myIndex,
                                        list: HomeCubit.get(context).allMeals,
                                        boxFit: BoxFit.fill,
                                        onTab: () {
                                          return Navigator.of(context)
                                              .pushNamed(
                                            RecommendedItemDetailsScreen
                                                .routeName,
                                            arguments: {
                                              'thumb': HomeCubit.get(context)
                                                  .allMeals![myIndex]
                                                  .strMealThumb!,
                                              'index': myIndex,
                                            },
                                          );
                                        },
                                      ),
                                      const SizedBox(width: 10.0),
                                      Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          SizedBox(
                                            width:
                                                phoneSize(context).width * 0.8 -
                                                    82,
                                            child: Text(
                                              HomeCubit.get(context)
                                                  .allMeals![myIndex]
                                                  .strMeal!,
                                              style: googleStyleSmall(context),
                                            ),
                                          ),
                                          const SizedBox(height: 10.0),
                                          Text(
                                            HomeCubit.get(context)
                                                .allMeals![myIndex]
                                                .strCategory!,
                                            style: googleStyleSmaller(context),
                                          ),
                                          const SizedBox(height: 8.0),
                                          Row(
                                            children: [
                                              Icon(
                                                Icons.watch_later,
                                                color: Colors.green[300],
                                              ),
                                              const SizedBox(width: 5.0),
                                              Text(
                                                '20 Min',
                                                style:
                                                    googleStyleSmall(context),
                                              ),
                                              const SizedBox(width: 5.0),
                                              Icon(
                                                Icons.emoji_emotions,
                                                color: Colors.orange[300],
                                              ),
                                              const SizedBox(width: 5.0),
                                              Text(
                                                'Easy',
                                                style:
                                                    googleStyleSmall(context),
                                              ),
                                            ],
                                          ),
                                        ],
                                      )
                                    ],
                                  ),
                                )
                              : const Center(
                                  child: CircularProgressIndicator(),
                                ),
                        ),
                      ],
                    ),
                  ),
                ),
        ),
      ),
    );
  }
}

class BuildRecommendedRow extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          'Recommended',
          style: googleStyle(context),
        ),
        const Spacer(),
        Text(
          'See All',
          style: googleStyleSmaller(context),
        ),
        Icon(
          Icons.arrow_forward_ios,
          size: 12.0,
          color: SettingsCubit.get(context).switchValue
              ? Colors.black
              : Colors.white,
        ),
      ],
    );
  }
}

class BuildCardItem extends StatelessWidget {
  final double? height;
  final double? width;
  final bool? recipeName;
  final int? index;
  final List<Meal>? list;
  final BoxFit boxFit;
  final Function onTab;
  const BuildCardItem({
    required this.height,
    required this.width,
    required this.recipeName,
    required this.list,
    required this.index,
    required this.boxFit,
    required this.onTab,
  });
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 10.0, bottom: 15.0),
      child: GestureDetector(
        onTap: () => onTab(),
        child: Container(
          height: height,
          width: width,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20.0),
              image: DecorationImage(
                image: NetworkImage(
                  list![index!].strMealThumb!,
                ),
                fit: boxFit,
              )),
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Column(
              children: [
                if (recipeName!)
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10.0),
                      color: Colors.black.withOpacity(0.4),
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        const SizedBox(height: 10.0),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 5.0),
                          child: Text(
                            list![index!].strMeal!,
                            style: const TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                        const SizedBox(height: 5.0),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              '30 Min ',
                              style: googleStyleSmaller(context),
                            ),
                            Container(
                              height: 20.0,
                              width: 2.0,
                              color: Colors.amber[600],
                            ),
                            Text(
                              ' Easy',
                              style: googleStyleSmaller(context),
                            ),
                          ],
                        ),
                        const SizedBox(height: 5.0),
                      ],
                    ),
                  ),
                const Spacer(),
                Align(
                  alignment: Alignment.bottomRight,
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10.0),
                      color: Colors.white.withOpacity(0.6),
                    ),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: const [
                        SizedBox(width: 5.0),
                        Icon(
                          Icons.star,
                          color: Colors.yellow,
                          size: 20.0,
                        ),
                        Text(
                          ' 4.8',
                          style: TextStyle(color: Colors.white),
                        ),
                        SizedBox(width: 10.0),
                      ],
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class BuildHeaderText extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Text(
      'What would you\n like to cook?',
      style: googleStyle(context).copyWith(fontSize: 35.0),
    );
  }
}

class BuildTextField extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 20.0),
      child: TextField(
        decoration: InputDecoration(
          enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(
                  color: SettingsCubit.get(context).switchValue
                      ? Colors.black
                      : mainColor)),
          hintText: 'Search for your query',
          hintStyle: googleStyleSmaller(context),
          focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(
                  color: SettingsCubit.get(context).switchValue
                      ? Colors.black
                      : mainColor)),
          prefixIcon: Icon(Icons.search,
              color: SettingsCubit.get(context).switchValue
                  ? Colors.black
                  : Colors.white),
        ),
      ),
    );
  }
}

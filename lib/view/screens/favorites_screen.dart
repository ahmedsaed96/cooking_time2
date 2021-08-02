import 'package:cocking_time/constant.dart';
import 'package:cocking_time/cubit/favorite_cubit.dart';
import 'package:cocking_time/cubit/favorite_state.dart';
import 'package:cocking_time/cubit/settins_cubit.dart';
import 'package:cocking_time/local/shared_prefrences.dart';
import 'package:cocking_time/models/meal_model.dart';
import 'package:cocking_time/view/widgets/custom_drower.dart';
import 'package:cocking_time/view/widgets/functions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class FavoritesScreen extends StatelessWidget {
  static const routeName = 'FavoritesScreen';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(context: context),
      drawer: CustomDrawer(),
      body: BlocConsumer<FavoriteCubit, FavoriteStates>(
        listener: (context, state) {},
        builder: (context, state) {
          final fav = FavoriteCubit.get(context).favoriteList;
          return SafeArea(
            child: fav.isNotEmpty
                ? ListView.separated(
                    physics: const BouncingScrollPhysics(),
                    itemBuilder: (context, index) => buildListItem(
                        fav, index, context, FavoriteCubit.get(context)),
                    itemCount: fav.length,
                    separatorBuilder: (BuildContext context, int index) =>
                        const SizedBox(height: 10.0),
                  )
                : Center(
                    child: Text(
                      'No favorites item!!',
                      style: googleStyleSmall(context),
                    ),
                  ),
          );
        },
      ),
    );
  }

  Card buildListItem(List<Meal> favoriteList, int index, BuildContext context,
      FavoriteCubit favoriteCubit) {
    return Card(
      child: Container(
        width: 100.0,
        padding: const EdgeInsets.only(top: 10.0),
        color: MySharedPrefrences.getString(key: 'mode') == 'true'
            ? Colors.white
            : Colors.grey[600],
        child: Row(
          children: [
            buildCategoryImage(favoriteList, index, context),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  width: phoneSize(context).width / 1.5,
                  child: Text(
                    favoriteList[index].strMeal!.toString(),
                    style: googleStyleSmall(context)
                        .copyWith(fontWeight: FontWeight.w400),
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
                const SizedBox(height: 20.0),
                SizedBox(
                  width: phoneSize(context).width / 1.5,
                  child: Row(
                    children: [
                      Text(favoriteList[index].strCategory!,
                          style: googleStyleSmaller(context)
                              .copyWith(color: Colors.blue)),
                      const SizedBox(width: 30.0),
                      Text(favoriteList[index].strArea!,
                          style: googleStyleSmaller(context)
                              .copyWith(color: Colors.blue)),
                      const Spacer(),
                      Padding(
                        padding: const EdgeInsets.only(right: 8.0),
                        child: IconButton(
                          icon: Icon(
                            Icons.favorite,
                            color: mainColor,
                          ),
                          onPressed: () {
                            favoriteCubit.deleteFromFavoriteList(
                                context, index);
                          },
                        ),
                      )
                    ],
                  ),
                )
              ],
            )
          ],
        ),
      ),
    );
  }

  Container buildCategoryImage(
      List<Meal> favoriteList, int index, BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(right: 10.0),
      height: phoneSize(context).width / 3.7,
      width: phoneSize(context).width / 3.7,
      foregroundDecoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20.0),
          image: DecorationImage(
            image: NetworkImage(
              favoriteList[index].strMealThumb!,
            ),
            fit: BoxFit.fitHeight,
          )),
    );
  }
}

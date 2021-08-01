import 'package:cocking_time/cubit/favorite_cubit.dart';
import 'package:cocking_time/cubit/home_cubit.dart';
import 'package:flutter/material.dart';

import '../../constant.dart';

SizedBox coloredListBuilder(BuildContext context) {
  return SizedBox(
    height: 100.0,
    child: ListView(
      physics: const NeverScrollableScrollPhysics(),
      scrollDirection: Axis.horizontal,
      children: [
        coloredCardItem(
          context: context,
          icon: Icons.alarm,
          text: '40 MIN',
          iconAndTextColor: const Color(0xFF59B884),
          backGroudColor: const Color(0xFFDDF1E6),
        ),
        coloredCardItem(
          context: context,
          icon: Icons.emoji_emotions,
          text: 'MEDIUM',
          iconAndTextColor: const Color(0xFFFBB148),
          backGroudColor: const Color(0xFFFEEFDA),
        ),
        coloredCardItem(
          context: context,
          icon: Icons.fire_hydrant,
          text: '300\n cal/serving',
          iconAndTextColor: const Color(0xFF81B1DF),
          backGroudColor: const Color(0xFFE7EFFA),
        ),
      ],
    ),
  );
}

Padding coloredCardItem({
  BuildContext? context,
  IconData? icon,
  String? text,
  Color? backGroudColor,
  Color? iconAndTextColor,
  Color? textColor,
}) {
  return Padding(
    padding: const EdgeInsets.only(left: 11.0),
    child: Container(
      height: phoneSize(context!).height / 5.5,
      width: phoneSize(context).width / 3.4,
      decoration: BoxDecoration(
        color: backGroudColor,
        borderRadius: BorderRadius.circular(15.0),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            icon,
            size: 60.0,
            color: iconAndTextColor,
          ),
          const SizedBox(height: 5.0),
          Text(
            text!,
            style: googleStyleSmaller(context).copyWith(
              fontWeight: FontWeight.bold,
              color: iconAndTextColor,
              // color: const Color(0xFF59B884),
            ),
            textAlign: TextAlign.center,
          )
        ],
      ),
    ),
  );
}

Align buildAppbarDetais(BuildContext context, HomeCubit cubit, int index) {
  //Not app bar exactly
  return Align(
    alignment: Alignment.topCenter,
    child: Padding(
      padding: const EdgeInsets.only(top: 20.0, right: 20.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          IconButton(
            onPressed: () => Navigator.pop(context),
            icon: const Icon(
              Icons.arrow_back,
              color: Colors.orange,
              size: 40.0,
            ),
          ),
          Container(
            height: 40.0,
            width: 40.0,
            decoration: const BoxDecoration(
              color: Colors.white,
              shape: BoxShape.circle,
            ),
            child: IconButton(
              tooltip: 'Add To Favorite',
              icon: buildFavoriteIcon(context, cubit, index),
              onPressed: () {
                cubit.addOrDeleteFromFav(context, cubit, index);
              },
            ),
          ),
        ],
      ),
    ),
  );
}

Icon buildFavoriteIcon(
  BuildContext context,
  HomeCubit cubit,
  int index,
) {
  return Icon(
    // ignore: iterable_contains_unrelated_type
    FavoriteCubit.get(context)
                .favoriteList
                .contains(cubit.randomMeals![index]) ||
            FavoriteCubit.get(context)
                .favoriteList
                .contains(cubit.randomMeals![index])
        ? Icons.bookmark
        : Icons.bookmark_outline,
    color: mainColor,
    size: 25.0,
  );
}

AppBar buildAppBar({String appBarTittle = 'Favorites', BuildContext? context}) {
  return AppBar(
    title: Text(
      appBarTittle,
      style: googleStyleSmall(context),
    ),
    centerTitle: true,
  );
}

import 'package:cocking_time/constant.dart';
import 'package:cocking_time/cubit/area_cubit.dart';
import 'package:cocking_time/cubit/category_cubit.dart';
import 'package:cocking_time/local/shared_prefrences.dart';
import 'package:cocking_time/view/screens/area_meal_details.dart';
import 'package:cocking_time/view/screens/category_meal_details.dart';
import 'package:cocking_time/view/widgets/custom_drower.dart';
import 'package:flutter/material.dart';

class CategoryDetails extends StatelessWidget {
  static const routeName = 'CategoryDetails';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: CustomDrawer(),
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0.0,
      ),
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.network(
              CategoryCubit.get(context).firstItemInDropDown == 'Category'
                  ? CategoryCubit.get(context).imageUrlProvider
                  : CategoryCubit.get(context).areaFlag,
              fit: BoxFit.cover,
            ),
            Container(
                width: phoneSize(context).width,
                height: phoneSize(context).height / 1.9,
                decoration: BoxDecoration(
                    color: MySharedPrefrences.getString(key: 'mode') == 'true'
                        ? Colors.white
                        : Colors.blueGrey,
                    borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(30.0),
                      topRight: Radius.circular(30.0),
                    )),
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      const SizedBox(height: 10.0),
                      ListView.builder(
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        itemBuilder: (ctx, index) => GestureDetector(
                          onTap: () {
                            CategoryCubit.get(context).firstItemInDropDown ==
                                    'Category'
                                ? Navigator.of(context).pushNamed(
                                    CategoryMealDetails.routeName,
                                    arguments: {
                                        'thumb': CategoryCubit.get(context)
                                            .listOfCategoryItems[index]
                                            .strMealThumb,
                                        'index': index,
                                      })
                                : Navigator.of(context).pushNamed(
                                    AreaMealDetails.routeName,
                                    arguments: {
                                        'thumb': AreaCubit.get(context)
                                            .allAreas[index]
                                            .strMealThumb,
                                        'index': index,
                                      });
                          },
                          child: Card(
                            color: MySharedPrefrences.getString(key: 'mode') ==
                                    'true'
                                ? Colors.white
                                : Colors.blueGrey.shade600,
                            child: Row(
                              children: [
                                Container(
                                  padding: const EdgeInsets.only(right: 10.0),
                                  height: phoneSize(context).height / 5.3,
                                  width: phoneSize(context).width / 2.3,
                                  decoration: BoxDecoration(
                                      image: DecorationImage(
                                          fit: BoxFit.fitHeight,
                                          image: NetworkImage(
                                            CategoryCubit.get(context)
                                                        .firstItemInDropDown ==
                                                    'Category'
                                                ? CategoryCubit.get(context)
                                                    .listOfCategoryItems[index]
                                                    .strMealThumb!
                                                : AreaCubit.get(context)
                                                    .allAreas[index]
                                                    .strMealThumb!,
                                          )),
                                      borderRadius:
                                          BorderRadius.circular(30.0)),
                                ),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Container(
                                      padding:
                                          const EdgeInsets.only(bottom: 10.0),
                                      height:
                                          phoneSize(context).height / 6 - 50,
                                      width: phoneSize(context).width / 2 - 10,
                                      child: Expanded(
                                        child: Text(
                                          CategoryCubit.get(context)
                                                      .firstItemInDropDown ==
                                                  'Category'
                                              ? CategoryCubit.get(context)
                                                  .listOfCategoryItems[index]
                                                  .strMeal!
                                              : AreaCubit.get(context)
                                                  .allAreas[index]
                                                  .strMeal!,
                                          style: googleStyleSmall(context),
                                          maxLines: 3,
                                          overflow: TextOverflow.ellipsis,
                                        ),
                                      ),
                                    ),
                                    SizedBox(
                                      width: phoneSize(context).width / 2 - 10,
                                      child: Text(
                                        CategoryCubit.get(context)
                                                    .firstItemInDropDown ==
                                                'Category'
                                            ? CategoryCubit.get(context)
                                                .listOfCategoryItems[index]
                                                .strArea!
                                            : AreaCubit.get(context)
                                                .allAreas[index]
                                                .strArea!,
                                        style: googleStyleSmall(context),
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ),
                        itemCount:
                            CategoryCubit.get(context).firstItemInDropDown ==
                                    'Category'
                                ? CategoryCubit.get(context)
                                    .listOfCategoryItems
                                    .length
                                : AreaCubit.get(context).allAreas.length,
                      ),
                    ],
                  ),
                ))
          ],
        ),
      ),
    );
  }
}

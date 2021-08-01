import 'package:cocking_time/constant.dart';
import 'package:cocking_time/cubit/area_cubit.dart';
import 'package:cocking_time/cubit/category_cubit.dart';
import 'package:cocking_time/view/widgets/custom_drower.dart';
import 'package:flutter/material.dart';

class CategoryMealDetails extends StatelessWidget {
  static const routeName = 'CategoryMealDetails';
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
                decoration: const BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(30.0),
                      topRight: Radius.circular(30.0),
                    )),
                child: ListView.builder(
                  itemBuilder: (ctx, index) => Card(
                    //TODO:add on pressed here
                    child: Row(
                      children: [
                        Container(
                          padding: const EdgeInsets.only(right: 10.0),
                          height: phoneSize(context).height / 5,
                          width: phoneSize(context).width / 2,
                          decoration: BoxDecoration(
                              image: DecorationImage(
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
                              borderRadius: BorderRadius.circular(65.0)),
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              padding: const EdgeInsets.only(bottom: 10.0),
                              height: phoneSize(context).height / 6 - 50,
                              width: phoneSize(context).width / 2 - 10,
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
                                style: const TextStyle(
                                    fontWeight: FontWeight.w400),
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
                                style: const TextStyle(
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  itemCount: CategoryCubit.get(context).firstItemInDropDown ==
                          'Category'
                      ? CategoryCubit.get(context).listOfCategoryItems.length
                      : AreaCubit.get(context).allAreas.length,
                ))
          ],
        ),
      ),
    );
  }
}

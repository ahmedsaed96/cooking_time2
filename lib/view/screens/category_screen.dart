import 'package:cocking_time/constant.dart';
import 'package:cocking_time/cubit/area_cubit.dart';

import 'package:cocking_time/cubit/category_cubit.dart';
import 'package:cocking_time/cubit/category_states.dart';
import 'package:cocking_time/cubit/home_cubit.dart';

import 'package:cocking_time/view/widgets/custom_drower.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'category_details_screen.dart';

class CategoryScreen extends StatelessWidget {
  static const routeName = 'CategoryScreen';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildCategoryAppBar(context),
      drawer: CustomDrawer(),
      body: SafeArea(
        child: BlocConsumer<CategoryCubit, CategoryStates>(
          listener: (context, state) {},
          builder: (context, state) => GridView.builder(
            physics: const BouncingScrollPhysics(),
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              crossAxisSpacing: 10.0,
              mainAxisSpacing: 10.0,
            ),
            itemBuilder: (context, index) {
              return Container(
                padding: const EdgeInsets.only(left: 10.0),
                height: phoneSize(context).height / 3.7,
                width: phoneSize(context).width,
                child: todayRecipeCard(
                  size: phoneSize(context),
                  height: 30.0,
                  width: 160,
                  imageUrl: CategoryCubit.get(context).firstItemInDropDown ==
                          'Category'
                      ? CategoryCubit.get(context)
                          .categoryList[index]
                          .strCategoryThumb
                      : CategoryCubit.get(context).categoryFlag[index],
                  nameofrecipe:
                      CategoryCubit.get(context).firstItemInDropDown ==
                              'Category'
                          ? CategoryCubit.get(context)
                              .categoryList[index]
                              .strCategory
                          : AreaCubit.get(context).allArea[index].strArea,
                  onTap: () {
                    if (CategoryCubit.get(context).firstItemInDropDown ==
                        'Category') {
                      CategoryCubit.get(context).imageUrlProvider =
                          CategoryCubit.get(context)
                              .categoryList[index]
                              .strCategoryThumb!;
                      CategoryCubit.get(context).listOfCategoryItems =
                          HomeCubit.get(context).listOfCategorItems(
                              CategoryCubit.get(context)
                                  .categoryList[index]
                                  .strCategory!);
                      return Navigator.of(context)
                          .pushNamed(CategoryDetails.routeName);
                    } else {
                      CategoryCubit.get(context).areaFlag =
                          CategoryCubit.get(context).categoryFlag[index];
                    }
                    AreaCubit.get(context).allAreas = HomeCubit.get(context)
                        .listOfAreaItems(
                            AreaCubit.get(context).allArea[index].strArea!)!;
                    return Navigator.of(context)
                        .pushNamed(CategoryDetails.routeName);
                  },
                  //
                ),
              );
            },
            itemCount:
                CategoryCubit.get(context).firstItemInDropDown == 'Category'
                    ? CategoryCubit.get(context).categoryList.length
                    : AreaCubit.get(context).allArea.length,
          ),
        ),
      ),
    );
  }

  AppBar buildCategoryAppBar(BuildContext context) {
    return AppBar(
      centerTitle: true,
      title: Text(
        'Select Meal by',
        style: googleStyleSmaller(context),
      ),
      actions: [
        Padding(
          padding: const EdgeInsets.only(right: 18.0),
          child: Row(
            children: [
              DropdownButton(
                icon: const Icon(Icons.arrow_downward),
                iconSize: 24,
                elevation: 16,
                style: const TextStyle(color: Colors.black87),
                underline: Container(
                  height: 2,
                  color: Colors.orange[300],
                ),
                value: CategoryCubit.get(context).firstItemInDropDown,
                items: CategoryCubit.get(context).listDropDown
                    as List<DropdownMenuItem<String>>?,
                onChanged: (String? val) {
                  CategoryCubit.get(context).changeDropDownMenu(val!);
                },
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget todayRecipeCard(
      {Size? size,
      String? imageUrl,
      String? nameofrecipe,
      Function? onTap,
      double height = 70.0,
      double width = 150.0}) {
    return GestureDetector(
      onTap: () => onTap!(),
      child: Container(
        padding: const EdgeInsets.only(bottom: 10.0),
        margin: const EdgeInsets.only(right: 15),
        width: size!.width / 2.1,
        height: size.height / 3.5,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10.0),
          color: Colors.grey,
          image: DecorationImage(
            image: NetworkImage(imageUrl!),
            fit: BoxFit.cover,
          ),
        ),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                height: height,
                width: width,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10.0),
                  color: const Color.fromRGBO(89, 82, 90, 0.5),
                ),
                child: Text(
                  nameofrecipe!,
                  style: const TextStyle(
                      fontSize: 19.0,
                      fontWeight: FontWeight.w400,
                      color: Colors.white),
                  textAlign: TextAlign.center,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

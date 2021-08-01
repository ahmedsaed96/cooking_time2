import 'dart:convert';

import 'package:bloc/bloc.dart';

import 'package:cocking_time/models/meal_model.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'favorite_cubit.dart';
import 'home_states.dart';

class HomeCubit extends Cubit<HomeStates> {
  Uri url = Uri.parse('https://www.themealdb.com/api/json/v1/1/search.php?f=f');
  Uri randomMealUrl =
      Uri.parse('https://www.themealdb.com/api/json/v1/1/random.php');

  HomeCubit() : super(HomeInitialState());
  static HomeCubit get(BuildContext context) => BlocProvider.of(context);
  List<Meal>? allMeals = [];
  List<Meal> listOfCategorItems(String category) {
    final List<Meal> myList = [];
    for (final item in allMeals!) {
      if (item.strCategory == category) {
        myList.add(item);
      }
    }
    emit(HomegetlistOfCategorItemsSuccess());
    return myList;
  }

  //main func
  Future<void> loadMeals() async {
    try {
      final http.Response response = await http.get(url);
      if (response.statusCode == 200) {
        final meal = json.decode(response.body);
        allMeals = toListOfMeal(meal['meals'] as List<dynamic>);
      }
      emit(HomegetloadMealsSuccess());
    } catch (e) {
      debugPrint('error from loadMeals Func =$e');
      emit(HomegetloadMealsErorr());
    }
  }

  List<Meal>? listOfCatergoryItems(String category) {
    final List<Meal> categorListItems = [];
    try {
      for (final Meal item in allMeals!) {
        if (item.strCategory == category) {
          categorListItems.add(item);
        }
      }
      emit(HomelistOfCatergoryItemsSuccess());
    } catch (e) {
      debugPrint('error from listOfCatergoryItems Func =$e');
      emit(HomelistOfCatergoryItemsErorr());
    }
    return categorListItems;
  }

  List<Meal>? listOfAreaItems(String area) {
    final List<Meal> areaListItems = [];
    try {
      for (final item in allMeals!) {
        if (item.strArea == area) {
          areaListItems.add(item);
        }
      }
      emit(HomelistOfAreaItemsSuccess());
    } catch (e) {
      debugPrint('error from listOfAreaItems Func =$e');
      emit(HomelistOfAreaItemsErorr());
    }

    return areaListItems;
  }

  List<Meal> toListOfMeal(List<dynamic> myList) {
    List<Meal> mealsList = [];
    // ignore: join_return_with_assignment
    mealsList =
        myList.map((e) => Meal.fromJson(e as Map<String, dynamic>)).toList();
    return mealsList;
  }

  List<Meal>? randomMeals = [];
  Future getRandomMeal() async {
    try {
      final http.Response response = await http.get(randomMealUrl);
      if (response.statusCode == 200) {
        final meal = json.decode(response.body);
        final mealItem = toListOfMeal(meal['meals'] as List<dynamic>);
        if (!randomMeals!.contains(mealItem.first)) {
          randomMeals!.add(mealItem.first);
        }
      }
    } catch (e) {
      debugPrint('error from getRandomMeal Func =$e');
      emit(HomegetRandomMealErorr());
    }
  }

  //get list of random meals
  void getRandomMeals() {
    for (var i = 0; i < 15; i++) {
      getRandomMeal();
      debugPrint(randomMeals!.toString());
    }
    emit(HomegetRandomMealSuccess());
  }

//   List<Ingredient>? ingredients = [];
//   void listOfIngredients(){
// }
  void addOrDeleteFromFav(
      BuildContext context, HomeCubit cubit, int index, Meal item) {
    try {
      FavoriteCubit.get(context).favoriteList.contains(item)
          ? FavoriteCubit.get(context).favoriteList.remove(item)
          : FavoriteCubit.get(context).favoriteList.add(item);
      emit(HomegetaddOrDeleteFromFavSuccess());
    } on Exception catch (e) {
      emit(HomegetaddOrDeleteFromFavErorr());
      debugPrint('error from addOrDeleteFromFav Func = $e');
    }
  }
}

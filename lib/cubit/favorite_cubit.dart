import 'package:bloc/bloc.dart';
import 'package:cocking_time/cubit/favorite_state.dart';
import 'package:cocking_time/models/meal_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class FavoriteCubit extends Cubit<FavoriteStates> {
  FavoriteCubit() : super(FavoriteInitialState());
  static FavoriteCubit get(BuildContext context) => BlocProvider.of(context);
  List<Meal> favoriteList = [];
  void deleteFromFavoriteList(BuildContext context, int index) {
    try {
      favoriteList.remove(favoriteList[index]);
      emit(FavoritedeleteFromFavoriteListSuccess());
    } on Exception catch (e) {
      emit(FavoritedeleteFromFavoriteListErorr());
      debugPrint('erorr from deleteFromFavoriteList Func $e');
    }
  }
}

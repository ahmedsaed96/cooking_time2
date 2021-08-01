import 'dart:convert';

import 'package:bloc/bloc.dart';
import 'package:cocking_time/cubit/area_states.dart';
import 'package:cocking_time/models/area_model.dart';
import 'package:cocking_time/models/meal_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:http/http.dart' as http;

class AreaCubit extends Cubit<AreaStates> {
  AreaCubit() : super(AreaInitislState());
  static AreaCubit get(BuildContext context) => BlocProvider.of(context);
  List<AreaModel> allArea = [];
  List<Meal> allAreas = []; //this list contains all meals filterd by area.

  Uri areaUrl =
      Uri.parse('https://www.themealdb.com/api/json/v1/1/list.php?a=list');
  List<AreaModel> convertListOfAreatoItem(List<dynamic> list) {
    List<AreaModel> allArea = [];
    // ignore: join_return_with_assignment
    allArea =
        list.map((e) => AreaModel.fromJson(e as Map<String, dynamic>)).toList();
    return allArea;
  }

//this function work good
//محتاج اعرف هستدعيها فين
//هستدعيها مع الكيوبيت نفسه
  Future loadAllArea() async {
    try {
      final http.Response response = await http.get(areaUrl);
      if (response.statusCode == 200) {
        final item = json.decode(response.body);
        allArea = convertListOfAreatoItem(item['meals'] as List<dynamic>);
        emit(ArealoadAllAreaSuccess());
      }
    } catch (e) {
      emit(ArealoadAllAreaErorr());
      debugPrint('error from loadAllArea Func =$e');
    }
  }
}

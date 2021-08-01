import 'package:bloc/bloc.dart';
import 'package:cocking_time/cubit/settings_states.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SettingsCubit extends Cubit<SettingsStates> {
  SettingsCubit() : super(SettingsIntialState());
  static SettingsCubit get(BuildContext context) => BlocProvider.of(context);
  bool switchValue = true;
  // ignore: type_annotate_public_apis
  // ignore: avoid_positional_boolean_parameters
  changeTheme(bool val) {
    try {
      switchValue = val;
      emit(SettingschangeThemeSuccess());
      debugPrint('light mode is $switchValue');
    } on Exception catch (e) {
      emit(SettingschangeThemeErorr());
      debugPrint('erorr from changeTheme Func = $e');
    }
  }
}

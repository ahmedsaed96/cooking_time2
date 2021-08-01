// import 'package:cocking_time/dio_helper/dio_helper.dart';
import 'package:cocking_time/constant.dart';
import 'package:cocking_time/cubit/area_cubit.dart';
import 'package:cocking_time/cubit/bloc_observer.dart';
import 'package:cocking_time/cubit/category_cubit.dart';
import 'package:cocking_time/cubit/favorite_cubit.dart';
import 'package:cocking_time/cubit/home_cubit.dart';
import 'package:cocking_time/cubit/settings_states.dart';
import 'package:cocking_time/cubit/settins_cubit.dart';
import 'package:cocking_time/view/screens/about_us_screen.dart';
import 'package:cocking_time/view/screens/category_meal_details_screen.dart';
import 'package:cocking_time/view/screens/category_screen.dart';
import 'package:cocking_time/view/screens/details_screen.dart';
import 'package:cocking_time/view/screens/favorites_screen.dart';
import 'package:cocking_time/view/screens/home_screen.dart';
import 'package:cocking_time/view/screens/recommended_item_detalis.dart';
import 'package:cocking_time/view/screens/settings_screen.dart';
import 'package:cocking_time/view/widgets/custom_drower.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

//اظبط خطوط الوضع المظلم
// اخلص الاعدادات بتاعة التطبيق ان امكن
// اخلص اخر صفحة(عنا)واخليه يبعتلي ايميل عن طريقها
void main() {
  // DioHelper.init();
  Bloc.observer = MyBlocObserver();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => HomeCubit()
            ..getRandomMeals()
            ..loadMeals(),
        ),
        BlocProvider(
          create: (context) => CategoryCubit()..loadCategories(),
        ),
        BlocProvider(
          create: (context) => AreaCubit()..loadAllArea(),
        ),
        BlocProvider(
          create: (context) => FavoriteCubit(),
        ),
        BlocProvider(
          create: (context) => SettingsCubit(),
        ),
      ],
      child: BlocConsumer<SettingsCubit, SettingsStates>(
        listener: (context, state) {},
        builder: (context, state) => MaterialApp(
          routes: {
            DetailsScreen.routeName: (context) => DetailsScreen(),
            HomeScreen.routeName: (context) => HomeScreen(),
            SettingaScreen.routeName: (context) => SettingaScreen(),
            FavoritesScreen.routeName: (context) => FavoritesScreen(),
            CategoryScreen.routeName: (context) => CategoryScreen(),
            AboutUsScreen.routeName: (context) => AboutUsScreen(),
            RecommendedItemDetailsScreen.routeName: (context) =>
                RecommendedItemDetailsScreen(),
            CategoryMealDetails.routeName: (context) => CategoryMealDetails(),
          },
          debugShowCheckedModeBanner: false,
          theme: lightTheme,
          darkTheme: darkTheme,
          // themeMode: ThemeMode.light,
          themeMode: SettingsCubit.get(context).switchValue
              ? ThemeMode.light
              : ThemeMode.dark,
          title: 'Cooking Time',
          home: Scaffold(
            drawer: CustomDrawer(),
            body: HomeScreen(),
          ),
        ),
      ),
    );
  }
}

// import 'dio_helper/dio_helper.dart';
import 'package:cocking_time/view/screens/area_meal_details.dart';
import 'package:cocking_time/view/screens/category_details_screen.dart';
import 'package:cocking_time/view/screens/category_meal_details.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'constant.dart';
import 'cubit/area_cubit.dart';
import 'cubit/bloc_observer.dart';
import 'cubit/category_cubit.dart';
import 'cubit/favorite_cubit.dart';
import 'cubit/home_cubit.dart';
import 'cubit/settings_states.dart';
import 'cubit/settins_cubit.dart';
import 'local/shared_prefrences.dart';
import 'view/screens/about_us_screen.dart';
import 'view/screens/category_screen.dart';
import 'view/screens/details_screen.dart';
import 'view/screens/favorites_screen.dart';
import 'view/screens/home_screen.dart';
import 'view/screens/recommended_item_detalis.dart';
import 'view/screens/settings_screen.dart';
import 'view/widgets/custom_drower.dart';

// ignore: avoid_void_async
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  Bloc.observer = MyBlocObserver();
  await MySharedPrefrences.init();
  MySharedPrefrences.getString(key: 'mode');
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
            CategoryDetails.routeName: (context) => CategoryDetails(),
            CategoryMealDetails.routeName: (context) => CategoryMealDetails(),
            AreaMealDetails.routeName: (context) => AreaMealDetails(),
          },
          debugShowCheckedModeBanner: false,
          theme: lightTheme,
          darkTheme: darkTheme,
          themeMode: MySharedPrefrences.getString(key: 'mode') == 'true'
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

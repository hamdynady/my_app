import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:myapp/layout/news_app/cubit/newscubit.dart';
import 'package:myapp/modules/shop_app/onboarding/onboarding_screen.dart';
import 'package:myapp/shared/bloc_observer.dart';
import 'package:myapp/shared/cubit/cubit.dart';
import 'package:myapp/shared/cubit/states.dart';
import 'package:myapp/shared/network/local/cache_helpper.dart';
import 'package:myapp/shared/network/remote/dio_helpper.dart';
import 'package:myapp/shared/styles/themes.dart';


void main() async
{
  WidgetsFlutterBinding.ensureInitialized();

  Bloc.observer = MyBlocObserver();
  DioHelpper.init();
  await CacheHelpper.init();

  bool isDark = CacheHelpper.getData(key: 'isDark');

  runApp(MyApp(isDark));
}

class MyApp extends StatelessWidget {

  final bool isDark;
  MyApp(this.isDark);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
        providers: [
          BlocProvider(
              create: (context) =>  NewsCubit()..getBusinessData()..getScienceData()..getSportsData(),
          ),
          BlocProvider(
              create: (context) => AppCubit()..changeThemeMode(
                fromShared: isDark,
          ),),
        ],
        child: BlocConsumer<AppCubit, AppState>(
          listener: (context, state) {},
          builder: (context, state) {
            return MaterialApp(
              debugShowCheckedModeBanner: false,
              title: 'Flutter Demo',
              theme: lightTheme,
              darkTheme: darkTheme,
              themeMode: AppCubit.get(context).isDark ? ThemeMode.dark : ThemeMode.light,
              home:  OnBoardingScreen(),

            );
          },
        )
    );


  }
}

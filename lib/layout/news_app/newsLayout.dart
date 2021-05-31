import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:myapp/modules/news_app/search/search_screen.dart';
import 'package:myapp/shared/component/components.dart';
import 'package:myapp/shared/cubit/cubit.dart';
import 'cubit/newsStates.dart';
import 'cubit/newscubit.dart';

class NewsLayout extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<NewsCubit, NewsStates>(
          listener: (context, state){},
          builder: (context, state) {
            var cubit =NewsCubit.get(context);
            return Scaffold(
              appBar: AppBar(
                title: Text('News App'),
                centerTitle: true,
                elevation: 0,
                actions: [
                  IconButton(
                      icon: Icon(Icons.search),
                      onPressed:(){
                        navigateTo(context, SearchScreen());
                      }
                  ),
                  IconButton(
                      icon: Icon(
                          Icons.brightness_medium_outlined
                      ),
                      onPressed: (){
                        AppCubit.get(context).changeThemeMode();
                      }
                  )
                ],
              ),
              body: cubit.screens[cubit.currentIndex],
              bottomNavigationBar: BottomNavigationBar(
                items: cubit.bottomItems,
                onTap: (index){
                 cubit.changeBottomNavBar(index);
                },
                currentIndex: cubit.currentIndex,
              ),
            );
          },

    );

  }
}

import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:myapp/layout/news_app/cubit/newsStates.dart';
import 'package:myapp/modules/news_app/business/business_screen.dart';
import 'package:myapp/modules/news_app/science/science_screen.dart';
import 'package:myapp/modules/news_app/settings/settings_screen.dart';
import 'package:myapp/modules/news_app/sports/sport_screen.dart';
import 'package:myapp/shared/network/remote/dio_helpper.dart';

class NewsCubit extends Cubit<NewsStates>
{
  NewsCubit() : super(NewsInitialState());
  static NewsCubit get(context) => BlocProvider.of(context);

  int currentIndex = 0;

  List<BottomNavigationBarItem> bottomItems =[
    BottomNavigationBarItem(
        icon: Icon(Icons.business),
        label: 'Business'
    ),
    BottomNavigationBarItem(
        icon: Icon(Icons.science),
        label: 'Science'
    ),
    BottomNavigationBarItem(
        icon: Icon(Icons.sports),
        label: 'Sports'
    ),
    BottomNavigationBarItem(
        icon: Icon(Icons.settings),
        label: 'Settings'
    ),
  ];

  List<Widget> screens = [
      BusinessScreen(),
      ScienceScreen(),
      SportsScreen(),
      SettingsScreen(),
  ];

  void changeBottomNavBar(int index){
    currentIndex = index;
    emit(NewsBottomNavState());
  }

  List <dynamic> business = [];
  void getBusinessData(){
    emit(NewsGetBusinessLoadingState());
    if(business.length == 0) {
      DioHelpper.getData(
          url: 'v2/top-headlines',
          query: {
            'country': 'eg',
            'category': 'business',
            'apiKey': 'c4a29d93cd01437faebb6e97bf79afc9',
          }).then((value)
          {
            business = value.data['articles'];
            print(business[0]['title']);
            emit(GetBusinessSuccessState());
          }).catchError((error) {
            print(error.toString());
            emit(GetBusinessErrorState(error.toString()));
      });
    }
    else
      emit(GetBusinessSuccessState());

  }

  List <dynamic> science = [];
  void getScienceData(){
    emit(NewsGetScienceLoadingState());
   if(science.length == 0)
     {
       DioHelpper.getData(
           url:  'v2/top-headlines',
           query: {
             'country':'eg',
             'category':'science',
             'apiKey':'c4a29d93cd01437faebb6e97bf79afc9',
           }).then((value) {
         science = value.data['articles'];
         print(science[0]['title']);
         emit(GetScienceSuccessState());
       }).catchError((error){
         print(error.toString());
         emit(GetScienceErrorState(error.toString()));
       });
     }
   else{
     emit(GetScienceSuccessState());
   }
  }

  List <dynamic> sport = [];
  void getSportsData(){
    emit(NewsGetSportsLoadingState());
    if(sport.length == 0)
      {
        DioHelpper.getData(
            url:  'v2/top-headlines',
            query: {
              'country':'eg',
              'category':'sport',
              'apiKey':'c4a29d93cd01437faebb6e97bf79afc9',
            }).then((value) {
          sport = value.data['articles'];
          print(sport[0]['title']);
          emit(GetSportsSuccessState());
        }).catchError((error){
          print(error.toString());
          emit(GetSportsErrorState(error.toString()));
        });
      }
    else{
      emit(GetSportsSuccessState());
    }
  }

  List <dynamic> search = [];
  void getSearchData(String value){

      emit(NewsGetSearchLoadingState());
      search = [];
      DioHelpper.getData(
          url:  'v2/everything',
          query:
          {
            'q':'$value',
            'apiKey':'c4a29d93cd01437faebb6e97bf79afc9',
          }).then((value)
      {
        search = value.data['articles'];
        print(search[0]['title']);

        emit(GetSearchSuccessState());
      }).catchError((error)
      {
        print(error.toString());
        emit(GetSearchErrorState(error.toString()));
      });

  }

}

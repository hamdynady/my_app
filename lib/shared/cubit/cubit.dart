import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:myapp/modules/todo_app/arch_tasks/arch_tasks.dart';
import 'package:myapp/modules/todo_app/done_tasks/done_tasks.dart';
import 'package:myapp/modules/todo_app/new_tasks/new_tasks.dart';
import 'package:myapp/shared/cubit/states.dart';
import 'package:myapp/shared/network/local/cache_helpper.dart';
import 'package:sqflite/sqflite.dart';

class AppCubit extends Cubit<AppState>
{
  AppCubit() : super(AppInitiateState());
  static AppCubit get(context) => BlocProvider.of(context);


  int currentIndex = 0;
  Database database;
  bool isBottomSheetShown = false;
  IconData fabIcon = Icons.edit;

  List<Map> newTasks = [];
  List<Map> doneTasks = [];
  List<Map> archivedTasks = [];

  List <Widget> screen =[
    NewTaskScreen(),
    DoneTaskScreen(),
    ArchTaskScreen()
  ];

  List<String> title =[
    'New Task',
    'Done Tasks',
    'Archived Tasks'
  ];

  void changeIndex(int index) {
    currentIndex = index;
    emit(AppChangeBottomNavBarState());
  }


  void createDatabase() {
    openDatabase(
        'Todo',
        version: 1,
        onCreate: (database, version)
        {
          print('Data base is created');
          database.execute('CREATE TABLE tasks (id INTEGER PRIMARY KEY, title TEXT, date TEXT, time TEXT, status TEXT)'
          ).then((value)
          {
            print('table is created ');
          }).catchError((error){
            print('Error in creating table ${error.toString()}');
          });

        },
        onOpen: (database){
          getDataFromDatabase(database);

          print('Data base is opened');
        }
    ).then((value) => {
        database = value,
        emit(AppCreateDatabaseState())
    });
  }

   insertToDatabase({
    @required String title,
    @required String time,
    @required String date,
  }) async {
   database.transaction((txn)
    {
      txn.rawInsert(
          'INSERT INTO tasks(title, date, time, status) VALUES("$title","$date","$time","new")'
      )
          .then((value)
      {
        print('$value inserted successfully ');
        emit(AppInsertDatabaseState());
        getDataFromDatabase(database);

      }).catchError((error){
        print('some error here ${error.toString()}');
      });
      return null;
    });
  }


  void updateData({
    @required String status,
    @required int id,
  }) async {
    database.rawUpdate(
        'UPDATE tasks SET status = ? WHERE id = ?',
        ['$status', id],
    ).then((value) {
      getDataFromDatabase(database);
      emit(AppUpdateDatabaseState());
    });

  }

  void deleteData({
    @required int id,
  }) async {
    database.rawDelete(
          'DELETE FROM tasks WHERE id = ?', [id]
    ).then((value) {
      getDataFromDatabase(database);
      emit(AppDeleteDatabaseState());
    });

  }

  void getDataFromDatabase (database) {
    newTasks       = [];
    doneTasks      = [];
    archivedTasks  = [];

    emit(AppGetDatabaseLoadingState());

    database.rawQuery('SELECT * FROM tasks').then((value) {
        value.forEach((element) {
            if(element['status'] == 'new')
              newTasks.add(element);
            else if(element['status'] == 'done')
              doneTasks.add(element);
            else archivedTasks.add(element);
        });
      emit(AppGetDatabaseState());
    });
  }

  void changeBottomSheetState({
    @required bool isShow,
    @required IconData icon,
  }) {
    isBottomSheetShown = isShow;
    fabIcon = icon;
    emit(AppChangeBottomSheetState());
  }

  bool isDark = false;
  void changeThemeMode ({bool fromShared}){
     if(fromShared != null)
     {
       isDark = fromShared;
       emit(ChangeThemeMode());
     }
     else
     {
       isDark = !isDark;
       CacheHelpper.setData(key: 'isDark', value: isDark).then((value){
         emit(ChangeThemeMode());
       });
     }

  }

}
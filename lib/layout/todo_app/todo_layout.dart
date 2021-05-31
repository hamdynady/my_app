import 'package:conditional_builder/conditional_builder.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:myapp/shared/component/components.dart';
import 'package:myapp/shared/cubit/cubit.dart';
import 'package:myapp/shared/cubit/states.dart';



// ignore: must_be_immutable
class HomeLayout extends StatelessWidget {

  var scaffoldKey = GlobalKey<ScaffoldState>();
  var formKey = GlobalKey<FormState>();

  var titleController =   TextEditingController();
  var dateController =   TextEditingController();
  var timeController =   TextEditingController();
  var statusController =   TextEditingController();


  @override
  Widget build(BuildContext context) {

    return BlocProvider(
       create: (BuildContext context) => AppCubit()..createDatabase(),
       child: BlocConsumer<AppCubit, AppState>(
         listener: (context, state) {
           if(state is AppInsertDatabaseState)
             {
               Navigator.pop(context);
             }
         },
         builder: (context, state) {
           AppCubit cubit = AppCubit.get(context);
           return Scaffold(
             // backgroundColor: Colors.black.withBlue(70),
             // backgroundColor: Color.fromRGBO(0, 10, 150, 1),
             key: scaffoldKey,
             appBar: AppBar(
               title: Text(cubit.title[cubit.currentIndex]),
             ),
             body: Center(
               child: ConditionalBuilder(
                 condition: state is! AppGetDatabaseLoadingState,
                 builder: (context)  =>  cubit.screen[cubit.currentIndex],
                 fallback: (context) => CircularProgressIndicator(),
               ),
             ),
             floatingActionButton: FloatingActionButton(
                 onPressed: ()
                 {
                   if(cubit.isBottomSheetShown)
                   {
                     if(formKey.currentState.validate())
                     {
                       cubit.insertToDatabase(
                           title: titleController.text,
                           time: timeController.text,
                           date: dateController.text
                       );
                     }
                   }
                   else {
                     scaffoldKey.currentState.showBottomSheet(
                           (context) =>
                           Container(
                             padding: EdgeInsets.all(20),
                             color: Colors.grey[200],

                             child: Form(
                               key: formKey,
                               child: Column(
                                 mainAxisSize: MainAxisSize.min,
                                 children: [
                                   defaultTextFormField(
                                       validate: (String value){

                                         if(value.isEmpty) {
                                           return 'title con not be empty';
                                         }
                                         return null;
                                       },
                                       controller: titleController,
                                       type: TextInputType.text,
                                       label: 'Title ',
                                       prefix: Icons.title
                                   ),
                                   SizedBox(height: 10),
                                   defaultTextFormField(
                                     validate: (String value){
                                       if(value.isEmpty) {
                                         return 'date con not be empty';
                                       }
                                       return null;
                                     },
                                     onTap: (){
                                       showTimePicker(
                                           context: context,
                                           initialTime: TimeOfDay.now()
                                       ).then((value)
                                       {
                                         timeController.text = value.format(context).toString();
                                         print(value.format(context));
                                       });
                                     },
                                     controller: timeController,
                                     type: TextInputType.datetime,
                                     label: 'time',
                                     prefix: Icons.watch_later_outlined,
                                   ),
                                   SizedBox(height: 10),
                                   defaultTextFormField(
                                     validate: (String value){
                                       if(value.isEmpty) {
                                         return 'date con not be empty';
                                       }
                                       return null;
                                     },
                                     onTap: (){
                                       showDatePicker(
                                           context: context,
                                           initialDate:  DateTime.now(),
                                           firstDate:    DateTime.now(),
                                           lastDate:     DateTime.parse('2022-05-02')
                                       ).then((value) {
                                         dateController.text = DateFormat.yMMMd().format(value);
                                         print(DateFormat.yMMMd().format(value));

                                       });
                                     },
                                     controller: dateController,
                                     type: TextInputType.datetime,
                                     label: 'Date',
                                     prefix: Icons.date_range_outlined,
                                   ),
                                 ],
                               ),
                             ),
                           ),
                       elevation: 20,
                     ).closed.then((value)  {
                       cubit.changeBottomSheetState(
                           isShow: false,
                           icon: Icons.edit
                       );
                     });
                     cubit.changeBottomSheetState(
                         isShow: true,
                         icon: Icons.add
                     );

                   }
                 },
                 child: Icon(
                   cubit.fabIcon,
                 )
             ),
             bottomNavigationBar: BottomNavigationBar(
               // backgroundColor: Colors.blue.shade900,
               currentIndex: cubit.currentIndex,
               type: BottomNavigationBarType.fixed,
               onTap: (index)
               {
                 cubit.changeIndex(index);
               },
               items: [
                 BottomNavigationBarItem(
                     icon: Icon(Icons.menu),
                     label: 'Tasks'
                 ),
                 BottomNavigationBarItem(
                     icon: Icon(Icons.check_circle_outline),
                     label: 'Done'
                 ),
                 BottomNavigationBarItem(
                     icon: Icon(Icons.archive_outlined),
                     label: 'arch'
                 ),

               ],
             ),
           );
         },
      ),

    );
  }



}

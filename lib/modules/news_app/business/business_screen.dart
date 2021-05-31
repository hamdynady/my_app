import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:myapp/layout/news_app/cubit/newsStates.dart';
import 'package:myapp/layout/news_app/cubit/newscubit.dart';
import 'package:myapp/shared/component/components.dart';


class BusinessScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    var list = NewsCubit.get(context).business;
    return  BlocConsumer<NewsCubit,NewsStates>(
        listener: (context, state){} ,
        builder: (context, state){
           return articleBuilder(list, context);
        },
    );
  }
}

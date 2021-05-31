import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:myapp/layout/news_app/cubit/newsStates.dart';
import 'package:myapp/layout/news_app/cubit/newscubit.dart';
import 'package:myapp/shared/component/components.dart';

class SearchScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var searchController = TextEditingController();

    return BlocConsumer<NewsCubit, NewsStates>(
        listener: (context, state) {},
        builder: (context, state) {
          var list = NewsCubit.get(context).search;
          return Scaffold(
            appBar: AppBar(),
            body: Column(
              children: [
                Padding(
                    padding: EdgeInsets.all(20),
                    child: defaultTextFormField(
                        validate: (String value){
                          if(value.isEmpty) {
                            return 'Search is empty';
                          }
                          return null;
                        },
                        controller: searchController,
                        type: TextInputType.text,
                        label: 'Search',
                        prefix: Icons.search,
                        onchange: (value){
                          NewsCubit.get(context).getSearchData(value);
                        }

                    )
                ),
                Expanded(child: articleBuilder(list, context, isSearch: true))
              ],
            ),
          );
        },
    );
  }
}

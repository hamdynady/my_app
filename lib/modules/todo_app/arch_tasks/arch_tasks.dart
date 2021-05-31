import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:myapp/shared/component/components.dart';
import 'package:myapp/shared/cubit/cubit.dart';
import 'package:myapp/shared/cubit/states.dart';

class ArchTaskScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var tasks = AppCubit.get(context).archivedTasks;
    return BlocConsumer<AppCubit, AppState>(
        listener: (context, state){},
        builder:(context, state)
        {
          return taskBuilder(tasks: tasks);
        }
    );
  }
}

import 'package:conditional_builder/conditional_builder.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:myapp/modules/news_app/webview/webview_screen.dart';
import 'package:myapp/shared/cubit/cubit.dart';


Widget defaultbutton(
    {
      double width = double.infinity,
      Color background = Colors.blue,
      bool isUpperCase = true,
      @required Function function,
      @required  String text,

}) => Container(
  width: width,
  color: background,
  child: MaterialButton(
      onPressed: function,
      child: Text(
        isUpperCase ?  text.toLowerCase() : text,
        style: TextStyle(
            color: Colors.white,
            fontSize: 20
        ),)
  ),
);

Widget defaultTextFormField({
  Function onchange,
  Function onSubmit,
  Function onTap,
  @required Function validate,
  @required TextEditingController controller,
  @required TextInputType type,
  @required String label,
  @required IconData prefix,
  IconData suffix,
  bool isPassword = false,
  Function suffixPressed,
  bool isClickable = true,

})  =>  TextFormField(
            controller: controller,
            keyboardType: type,
            onFieldSubmitted: onSubmit,
            onChanged: onchange,
            obscureText: isPassword,
            smartDashesType: SmartDashesType.enabled,
            decoration: InputDecoration(
                  labelText: label,
                  border: OutlineInputBorder(),
                  prefixIcon: Icon(prefix),
                  suffixIcon: suffix != null ? IconButton(
                    icon: Icon(suffix),
                    onPressed: suffixPressed,
                  ) : null,
            ),
            validator: validate,
            onTap: onTap,
            enabled: isClickable,

);

Widget buildTaskItem(Map model, context) => Dismissible(
  key: Key(model['id'].toString()),
  child:   Padding(
    padding: const EdgeInsets.all(15.0),
    child: Row(
      children: [
        CircleAvatar(
          radius: 40,
          child: Padding(
            padding: const EdgeInsets.all(15.0),
            child: Text('${model['date']}'),
          ),
        ),
        SizedBox(width: 25),
        Expanded(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('${model['title']}',
                style: TextStyle(
                  fontSize: 25,
                  fontWeight: FontWeight.bold,
                ),),
              Text('${model['time']}',
                style: TextStyle(
                  fontSize: 15,
                  color: Colors.grey
                ),),
            ],
          ),
        ),
        SizedBox(width: 25),
        IconButton(
            icon: Icon(Icons.done,
                color: Colors.green
            ),
            onPressed: (){
              AppCubit.get(context).updateData(
                  status: 'done',
                  id: model['id']
              );
            }
        ),
        IconButton(
            icon: Icon(Icons.archive_outlined,
                color: Colors.black45
            ),
            onPressed: (){
              AppCubit.get(context).updateData(
                status: 'archived',
                id: model['id'],
              );
            }
        ),
      ],
    ),

  ),
  onDismissed: (direction){
    AppCubit.get(context).deleteData(id: model['id']);
  },
);

Widget taskBuilder({
  @required List<Map> tasks,
}) => ConditionalBuilder(
    condition: tasks.length > 0,
    builder:(context) => ListView.separated(
        itemBuilder: (context, index) => buildTaskItem(tasks[index], context),
        separatorBuilder: (context, index) => myDivider(),
        itemCount: tasks.length
    ),
    fallback: (context) => Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            Icons.menu,
            color: Colors.grey,
            size: 100,
          ),
          Text(
            'No tasks yet, Please add some',
            style: TextStyle(
                color: Colors.black45,
                fontSize: 18,
                fontWeight: FontWeight.bold
            ),
          )
        ],
      ),
    )
);

Widget myDivider() => Padding(
    padding: EdgeInsets.all(20),
    child: Container(
    width: double.infinity,
    color: Colors.grey,
    height: 1,
  ),
);


Widget buildArticleItem( article, context) => InkWell(
  onTap: (){
    navigateTo(context, WebViewScreen(article['url']));
  },
  child: Padding(
    padding: EdgeInsets.all(20),
    child: Row(
      children: [
        Container(
          width: 120,
          height: 120,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              image: DecorationImage(
                image: NetworkImage('${article['urlToImage']}'),
                fit: BoxFit.cover,
              )
          ),
        ),
        SizedBox(width: 20),
        Expanded(
            child: Container(
                height: 120,
                child:  Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Expanded(
                      child: Text('${article['title']}',
                        style: Theme.of(context).textTheme.bodyText1,
                        maxLines: 2 ,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                    Text('${article['publishedAt']}',
                      style: TextStyle(
                          color: Colors.grey
                      ),
                    ),
                  ],
                )
            )
        )
      ],
    ),
  ),

);


Widget articleBuilder( list, context ,{ isSearch = false}) => ConditionalBuilder(
  condition: list.length > 0,
  builder: (context)=> ListView.separated(
    physics: BouncingScrollPhysics(),
    itemBuilder:( context, index) => buildArticleItem(list[index], context),
    separatorBuilder: (context, index) => myDivider(),
    itemCount: list.length,
  ) ,
  fallback: (context) => isSearch ? Container() : Center(child: CircularProgressIndicator()),
);

void navigateTo(context, widget) => Navigator.push(
    context,
    MaterialPageRoute(
      builder: (context) => widget,
    )
);


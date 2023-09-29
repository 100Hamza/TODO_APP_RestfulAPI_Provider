import 'package:flutter/material.dart';
import 'package:todo/Presentation/Views/Home/home_view.dart';
import 'package:provider/provider.dart';
import 'package:todo/Providers/post_notes_provider.dart';

void main()
{
  runApp(const MyApp());
}


class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(create: (context) => PostNotesProvider(), child: MaterialApp(
      theme: ThemeData(
          brightness:Brightness.dark,
          primaryColor:Colors.blue
      ),
      home: HomeView(),
    ),);
  }
}

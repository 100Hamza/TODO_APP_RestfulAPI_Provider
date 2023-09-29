import 'package:flutter/material.dart';
import 'package:todo/Navigation%20Helper/navigation_helper.dart';
import 'package:todo/Presentation/Elements/custom_button.dart';
import 'package:todo/Presentation/Elements/custom_text.dart';
import 'package:todo/Presentation/Views/Add%20Notes/add_notes_view.dart';
import 'package:todo/Presentation/Views/Home/Layout/home_body.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: CustomText(
          title: 'Todo List',
        ),
        centerTitle: true,
      ),
      body: const HomeBody(),
      floatingActionButton: Padding(
        padding: const EdgeInsets.only(bottom: 10.0 , right: 5),
        child: CustomButton(onTap: (){
          NavigationHelper.pushRoute(context, AddNotesView());
        }, buttonTitle: 'Add Todo'),
        ),
      );

  }
}

import 'package:flutter/material.dart';
import 'package:todo/Presentation/Views/Add%20Notes/Layout/add_notes_body.dart';

import '../../Elements/custom_text.dart';

class AddNotesView extends StatelessWidget {
  bool isEdit;
  String? title , description , id;
  AddNotesView({super.key , this.isEdit = false , this.title, this.description , this.id});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: CustomText(
          title: isEdit? 'Update TODO' : 'Add TODO',
        ),
        centerTitle: true,
      ),
      body: AddNotesBody(isFromEdit: isEdit, description: description, title: title , id: id, ),
    );
  }
}

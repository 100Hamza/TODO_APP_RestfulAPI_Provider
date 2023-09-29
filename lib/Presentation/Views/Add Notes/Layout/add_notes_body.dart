import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo/Presentation/Elements/custom_button.dart';
import 'package:todo/Presentation/Elements/custom_text_field.dart';
import 'package:todo/Presentation/Views/Home/home_view.dart';
import 'package:todo/Providers/post_notes_provider.dart';
import 'package:todo/Services/Utillities/taost_msg.dart';

import '../../../../Navigation Helper/navigation_helper.dart';
import '../../../Elements/custom_text.dart';

class AddNotesBody extends StatefulWidget {
  bool isFromEdit;
  String? title , description , id;
  AddNotesBody({super.key, this.isFromEdit = false  ,this.title , this.description, this.id});

  @override
  State<AddNotesBody> createState() => _AddNotesBodyState();
}



class _AddNotesBodyState extends State<AddNotesBody> {

  final TextEditingController _titleController = TextEditingController();
  final TextEditingController _descriptionController = TextEditingController();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    if(widget.isFromEdit)
      {
        _titleController.text =  widget.title!;
        _descriptionController.text = widget.description!;

      }
  }

  @override
  Widget build(BuildContext context) {
    print('Title ${_titleController}');
    print('Description ${_descriptionController}');
    final postNotesProvider = Provider.of<PostNotesProvider>(context);
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: [
          SizedBox(height: MediaQuery.sizeOf(context).height * 0.03,),
          CustomEditTextField(controller: _titleController,hintText: 'TODO\'s Title',),
          SizedBox(height: MediaQuery.sizeOf(context).height * 0.03,),
          CustomEditTextField(controller: _descriptionController,hintText: 'TODO\'s Description', maxLines: 8,),
          SizedBox(height: MediaQuery.sizeOf(context).height * 0.03,),
          !widget.isFromEdit? CustomButton(onTap: (){
            postNotesProvider.addNotes(context: context,targetClass: const HomeView(),title: _titleController.text.toString() , description: _descriptionController.text.toString(), isCompleted: false);
          }, buttonTitle: 'Submit' , borderRadius: 10 , width: 1 ,isTrue: postNotesProvider.getLoading)
              :CustomButton(onTap: (){
                postNotesProvider.update(id: widget.id.toString(), context: context, targetClass: const HomeView(), title: _titleController.text.toString(), description: _descriptionController.text.toString() , isCompleted: false);
          }, buttonTitle: 'Update' , borderRadius: 10 , width: 1 ,isTrue: postNotesProvider.getLoading)
        ],
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:provider/provider.dart';
import 'package:todo/Models/GetAllNotesModel.dart';
import 'package:todo/Navigation%20Helper/navigation_helper.dart';
import 'package:todo/Presentation/Elements/alert_dialog.dart';
import 'package:todo/Presentation/Elements/custom_text.dart';
import 'package:todo/Presentation/Views/Add%20Notes/add_notes_view.dart';
import 'package:todo/Providers/post_notes_provider.dart';
import 'package:todo/Services/Utillities/taost_msg.dart';
import 'package:todo/Services/get_all_notes_api.dart';

class HomeBody extends StatefulWidget {
  const HomeBody({super.key});

  @override
  State<HomeBody> createState() => _HomeBodyState();
}

class _HomeBodyState extends State<HomeBody> with TickerProviderStateMixin {
  late final AnimationController _animationController =
      AnimationController(duration: const Duration(seconds: 3), vsync: this);

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _animationController.dispose();
  }

  GetAllNotesApi getAllNotesApi = GetAllNotesApi();

  @override
  Widget build(BuildContext context) {
    final deleteNoteProvider = Provider.of<PostNotesProvider>(context);
    return FutureBuilder(
      future: getAllNotesApi.getAllNotes(),
      builder: (context, AsyncSnapshot<GetAllNotesModel> snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          print('Connection State ?');
          return const SpinKitChasingDots(
            color: Colors.grey,
            size: 50.0,
          );
        }
        if (!snapshot.hasData) {
          print('Snapshot has data ? ${snapshot.hasData}');
          return Center(
            child: CustomText(
              title: 'No TODO\'s is Found ',
            ),
          );
        } else {
          return snapshot.data!.items!.isEmpty
              ? Center(
                  child: CustomText(
                    title: 'No TODO\'s is Found ',
                  ),
                )
              : ListView.builder(
                  itemCount: snapshot.data!.items!.length,
                  itemBuilder: (context, index) {
                    var snap = snapshot.data!.items![index];
                    return Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        children: [
                          ListTile(
                            title: Text(
                              snap.title.toString(),
                            ),
                            subtitle: Text(
                              snap.description.toString(),
                              maxLines: 2,
                              overflow: TextOverflow.ellipsis,
                            ),
                            trailing: PopupMenuButton(
                              onSelected: (value) {
                                value == 'Edit'
                                    ? NavigationHelper.pushRoute(
                                        context,
                                        AddNotesView(
                                            isEdit: true,
                                            title: snap.title.toString(),
                                            description:
                                                snap.description.toString(),
                                            id: snap.id.toString()))
                                    : showDialogAlert(onYesPress: (){
                                  deleteNoteProvider.deleteTodo(snap.id.toString());
                                  Navigator.pop(context);
                                },context: context, title: 'Notes Delete' , content: 'Do you Want to delete');
                              },
                              itemBuilder: (context) => [
                                const PopupMenuItem(
                                    child: Text('Edit'), value: 'Edit'),
                                const PopupMenuItem(
                                    child: Text('Delete'), value: 'Delete'),
                              ],
                            ),
                            leading: CircleAvatar(
                              child: Text(index.toString()),
                            ),
                          ),
                          const Divider(),
                        ],
                      ),
                    );
                  },
                );
        }
      },
    );
  }
}

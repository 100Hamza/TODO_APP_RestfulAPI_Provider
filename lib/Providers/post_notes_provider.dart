

import 'package:flutter/widgets.dart';
import 'package:http/http.dart' as http;
import 'package:todo/Navigation%20Helper/navigation_helper.dart';
import 'package:todo/Services/Utillities/app_urls.dart';
import 'package:todo/Services/Utillities/taost_msg.dart';

class PostNotesProvider with ChangeNotifier{

  bool _isLoading = false;

  bool get  getLoading => _isLoading;

  void setLoading(bool isLoading)
  {
    _isLoading = isLoading;
    notifyListeners();
  }

  void addNotes ({required BuildContext context, required Widget targetClass, required String title,required String description , required bool isCompleted}) async {
    setLoading(true);
    try{

      final response = await http.post(Uri.parse(AppUrls.postNotesUrl),
          body: {
            'title': title,
            'description': description,
            'is_completed': isCompleted.toString()
          });

      if(response.statusCode == 201)
      {
        setLoading(false);
        ToastMsg.fToastMsg('The record has been successfully updated.');
        NavigationHelper.pushRoute(context, targetClass);
      }
      else if(response.statusCode == 400)
      {
        setLoading(false);
        ToastMsg.fToastMsg('There is some client side error');
      }
      else if(response.statusCode == 429)
      {
        setLoading(false);
        ToastMsg.fToastMsg('Too many Request, Please wait atleast one minute before sending more request');
      }
      else
        {
          setLoading(false);
          ToastMsg.fToastMsg('Some thing went wrong. Please try again.');
        }
    }
    catch(e)
    {
      setLoading(false);
      ToastMsg.fToastMsg('Error occured $e');
    }
  }

  void update ({required String id, required BuildContext context, required Widget targetClass, required String title,required String description , required bool isCompleted} ) async {
    setLoading(true);
    try
        {
          final response = await http.put(Uri.parse('${AppUrls.putNotesUrl}/$id'),
              body: {
                'title': title,
                'description': description,
                'is_completed': isCompleted.toString()
              });
          if(response.statusCode == 200)
          {
            setLoading(false);
            ToastMsg.fToastMsg('The record has been successfully updated.');
            NavigationHelper.pushRoute(context, targetClass);
          }
          else if(response.statusCode == 400)
          {
            setLoading(false);
            ToastMsg.fToastMsg('There is some client side error');
          }
          else if(response.statusCode == 429)
            {
              setLoading(false);
              ToastMsg.fToastMsg('Too many Request, Please wait atleast one minute before sending more request');
            }
          else
            {
              setLoading(false);
              ToastMsg.fToastMsg('Some thing went wrong. Please try again.');
            }
        }
        catch(e)
    {
      setLoading(false);
      ToastMsg.fToastMsg('Error occurred $e');
    }

  }

  void deleteTodo(String id) async {
  try{
    final response = await http.delete(Uri.parse('${AppUrls.deleteNotesUrl}/$id'));
    if(response.statusCode == 200)
    {
      setLoading(false);
      ToastMsg.fToastMsg('The record has been successfully deleted.');
    }
    else if(response.statusCode == 400)
    {
      setLoading(false);
      ToastMsg.fToastMsg('There is some client side error');
    }
    else if(response.statusCode == 429)
    {
      setLoading(false);
      ToastMsg.fToastMsg('Too many Request, Please wait atleast one minute before sending more request');
    }
    else
    {
      setLoading(false);
      ToastMsg.fToastMsg('Some thing went wrong. Please try again.');
    }
  }
  catch(e)
  {
    setLoading(false);
    ToastMsg.fToastMsg('Error occurred $e');
  }

  }
}
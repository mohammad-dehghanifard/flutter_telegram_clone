import 'dart:io';
import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';

class ConversationRequest {
  final TextEditingController nameController = TextEditingController();
   String type = "PRIVATE";
   List<int>? participants;
   TextEditingController name = TextEditingController();
   File? image;

  String? nameValidate(String? value) {
    if(value == null || value.isEmpty){
      return 'لطفا یک نام برای گروه وارد کنید!';
    }
    return null;
  }

   Future<FormData> data() async {
    final form = FormData.fromMap(
        {
          "type" : type,
          "name" : name.text,
          if(image != null)
            "image" : await MultipartFile.fromFile(image!.path,filename: image!.path.split("/").last )
        }
    );
    participants?.forEach((element) {
      form.fields.add(MapEntry("participants[]", element.toString()));
    });
     return form;
   }


}
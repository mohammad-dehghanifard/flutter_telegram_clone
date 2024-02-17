import 'dart:io';
import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';

class ConversationRequest {
   String type = "PRIVATE";
   List<int>? participants;
   TextEditingController name = TextEditingController();
   File? image;


   Future<FormData> data() async {
     return FormData.fromMap(
       {
         "type" : type,
         "name" : name.text,
         for(var id in participants!)
           "participants[]" : id,
         if(image != null)
           "image" : await MultipartFile.fromFile(image!.path,filename: image!.path.split("/").last )

       }
     );
   }


}
import 'dart:convert';

import 'package:http/http.dart' as http ;

class DataServices{
  String baseUrl = "http://mark.bslmeiyu.com/api";



 getInfo() async {
   var apiurl='/getplaces';
    http.Response res = await http.get(Uri.parse(baseUrl+apiurl));
    try{
      if (res.statusCode==200){
        List<dynamic> list =json.decode(res.body); 
      }

    }catch(e){
      print(e);

    }


 }



}
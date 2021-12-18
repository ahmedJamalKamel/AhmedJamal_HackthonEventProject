import 'dart:convert';
import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:hakathon_redy/Model/category.dart';
import 'package:hakathon_redy/Model/event.dart';
import 'package:hakathon_redy/helpers/helpers.dart';
import 'package:hakathon_redy/prefs/shared_pref_controller.dart';
import 'package:http/http.dart' as http;

import '../api_settings.dart';

class UserApiController with Helpers{
  Future<List<Category>> getCategories() async {
    var url = Uri.parse(ApiSettings.categories);
    var response = await http.get(url, headers: {
      HttpHeaders.authorizationHeader: SharedPrefController().token
    });
    print(response.statusCode);
    if (response.statusCode == 200) {
      var categoriesJsonArray = jsonDecode(response.body)['list'] as List;
      return categoriesJsonArray
          .map((jsonObject) => Category.fromJson(jsonObject))
          .toList();
    }
    return [];
  }

  Future<List<Event>> getEvent(String id) async {
    var url = Uri.parse(ApiSettings.event + id);
    var response = await http.get(url, headers: {
       HttpHeaders.authorizationHeader:SharedPrefController().token
      // HttpHeaders.authorizationHeader:
      //     "Bearer eyJ0eXAiOiJKV1QiLCJhbGciOiJSUzI1NiJ9.eyJhdWQiOiIyIiwianRpIjoiNzQ2Y2VkZTQzZDViYzYyOTVlMDRmMTRiNGJlMzVhM2FhZmJmMzNhMzUxYWJiM2UyZTRmMjEyYjBiOWRjNzUyYmI0MzRlZWQwOWI3M2I5ZGQiLCJpYXQiOjE2Mzk4MjM3NzQuNzQ1MjQxLCJuYmYiOjE2Mzk4MjM3NzQuNzQ1MjQ0LCJleHAiOjE2NDQxNDM3NzQuNzQzMTEzLCJzdWIiOiIyIiwic2NvcGVzIjpbIioiXX0.iKScKNDmr8Ek7Cytwyv9IJ6hYIj7nILeGIlyGYzPI48PPajyVBdHSMqQn7JZMdopXJxCBiUNqS7RzDeiAyBe8HYGpJtipyqLkLNkMxxZdb84HTF2NXi6tuz-Gkl_fpP5P0APJe1MUjKCfGIcIcG6IYNjBGDhK6_SjnVV6wrkrSJ5TiMWLzg-8XavffdhZUAd_5stQlk-ZN_7dTf5VBnYF6guJsTUy4WHodUbfIBHWzGrr2tD0UBbzgmWaoc-a7QJQP12ZNees_dRLFw1kXv5uKzdHe3ijv602j35CiLu2iwa4A-4klpcPGEbkEMb_K7QDC2TLgG0EmrhK8WIE5UMq9AT94BFgrhFXoe3FZ1aB0A1do_E5jmZ5oX2rooz52VU8o-e8_t4-vGIc60-Lnhfw-jrUwL4Uj7Lq2AEokIQfrFqYONhVLoMnfdibQLMuE1h2pZ0CN_u-MipMepeT3ahOCyvpzXa1ZpotkzpYM3cHF0XmRHKCAGTTQKBfcJ60goNuz8dG2oqf2jnhKVNm9bH-NSGxPjSlQL5rsu7aXqH4mLvLHfx0CvtkP7eII4EWjwLm6YzcGaIP7E0b3tSlE6u8SFPBwlE_Td9vELPT745N-yxgaqICvFjmIIHBzwmvJ7m94LoHG9IGgZSprjJ-hGZNxx_m9lYbGtxphh8FWj9OVM"
      //

    });
    print(jsonDecode(response.body)['list']);
    if (response.statusCode == 200) {
      var categoriesJsonArray = jsonDecode(response.body)['list'] as List;
      return categoriesJsonArray
          .map((jsonObject) => Event.fromJson(jsonObject))
          .toList();
    }
    return [];
  }

  Future<Event?> getEventDitales(String id) async {
    var url = Uri.parse(ApiSettings.eventDetalis + id);
    var response = await http.get(url, headers: {
        HttpHeaders.authorizationHeader:SharedPrefController().token,
      // HttpHeaders.authorizationHeader:
      //     "Bearer eyJ0eXAiOiJKV1QiLCJhbGciOiJSUzI1NiJ9.eyJhdWQiOiIyIiwianRpIjoiNzQ2Y2VkZTQzZDViYzYyOTVlMDRmMTRiNGJlMzVhM2FhZmJmMzNhMzUxYWJiM2UyZTRmMjEyYjBiOWRjNzUyYmI0MzRlZWQwOWI3M2I5ZGQiLCJpYXQiOjE2Mzk4MjM3NzQuNzQ1MjQxLCJuYmYiOjE2Mzk4MjM3NzQuNzQ1MjQ0LCJleHAiOjE2NDQxNDM3NzQuNzQzMTEzLCJzdWIiOiIyIiwic2NvcGVzIjpbIioiXX0.iKScKNDmr8Ek7Cytwyv9IJ6hYIj7nILeGIlyGYzPI48PPajyVBdHSMqQn7JZMdopXJxCBiUNqS7RzDeiAyBe8HYGpJtipyqLkLNkMxxZdb84HTF2NXi6tuz-Gkl_fpP5P0APJe1MUjKCfGIcIcG6IYNjBGDhK6_SjnVV6wrkrSJ5TiMWLzg-8XavffdhZUAd_5stQlk-ZN_7dTf5VBnYF6guJsTUy4WHodUbfIBHWzGrr2tD0UBbzgmWaoc-a7QJQP12ZNees_dRLFw1kXv5uKzdHe3ijv602j35CiLu2iwa4A-4klpcPGEbkEMb_K7QDC2TLgG0EmrhK8WIE5UMq9AT94BFgrhFXoe3FZ1aB0A1do_E5jmZ5oX2rooz52VU8o-e8_t4-vGIc60-Lnhfw-jrUwL4Uj7Lq2AEokIQfrFqYONhVLoMnfdibQLMuE1h2pZ0CN_u-MipMepeT3ahOCyvpzXa1ZpotkzpYM3cHF0XmRHKCAGTTQKBfcJ60goNuz8dG2oqf2jnhKVNm9bH-NSGxPjSlQL5rsu7aXqH4mLvLHfx0CvtkP7eII4EWjwLm6YzcGaIP7E0b3tSlE6u8SFPBwlE_Td9vELPT745N-yxgaqICvFjmIIHBzwmvJ7m94LoHG9IGgZSprjJ-hGZNxx_m9lYbGtxphh8FWj9OVM"
      //

   });
    print(jsonDecode(response.body)["object"]);
    print(response.statusCode);
    if (response.statusCode == 200) {
      var jsonResponse = jsonDecode(response.body)["object"];
      print("ahmed get data");
      Event apiResponse = Event.fromJson(jsonResponse);
      print(apiResponse.name);

      return apiResponse;
    }
    // print("ahmed UserApiController"+response.statusCode.toString());
    // print("ahmed UserApiController"+url.toString());
    return null;
  }

  Future<bool> createEvent({
    required BuildContext context,
    required String CategoryId,
    required String name,
    required String info,
    required String date,
    required String time,
    required String address,
    required String durationHours,
    required File image,
  }) async {
    var request =
        http.MultipartRequest("POST", Uri.parse(ApiSettings.eventcreate));
    var picture = await http.MultipartFile.fromPath('image', image.path);
    request.fields['category_id'] = CategoryId;
    request.fields['name'] = name;
    request.fields['info'] = info;
    request.fields['date'] = date;
    request.fields['time'] = time;
    request.fields['address'] = address;
    request.fields['duration_hours'] = durationHours;
    request.headers['Authorization']=SharedPrefController().token;
   // request.headers['Authorization']="Bearer eyJ0eXAiOiJKV1QiLCJhbGciOiJSUzI1NiJ9.eyJhdWQiOiIyIiwianRpIjoiNzQ2Y2VkZTQzZDViYzYyOTVlMDRmMTRiNGJlMzVhM2FhZmJmMzNhMzUxYWJiM2UyZTRmMjEyYjBiOWRjNzUyYmI0MzRlZWQwOWI3M2I5ZGQiLCJpYXQiOjE2Mzk4MjM3NzQuNzQ1MjQxLCJuYmYiOjE2Mzk4MjM3NzQuNzQ1MjQ0LCJleHAiOjE2NDQxNDM3NzQuNzQzMTEzLCJzdWIiOiIyIiwic2NvcGVzIjpbIioiXX0.iKScKNDmr8Ek7Cytwyv9IJ6hYIj7nILeGIlyGYzPI48PPajyVBdHSMqQn7JZMdopXJxCBiUNqS7RzDeiAyBe8HYGpJtipyqLkLNkMxxZdb84HTF2NXi6tuz-Gkl_fpP5P0APJe1MUjKCfGIcIcG6IYNjBGDhK6_SjnVV6wrkrSJ5TiMWLzg-8XavffdhZUAd_5stQlk-ZN_7dTf5VBnYF6guJsTUy4WHodUbfIBHWzGrr2tD0UBbzgmWaoc-a7QJQP12ZNees_dRLFw1kXv5uKzdHe3ijv602j35CiLu2iwa4A-4klpcPGEbkEMb_K7QDC2TLgG0EmrhK8WIE5UMq9AT94BFgrhFXoe3FZ1aB0A1do_E5jmZ5oX2rooz52VU8o-e8_t4-vGIc60-Lnhfw-jrUwL4Uj7Lq2AEokIQfrFqYONhVLoMnfdibQLMuE1h2pZ0CN_u-MipMepeT3ahOCyvpzXa1ZpotkzpYM3cHF0XmRHKCAGTTQKBfcJ60goNuz8dG2oqf2jnhKVNm9bH-NSGxPjSlQL5rsu7aXqH4mLvLHfx0CvtkP7eII4EWjwLm6YzcGaIP7E0b3tSlE6u8SFPBwlE_Td9vELPT745N-yxgaqICvFjmIIHBzwmvJ7m94LoHG9IGgZSprjJ-hGZNxx_m9lYbGtxphh8FWj9OVM";
    request.files.add(picture);
    var response = await request.send();
    print('StatusCOde: ${response.statusCode}');
    if (response.statusCode == 201) {
    response.stream.transform(utf8.decoder).listen((value) {
      print('StatusCOde: ${response.statusCode}');
      if (response.statusCode == 201) {
        var jsonResponse = jsonDecode(value);
         showSnackBar(context: context, message: jsonResponse['message']);
      }
    }

    );
    return true;
    }
    if (response.statusCode == 400) {
      response.stream.transform(utf8.decoder).listen((value) {
        print('StatusCOde: ${response.statusCode}');
      if (response.statusCode == 400) {

          showSnackBar(context: context, message: jsonDecode(value)['message'],error: true);
        }
      }

      );
      return false;
    }
    if (response.statusCode == 500) {
      response.stream.transform(utf8.decoder).listen((value) {
        print('StatusCOde: ${response.statusCode}');
       if (response.statusCode == 500) {
         var jsonResponse = jsonDecode(value);
         showSnackBar(context: context, message: jsonResponse['message']);

       }

      }
      );
      return false;
    }
    return false;
  }
}

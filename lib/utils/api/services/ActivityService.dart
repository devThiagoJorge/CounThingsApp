import 'dart:convert';
import 'package:counthings_app/utils/models/Activity.dart';

import '';
import 'package:http/http.dart' as http;
import '../Constants.dart';

Future<List<Activity>> fetchActivity() async {
  List<Activity> activities = [];

  final response = await http.get(Uri.parse("${ConstantsApi.urlApi}/Activity"));

  var data = jsonDecode(response.body.toString());
  if (response.statusCode == 200) {
    for (Map<String, dynamic> index in data) {
      activities.add(Activity.fromJson(index));
    }
    return activities;
  }

  return activities;
}

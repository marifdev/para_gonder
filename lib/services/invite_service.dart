import 'dart:convert';

import 'package:para_gonder/features/invite/invite_model.dart';
import 'package:http/http.dart' as http;
import 'package:para_gonder/product/constants.dart';

import '../models/invited_user.dart';

class InviteService {
  Future<InviteModel> getInvites() async {
    return await http.get(Uri.parse(Constants.apiUrl)).then((response) {
      if (response.statusCode == 200) {
        return InviteModel.fromJson(jsonDecode(response.body));
      } else {
        throw Exception('Failed to load invites');
      }
    });
  }
}

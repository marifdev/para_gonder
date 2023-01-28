import 'package:flutter/material.dart';
import 'package:para_gonder/models/invited_user.dart';

class InviteModel extends ChangeNotifier {
  List<InvitedUser> _userList = [];
  int _totalEarned = 0;
  int _potentialEarned = 0;
  int _maximumEarning = 0;
  int _paidAmount = 0;

  Future<void> loadInvite(InviteModel invite) async {
    setBusy(true);
    _userList = invite.userList;
    _totalEarned = invite.totalEarned;
    _potentialEarned = invite.potentialEarned;
    _maximumEarning = invite.maximumEarning;
    _paidAmount = invite.paidAmount;
    setBusy(false);
  }

  bool _isBusy = false;
  bool get isBusy => _isBusy;

  void setBusy(bool value) {
    _isBusy = value;
    notifyListeners();
  }

  List<InvitedUser> get userList => _userList;
  int get totalEarned => _totalEarned;
  int get potentialEarned => _potentialEarned;
  int get maximumEarning => _maximumEarning;
  int get paidAmount => _paidAmount;

  set userList(List<InvitedUser> value) {
    _userList = value;
    notifyListeners();
  }

  set totalEarned(int value) {
    _totalEarned = value;
    notifyListeners();
  }

  set potentialEarned(int value) {
    _potentialEarned = value;
    notifyListeners();
  }

  set maximumEarning(int value) {
    _maximumEarning = value;
    notifyListeners();
  }

  set paidAmount(int value) {
    _paidAmount = value;
    notifyListeners();
  }

  InviteModel({
    List<InvitedUser>? userList,
    int? totalEarned,
    int? potentialEarned,
    int? maximumEarning,
    int? paidAmount,
  })  : _userList = userList ?? [],
        _totalEarned = totalEarned ?? 0,
        _potentialEarned = potentialEarned ?? 0,
        _maximumEarning = maximumEarning ?? 0,
        _paidAmount = paidAmount ?? 0;

  InviteModel.fromJson(Map<String, dynamic> json)
      : _userList = json['userList'] != null ? (json['userList'] as List).map((e) => InvitedUser.fromJson(e)).toList() : [],
        _totalEarned = json['totalEarned'],
        _potentialEarned = json['potentialEarned'],
        _maximumEarning = json['maximumEarning'],
        _paidAmount = json['paidAmount'];

  Map<String, dynamic> toJson() => {
        'userList': _userList,
        'totalEarned': _totalEarned,
        'potentialEarned': _potentialEarned,
        'maximumEarning': _maximumEarning,
        'paidAmount': _paidAmount,
      };
}

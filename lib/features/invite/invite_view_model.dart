import 'package:para_gonder/services/invite_service.dart';

import 'invite_model.dart';

class InviteViewModel {
  final InviteModel _inviteModel;
  InviteViewModel(this._inviteModel);

  final InviteService _inviteService = InviteService();

  Future<void> init() async {
    _inviteModel.setBusy(true);
    await getInvites();
    _inviteModel.setBusy(false);
  }

  Future<void> getInvites() async {
    await _inviteService.getInvites().then((value) {
      _inviteModel.loadInvite(value);
    });
  }
}

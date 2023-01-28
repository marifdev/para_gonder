import 'package:flutter/material.dart';
import 'package:para_gonder/product/style.dart';
import 'package:para_gonder/widgets/invite_card.dart';
import 'package:provider/provider.dart';

import '../../widgets/grey_button.dart';
import 'invite_model.dart';
import 'invite_view_model.dart';

class InviteView extends StatefulWidget {
  const InviteView({super.key});

  @override
  State<InviteView> createState() => _InviteViewState();
}

class _InviteViewState extends State<InviteView> {
  late InviteViewModel viewModel;
  late InviteModel _model;

  @override
  void initState() {
    super.initState();
    _model = InviteModel();
    viewModel = InviteViewModel(_model);
    viewModel.init();
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => _model,
      child: Scaffold(
        body: Consumer<InviteModel>(
          builder: (context, model, child) {
            return model.isBusy
                ? const Center(
                    child: CircularProgressIndicator(),
                  )
                : Column(
                    children: [
                      Expanded(
                        child: Stack(
                          clipBehavior: Clip.none,
                          children: [
                            Container(
                              height: 350,
                              width: double.infinity,
                              decoration: const BoxDecoration(
                                gradient: LinearGradient(
                                  begin: Alignment.topCenter,
                                  end: Alignment.bottomCenter,
                                  colors: [
                                    AppColors.lightBlue,
                                    AppColors.darkBlue,
                                  ],
                                ),
                              ),
                            ),
                            SafeArea(
                              bottom: false,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  navbar(context),
                                  earnings(model),
                                  Padding(
                                    padding: const EdgeInsets.symmetric(horizontal: 32.0, vertical: 16),
                                    child: Text(
                                      'Invited',
                                      style: TextStyles.bodySmallBold.copyWith(color: Colors.white),
                                    ),
                                  ),
                                  invitedList(model),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                      bottomWidget()
                    ],
                  );
          },
        ),
      ),
    );
  }

  Container bottomWidget() {
    return Container(
      color: Colors.white,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Row(
                children: [
                  GreyButton(icon: Icons.description_outlined, text: 'Terms & Conditions', onPressed: () {}),
                  const SizedBox(width: 5),
                  GreyButton(icon: Icons.help_outline, text: 'How To Works?', onPressed: () {}),
                ],
              ),
            ),
            InkWell(
              onTap: () {},
              child: Container(
                padding: const EdgeInsets.all(16.0),
                decoration: const BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [
                      AppColors.orange,
                      AppColors.red,
                    ],
                  ),
                ),
                child: Center(
                  child: Text(
                    'Invite',
                    style: TextStyles.body.copyWith(color: Colors.white),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 10),
          ],
        ),
      ),
    );
  }

  Expanded invitedList(InviteModel model) {
    return Expanded(
      child: ListView.builder(
        padding: EdgeInsets.zero,
        itemCount: model.userList.length,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 32.0),
            child: Column(
              children: [
                InviteCard(
                  user: model.userList[index],
                ),
                const SizedBox(height: 10),
                if (index == model.userList.length - 1) ...[
                  Container(
                    padding: const EdgeInsets.all(16.0),
                    height: 100,
                    width: double.infinity,
                    decoration: const BoxDecoration(
                      color: Colors.white,
                      boxShadow: [
                        BoxShadow(
                          color: AppColors.shadowColor,
                          blurRadius: 10,
                          offset: Offset(0, 5),
                        ),
                      ],
                    ),
                    child: Row(
                      children: [
                        Container(
                          height: 60,
                          width: 60,
                          decoration: const BoxDecoration(
                            border: Border.fromBorderSide(
                              BorderSide(
                                color: AppColors.grey,
                                width: 2,
                              ),
                            ),
                            borderRadius: BorderRadius.all(Radius.circular(30)),
                          ),
                          child: const Icon(
                            Icons.add,
                            color: AppColors.red,
                            size: 30,
                          ),
                        ),
                        const SizedBox(width: 20),
                        Text(
                          'Invite',
                          style: TextStyles.bodyBold.copyWith(color: AppColors.red),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 10),
                ]
              ],
            ),
          );
        },
      ),
    );
  }

  Padding earnings(InviteModel model) {
    return Padding(
      padding: const EdgeInsets.all(32.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Total Earned',
                style: TextStyles.bodySmall.copyWith(
                  color: Colors.white,
                ),
              ),
              const SizedBox(height: 10),
              Text(
                "${model.totalEarned} €",
                style: TextStyles.bodyBigBold.copyWith(
                  color: Colors.white,
                ),
              ),
              const SizedBox(height: 10),
              InkWell(
                onTap: () {},
                child: Text(
                  'You can claim!',
                  style: TextStyles.bodySmallBold.copyWith(
                    color: Colors.white,
                    decoration: TextDecoration.underline,
                  ),
                ),
              )
            ],
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Text(
                'Potencial Earned',
                style: TextStyles.bodySmall.copyWith(
                  color: Colors.white,
                ),
              ),
              const SizedBox(height: 10),
              Text(
                "${model.potentialEarned} €",
                style: TextStyles.bodyBigBold.copyWith(
                  color: Colors.white,
                ),
              ),
              const SizedBox(height: 10),
              Text(
                "Maximum Earnings ${model.maximumEarning} €",
                style: TextStyles.bodySmall.copyWith(
                  color: Colors.white,
                ),
              )
            ],
          ),
        ],
      ),
    );
  }

  Stack navbar(BuildContext context) {
    return Stack(
      alignment: Alignment.center, // to center vertically
      children: [
        Align(
          alignment: Alignment.centerLeft,
          child: IconButton(
            icon: const Icon(
              Icons.arrow_back,
              color: Colors.white,
            ),
            onPressed: () {
              // Navigator.pop(context);
            },
          ),
        ),
        Center(
          child: Image.asset(
            'assets/images/logo.png',
            height: 30,
          ),
        ),
      ],
    );
  }
}

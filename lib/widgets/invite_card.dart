import 'package:flutter/material.dart';
import 'package:para_gonder/models/invited_user.dart';
import 'package:para_gonder/product/style.dart';
import 'package:intl/intl.dart';

class InviteCard extends StatelessWidget {
  final InvitedUser user;
  const InviteCard({
    Key? key,
    required this.user,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
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
          const CircleAvatar(
            radius: 30,
            backgroundImage: NetworkImage('https://i.pravatar.cc/300'), // can be used cached_network_image package for better performance
          ),
          const SizedBox(width: 10),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "${user.firstName} ${user.lastName}",
                  style: TextStyles.bodyBold,
                  overflow: TextOverflow.ellipsis,
                ),
                const SizedBox(height: 10),
                Text(
                  DateFormat('dd MMMM yyyy').format(user.date),
                  style: TextStyles.bodySmall,
                ),
              ],
            ),
          ),
          Text(
            "${user.totalEarned > 0 ? '+' : ''}${user.totalEarned} €",
            style: TextStyles.subtitle.copyWith(
              color: user.totalEarned > 0 ? AppColors.red : AppColors.darkGrey,
            ),
          ),
          const SizedBox(width: 10),
          const Icon(
            Icons.arrow_forward_ios,
            size: 16,
          ),
        ],
      ),
    );
  }
}

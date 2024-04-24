import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:health_monitoring/src/core/extension/extensions.dart';
import 'package:health_monitoring/src/core/resources/resources.dart';

@RoutePage()
class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          height: context.screenSize.height * 0.3,
          color: AppColors.kMainGreen,
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Settings',
                    style: AppTextStyles.os16w500
                        .copyWith(color: AppColors.kWhite),
                  ),
                  Text(
                    'Profile',
                    style: AppTextStyles.os28w700
                        .copyWith(color: AppColors.kWhite),
                  ),
                  Text(
                    'Logout',
                    style: AppTextStyles.os16w500
                        .copyWith(color: AppColors.kWhite),
                  ),
                ],
              ),
              Container(
                padding: const EdgeInsets.all(4),
                decoration: const BoxDecoration(
                  shape: BoxShape.circle,
                  color: AppColors.kWhite,
                ),
                child: const CircleAvatar(
                  backgroundColor: AppColors.kMainGreen,
                  radius: 158 / 2,
                  foregroundColor: AppColors.kWhite,
                  foregroundImage: AssetImage('assets/png/test_profile.png'),
                  // child: Image.asset('assets/png/test_banner.jpg'),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}

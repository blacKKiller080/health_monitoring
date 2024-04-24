import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:health_monitoring/src/core/resources/resources.dart';
import 'package:health_monitoring/src/features/app/widgets/custom/common_input.dart';

@RoutePage()
class MainPage extends StatelessWidget {
  const MainPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 20, left: 20, right: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Hello,',
                    style: AppTextStyles.os14w600
                        .copyWith(color: AppColors.kTextSecondary),
                  ),
                  const Text(
                    'Hi Alikhan',
                    style: AppTextStyles.os20w700,
                  ),
                ],
              ),
              const CircleAvatar(
                backgroundColor: AppColors.kMainGreen,
                radius: 30,
                foregroundImage: AssetImage('assets/png/test_profile.png'),
                // child: Image.asset('assets/png/test_banner.jpg'),
              ),
            ],
          ),
          const Gap(30),
          CommonInput(
            'Search doctor or health issue',
            prefixIcon: const Icon(
              Icons.search_sharp,
              size: 30,
              color: AppColors.kTextSecondary,
            ),
            isTexthint: true,
            style: const TextStyle(
              fontSize: 15,
              fontWeight: FontWeight.w400,
              color: AppColors.kTextSecondary,
            ),
          ),
          const Gap(17),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Column(
                children: [
                  Ink(
                    decoration: const ShapeDecoration(
                      color: Color(0xFFFAFAFA),
                      shape: CircleBorder(),
                    ),
                    child: IconButton(
                      onPressed: () {},
                      color: AppColors.kMainGreen,
                      padding: const EdgeInsets.symmetric(
                        horizontal: 24,
                        vertical: 24,
                      ),
                      icon: const Icon(Icons.person),
                    ),
                  ),
                  const Gap(8),
                  Text(
                    'Doctor',
                    style: AppTextStyles.os14w500
                        .copyWith(color: AppColors.kTextSecondary),
                  ),
                ],
              ),
              const Gap(13),
              Column(
                children: [
                  Ink(
                    decoration: const ShapeDecoration(
                      color: Color(0xFFFAFAFA),
                      shape: CircleBorder(),
                    ),
                    child: IconButton(
                      onPressed: () {},
                      color: AppColors.kMainGreen,
                      padding: const EdgeInsets.symmetric(
                        horizontal: 24,
                        vertical: 24,
                      ),
                      icon: const Icon(Icons.medication),
                    ),
                  ),
                  const Gap(8),
                  Text(
                    'Medicine',
                    style: AppTextStyles.os14w500
                        .copyWith(color: AppColors.kTextSecondary),
                  ),
                ],
              ),
              const Gap(13),
              Column(
                children: [
                  Ink(
                    decoration: const ShapeDecoration(
                      color: Color(0xFFFAFAFA),
                      shape: CircleBorder(),
                    ),
                    child: IconButton(
                      onPressed: () {},
                      color: AppColors.kMainGreen,
                      padding: const EdgeInsets.symmetric(
                        horizontal: 24,
                        vertical: 24,
                      ),
                      icon: const Icon(Icons.local_hospital),
                    ),
                  ),
                  const Gap(8),
                  Text(
                    'Content',
                    style: AppTextStyles.os14w500
                        .copyWith(color: AppColors.kTextSecondary),
                  ),
                ],
              ),
            ],
          ),
          const Gap(25),
          const Text(
            'The nearest medication intake',
            style: AppTextStyles.os16w600,
          ),
          const Gap(13),
          toDoContainer(),
          const Gap(13),
          toDoContainer(),
          const Gap(13),
          toDoContainer(),
          const Gap(25),
          Center(
            child: Text(
              "That's it for today, see you tomorrow",
              style:
                  AppTextStyles.os16w500.copyWith(color: AppColors.kMainGreen),
            ),
          ),
        ],
      ),
    );
  }

  Widget toDoContainer() => Container(
        decoration: BoxDecoration(
          boxShadow: AppDecorations.dropShadow,
          color: AppColors.kWhite,
          borderRadius: BorderRadius.circular(10),
        ),
        padding:
            const EdgeInsets.only(right: 30, left: 16, top: 16, bottom: 10),
        child: Row(
          children: [
            Image.asset('assets/png/test_todo.png'),
            const Gap(10),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'LEQEMBI',
                  style: AppTextStyles.os20w700,
                ),
                Text(
                  '200 mg/ml',
                  style: AppTextStyles.os14w400
                      .copyWith(color: AppColors.kTextSecondary),
                ),
              ],
            ),
            const Spacer(),
            const Icon(
              Icons.schedule_rounded,
              color: AppColors.kBlue,
            ),
            Text(
              '  at 17:00',
              style: AppTextStyles.os14w400.copyWith(color: AppColors.kBlue),
            ),
          ],
        ),
      );
}

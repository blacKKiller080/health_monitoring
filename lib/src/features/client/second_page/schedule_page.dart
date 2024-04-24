import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:health_monitoring/src/core/resources/resources.dart';
import 'package:health_monitoring/src/features/app/widgets/custom/build_segment_widget.dart';
import 'package:health_monitoring/src/features/app/widgets/custom/common_button.dart';
import 'package:health_monitoring/src/features/app/widgets/custom/custom_divider.dart';
import 'package:health_monitoring/src/features/app/widgets/custom/custom_switch_button.dart';

@RoutePage()
class SchedulePage extends StatefulWidget {
  const SchedulePage({super.key});

  @override
  State<SchedulePage> createState() => _SchedulePageState();
}

class _SchedulePageState extends State<SchedulePage> {
  int segmentValue = 0;

  late PageController _pageViewController;

  @override
  void initState() {
    super.initState();
    _pageViewController = PageController();
  }

  @override
  void dispose() {
    super.dispose();
    _pageViewController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10),
            child: Row(
              children: [
                Expanded(
                  child: CustomSwitchButton<int>(
                    groupValue: segmentValue,
                    thumbColor: AppColors.kElementsSurface,
                    backgroundColor: const Color.fromARGB(255, 250, 250, 250),
                    customSwitchButtonBorderRadius: 100,
                    border: Border.all(
                      color: const Color(0xFFF1F2F6),
                    ),
                    overallPadding: const EdgeInsets.symmetric(
                      horizontal: 3,
                      vertical: 2,
                    ),
                    children: {
                      0: BuildSegmentWidget(
                        // text: context.localized.myTeachers,
                        text: 'Upcoming schedule',
                        isSelected: 0 == segmentValue,
                      ),
                      1: BuildSegmentWidget(
                        text: 'Upcoming medicaments',
                        // text: context.localized.myAdviser,
                        isSelected: 1 == segmentValue,
                      ),
                    },
                    onValueChanged: (int? value) {
                      setState(() {
                        segmentValue = value!;
                      }); //TOGGLE

                      _updateCurrentPageIndex(value!);
                    },
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: PageView(
              controller: _pageViewController,
              onPageChanged: _handlePageViewChanged,
              children: [
                ListView.separated(
                  separatorBuilder: (context, index) => const Gap(0),
                  itemBuilder: (context, index) {
                    return doctorContainer();
                  },
                  itemCount: 2,
                ),
                ListView.separated(
                  separatorBuilder: (context, index) => const Gap(0),
                  itemBuilder: (context, index) {
                    return medContainer();
                  },
                  itemCount: 2,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  void _handlePageViewChanged(int currentPageIndex) {
    setState(() {
      segmentValue = currentPageIndex;
    });
  }

  void _updateCurrentPageIndex(int index) {
    segmentValue = index;
    _pageViewController.animateToPage(
      index,
      duration: const Duration(milliseconds: 400),
      curve: Curves.easeInOut,
    );
  }

  Widget doctorContainer() => Container(
        decoration: BoxDecoration(
          boxShadow: AppDecorations.dropShadow,
          color: AppColors.kWhite,
          borderRadius: BorderRadius.circular(10),
        ),
        margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        padding:
            const EdgeInsets.only(right: 30, left: 16, top: 16, bottom: 20),
        child: Column(
          children: [
            Row(
              children: [
                Container(
                  width: 48,
                  height: 48,
                  decoration: const BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage('assets/png/test_doctor.png'),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
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
              ],
            ),
            const CustomDivider(),
            Row(
              children: [
                const Icon(
                  Icons.calendar_month_rounded,
                  color: AppColors.kTextSecondary,
                  size: 18,
                ),
                Text(
                  '  Sunday, 12  Nov',
                  style: AppTextStyles.os13w400
                      .copyWith(color: AppColors.kTextSecondary),
                ),
                const Spacer(),
                const Icon(
                  Icons.schedule_rounded,
                  color: AppColors.kTextSecondary,
                  size: 18,
                ),
                Text(
                  '  11:00 - 12:00 AM',
                  style: AppTextStyles.os13w400
                      .copyWith(color: AppColors.kTextSecondary),
                ),
              ],
            ),
            const Gap(20),
            CommonButton(
              backgroundColor: AppColors.kElementsSurface,
              child: const Text('Detail'),
            ),
          ],
        ),
      );

  Widget medContainer() => Container(
        decoration: BoxDecoration(
          boxShadow: AppDecorations.dropShadow,
          color: AppColors.kWhite,
          borderRadius: BorderRadius.circular(10),
        ),
        margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
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

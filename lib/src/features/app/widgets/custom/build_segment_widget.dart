import 'package:flutter/material.dart';

import 'package:health_monitoring/src/core/resources/resources.dart';

class BuildSegmentWidget extends StatelessWidget {
  final String text;
  final bool isSelected;
  final bool isBordered;
  const BuildSegmentWidget({
    super.key,
    required this.isSelected,
    required this.text,
    this.isBordered = false,
  });
  //

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      height: 50,
      child: Text(
        text,
        textAlign: TextAlign.center,
        style: isSelected
            ? AppTextStyles.os16w500
                .copyWith(height: 1, color: AppColors.kMainGreen)
            : AppTextStyles.os16w500.copyWith(
                color: const Color.fromRGBO(134, 150, 187, 1),
                height: 1,
              ),
      ),
    );
  }
}

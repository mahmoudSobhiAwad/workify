import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:workify/core/utils/theme/app_icons.dart';
import 'package:workify/shared/functions/parse_time_of_day.dart';
import 'package:workify/shared/widgets/custom_text_form_field.dart';

class StartAndEndTimesPicker extends StatelessWidget {
  const StartAndEndTimesPicker({
    super.key,
    required this.startTime,
    required this.endTime,
  });

  final TextEditingController startTime;
  final TextEditingController endTime;

  @override
  Widget build(BuildContext context) {
    return Row(
      spacing: 24,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Expanded(
          child: CustomTextFormField(
            controller: startTime,
            maxLine: 1,
            isReadOnly: true,
            onTap: () async {
              showTimePicker(
                      context: context,
                      initialTime: parseTimeOfDay(startTime.text) ??
                          TimeOfDay(hour: 8, minute: 0))
                  .then((value) {
                if (value != null && context.mounted) {
                  startTime.text = value.format(context);
                }
              });
            },
            validator: (value) {
              if (value == null || value.trim().isEmpty) {
                return "Please Specify Start Time";
              }
              return null;
            },
            hintText: "Start Time",
            suffixWidget: SvgPicture.asset(
              AppIcons.assetsIconsStartTimeIcon,
              fit: BoxFit.scaleDown,
            ),
          ),
        ),
        Expanded(
          child: CustomTextFormField(
            controller: endTime,
            onTap: () {
              showTimePicker(
                      context: context,
                      initialTime: parseTimeOfDay(endTime.text) ??
                          TimeOfDay(hour: 16, minute: 0))
                  .then((value) {
                if (value != null && context.mounted) {
                  endTime.text = value.format(context);
                }
              });
            },
            isReadOnly: true,
            hintText: "End Time",
            validator: (value) {
              if (value == null || value.trim().isEmpty) {
                return "Please Specify End Time";
              }
              return null;
            },
            suffixWidget: SvgPicture.asset(
              AppIcons.assetsIconsEndTimeIcon,
              fit: BoxFit.scaleDown,
            ),
          ),
        ),
      ],
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import 'package:sea_of_wine_app/settings/colors.dart';
import 'package:sea_of_wine_app/settings/text_styles.dart';

class CheckboxWidget extends StatefulWidget {
  final String label;
  final String value;
  final bool isChecked;
  final void Function(String filter) onChange;

  const CheckboxWidget(
      {Key? key,
      required this.label,
      required this.value,
      required this.isChecked,
      required this.onChange})
      : super(key: key);

  @override
  State<CheckboxWidget> createState() => _CheckboxWidgetState();
}

class _CheckboxWidgetState extends State<CheckboxWidget> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => widget.onChange(widget.value),
      child: Row(
        children: [
          buildCheckbox(),
          const SizedBox(
            width: 10,
          ),
          Expanded(
            child: Text(
              widget.label,
              style:
                  AppTextsStyles.paragraph.copyWith(color: AppColors.superGray),
              maxLines: 2,
            ),
          )
        ],
      ),
    );
  }

  Container buildCheckbox() {
    return Container(
      width: 25,
      height: 25,
      decoration: BoxDecoration(
          border: Border.all(color: AppColors.dark, width: 1),
          borderRadius: BorderRadius.circular(5)),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 150),
        color: widget.isChecked ? AppColors.dark : Colors.transparent,
        child: Center(
          child: AnimatedOpacity(
            duration: const Duration(milliseconds: 150),
            opacity: widget.isChecked ? 1 : 0,
            child: SvgPicture.asset(
              "assets/icons/check_icon.svg",
              width: 10,
            ),
          ),
        ),
      ),
    );
  }
}

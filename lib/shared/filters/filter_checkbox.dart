import 'package:flutter/material.dart';
import 'package:sea_of_wine_app/settings/constans.dart';
import 'package:sea_of_wine_app/settings/theme.dart';

class FilterCheckbox extends StatefulWidget {
  final String label;
  final String value;
  final bool isChecked;
  final void Function(String filter) onChange;

  const FilterCheckbox(
      {Key? key,
      required this.label,
      required this.value,
      required this.isChecked,
      required this.onChange})
      : super(key: key);

  @override
  State<FilterCheckbox> createState() => _FilterCheckboxState();
}

class _FilterCheckboxState extends State<FilterCheckbox> {
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          width: 20,
          height: 20,
          padding: const EdgeInsets.only(right: 15),
          child: Checkbox(
              value: widget.isChecked,
              checkColor: AppColors.white,
              fillColor: MaterialStateProperty.resolveWith((states) {
                return AppColors.dark;
              }),
              onChanged: (bool? checked) {
                widget.onChange(widget.value);
              }),
        ),
        Text(
          widget.label,
          style: AppTheme.ligthTheme.textTheme.bodyText1!
              .copyWith(color: AppColors.superGray),
        )
      ],
    );
  }
}

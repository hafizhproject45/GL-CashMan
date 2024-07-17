// ignore_for_file: library_private_types_in_public_api

import 'package:flutter/material.dart';

import '../../../../../core/utils/colors.dart';
import '../../../../../core/utils/text_style.dart';

class MyTextFieldText extends StatefulWidget {
  final String name;
  final FocusNode? focusNode;
  final TextInputAction? textInputAction;
  final TextInputType? type;
  final TextStyle? nameStyle;
  final bool? isDate;
  final double? width;
  final IconData? iconz;
  final Color? iconColor;
  final TextEditingController? controller;
  final String? Function(String? value)? validator;

  const MyTextFieldText({
    super.key,
    required this.name,
    this.focusNode,
    this.isDate = false,
    this.textInputAction,
    this.nameStyle,
    this.iconz,
    this.iconColor,
    this.controller,
    this.validator,
    this.width = 300,
    this.type = TextInputType.text,
  });

  @override
  _MyTextFieldTextState createState() => _MyTextFieldTextState();
}

class _MyTextFieldTextState extends State<MyTextFieldText> {
  DateTime? _selectedDate;

  // @override
  // void initState() {
  //   super.initState();
  //   if (widget.controller != null && widget.controller!.text.isNotEmpty) {
  //     List<String> dateParts = widget.controller!.text.split('-');
  //     int month = _getMonthIndex(dateParts[0]);
  //     int year = int.parse(dateParts[1]);
  //     _selectedDate = DateTime(year, month);
  //   }
  // }

  // int _getMonthIndex(String monthName) {
  //   List<String> months = [
  //     "January",
  //     "February",
  //     "March",
  //     "April",
  //     "May",
  //     "June",
  //     "July",
  //     "August",
  //     "September",
  //     "October",
  //     "November",
  //     "December"
  //   ];
  //   return months.indexOf(monthName) + 1;
  // }

  Future<void> _selectMonthYear(BuildContext context) async {
    final now = DateTime.now();
    DateTime initialDate = _selectedDate ?? DateTime(now.year, now.month);

    int selectedYear = initialDate.year;
    int selectedMonth = initialDate.month;
    List<String> months = [
      "January",
      "February",
      "March",
      "April",
      "May",
      "June",
      "July",
      "August",
      "September",
      "October",
      "November",
      "December"
    ];

    await showDialog(
      context: context,
      builder: (BuildContext context) {
        return StatefulBuilder(
          builder: (context, setState) {
            return AlertDialog(
              titlePadding: const EdgeInsets.only(bottom: 30, top: 20),
              title: const Text(
                'Select Month and Year',
                style: AppTextStyle.subHeading,
                textAlign: TextAlign.center,
              ),
              content: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      const Text(
                        'Month',
                        style: AppTextStyle.subHeadingPrimary,
                      ),
                      const SizedBox(height: 10),
                      DropdownButton<int>(
                        dropdownColor: Colors.white,
                        value: selectedMonth,
                        items: List.generate(12, (index) {
                          return DropdownMenuItem(
                            value: index + 1,
                            child: Text(months[index]),
                          );
                        }),
                        onChanged: (value) {
                          setState(() {
                            selectedMonth = value!;
                          });
                        },
                      ),
                    ],
                  ),
                  const SizedBox(width: 30),
                  Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      const Text(
                        'Year',
                        style: AppTextStyle.subHeadingPrimary,
                      ),
                      const SizedBox(height: 10),
                      DropdownButton<int>(
                        dropdownColor: Colors.white,
                        value: selectedYear,
                        items: List.generate(7, (index) {
                          int year = now.year -
                              1 +
                              index; // Adjust this to control the range
                          return DropdownMenuItem(
                            value: year,
                            child: Text(year.toString()),
                          );
                        }),
                        onChanged: (value) {
                          setState(() {
                            selectedYear = value!;
                          });
                        },
                      ),
                    ],
                  ),
                ],
              ),
              actions: [
                TextButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  child: const Text('Cancel'),
                ),
                TextButton(
                  onPressed: () {
                    setState(() {
                      _selectedDate = DateTime(selectedYear, selectedMonth);
                      if (widget.controller != null) {
                        widget.controller!.text =
                            "${months[_selectedDate!.month - 1]}-${_selectedDate!.year}";
                      }
                    });
                    Navigator.of(context).pop();
                  },
                  child: const Text('OK'),
                ),
              ],
              backgroundColor: Colors.white,
            );
          },
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 5),
      width: widget.width,
      child: TextFormField(
        validator: widget.validator,
        cursorColor: AppColor.white,
        controller: widget.controller,
        focusNode: widget.isDate! ? null : widget.focusNode,
        textInputAction: widget.isDate! ? null : widget.textInputAction,
        enableInteractiveSelection: !widget.isDate!,
        keyboardType: widget.isDate! ? null : widget.type,
        readOnly: widget.isDate!,
        style: widget.nameStyle ?? AppTextStyle.bodyThinWhite,
        onTap: widget.isDate!
            ? () {
                _selectMonthYear(context);
              }
            : null,
        decoration: InputDecoration(
          errorStyle: const TextStyle(color: Colors.red),
          errorBorder: const OutlineInputBorder(
            borderSide: BorderSide(color: Colors.red),
          ),
          prefixIcon: Icon(
            widget.iconz,
            color: widget.iconColor ?? AppColor.white,
          ),
          label: Text(
            widget.name,
            style: widget.nameStyle ?? AppTextStyle.bodyThinWhite,
          ),
          border: const OutlineInputBorder(),
          contentPadding: const EdgeInsets.symmetric(horizontal: 10),
        ),
      ),
    );
  }
}

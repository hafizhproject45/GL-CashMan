import 'package:flutter/material.dart';
import 'package:dropdown_button2/dropdown_button2.dart';

import '../styles/color_pallete.dart';
import '../styles/text_styles.dart';

class DropDownWidget extends StatefulWidget {
  final String name;
  final List<String> items;
  final Function(String? value)? onSaved;

  DropDownWidget({
    super.key,
    required this.name,
    required this.items,
    this.onSaved,
  });

  @override
  State<DropDownWidget> createState() => _DropDownWidgetState();
}

String? selectedValue;

class _DropDownWidgetState extends State<DropDownWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 146,
      child: DropdownButtonFormField2<String>(
        isExpanded: true,
        decoration: InputDecoration(
          contentPadding: EdgeInsets.symmetric(vertical: 15),
          border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(5),
              borderSide: BorderSide(color: Colorz.primary)),
        ),
        hint: Text(
          widget.name,
          style: TextPrimary.thin,
        ),
        items: widget.items
            .map(
              (item) => DropdownMenuItem<String>(
                value: item,
                child: Text(
                  item,
                  style: TextStyle(
                    fontSize: 12,
                  ),
                ),
              ),
            )
            .toList(),
        validator: (value) {
          if (value == null) {
            return "Masukkan ${widget.name}";
          }
          return null;
        },
        onChanged: (value) {},
        onSaved: widget.onSaved,
        buttonStyleData: ButtonStyleData(
          padding: EdgeInsets.only(right: 8),
        ),
        iconStyleData: IconStyleData(
          icon: Icon(
            Icons.arrow_drop_down,
            color: Colorz.primary,
          ),
          iconSize: 24,
        ),
        dropdownStyleData: DropdownStyleData(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15),
          ),
        ),
        menuItemStyleData: MenuItemStyleData(
          padding: EdgeInsets.symmetric(horizontal: 16),
        ),
      ),
    );
  }
}

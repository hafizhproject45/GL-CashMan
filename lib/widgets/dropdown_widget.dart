import 'package:flutter/material.dart';
import 'package:dropdown_button2/dropdown_button2.dart';
import '../styles/color_pallete.dart';
import '../styles/text_styles.dart';

class DropDownWidget extends StatefulWidget {
  DropDownWidget({super.key});

  @override
  State<DropDownWidget> createState() => _DropDownWidgetState();
}

class _DropDownWidgetState extends State<DropDownWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 300,
      child: DropdownButtonFormField2<String>(
        isExpanded: true,
        decoration: InputDecoration(
          contentPadding: EdgeInsets.symmetric(vertical: 16),
          border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: BorderSide(color: Colorz.primary)),
          // Add more decoration..
        ),
        hint: Text(
          'Pilih Bulan',
          style: TextPrimary.thin,
        ),
        items: monthItems
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
            return 'Pilih Bulan';
          }
          return null;
        },
        onChanged: (value) {},
        onSaved: (value) {
          selectedValue = value.toString();
        },
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

final List<String> monthItems = [
  'Januari',
  'Februari',
  'Maret',
  'April',
  'Mei',
  'Juni',
  'Juli',
  'Agustus',
  'September',
  'Oktober',
  'November',
  'Desember ',
];
String? selectedValue;

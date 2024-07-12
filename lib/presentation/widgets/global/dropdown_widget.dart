// import 'package:dropdown_button2/dropdown_button2.dart';
// import 'package:flutter/material.dart';
// import 'package:gl_app/core/utils/text_style.dart';

// import '../../core/utils/colors.dart';

// class DropDownWidget extends StatefulWidget {
//   final String name;
//   final List<String> items;
//   final Function(String? value)? onSaved;

//   const DropDownWidget({
//     super.key,
//     required this.name,
//     required this.items,
//     this.onSaved,
//   });

//   @override
//   State<DropDownWidget> createState() => _DropDownWidgetState();
// }

// String? selectedValue;

// class _DropDownWidgetState extends State<DropDownWidget> {
//   @override
//   Widget build(BuildContext context) {
//     return SizedBox(
//       width: 146,
//       child: DropdownButtonFormField2<String>(
//         isExpanded: true,
//         decoration: InputDecoration(
//           contentPadding: const EdgeInsets.symmetric(vertical: 15),
//           border: OutlineInputBorder(
//               borderRadius: BorderRadius.circular(5),
//               borderSide: const BorderSide(color: AppColor.primary)),
//         ),
//         hint: Text(
//           widget.name,
//           style: AppTextStyle.medium,
//         ),
//         items: widget.items
//             .map(
//               (item) => DropdownMenuItem<String>(
//                 value: item,
//                 child: Text(
//                   item,
//                   style: const TextStyle(
//                     fontSize: 12,
//                   ),
//                 ),
//               ),
//             )
//             .toList(),
//         validator: (value) {
//           if (value == null) {
//             return "Masukkan ${widget.name}";
//           }
//           return null;
//         },
//         onChanged: (value) {},
//         onSaved: widget.onSaved,
//         buttonStyleData: const ButtonStyleData(
//           padding: EdgeInsets.only(right: 8),
//         ),
//         iconStyleData: const IconStyleData(
//           icon: Icon(
//             Icons.arrow_drop_down,
//             color: AppColor.primary,
//           ),
//           iconSize: 24,
//         ),
//         dropdownStyleData: DropdownStyleData(
//           decoration: BoxDecoration(
//             borderRadius: BorderRadius.circular(15),
//           ),
//         ),
//         menuItemStyleData: const MenuItemStyleData(
//           padding: EdgeInsets.symmetric(horizontal: 16),
//         ),
//       ),
//     );
//   }
// }

import 'package:flutter/material.dart';
import 'package:furni_hunt_dashboard/core/resources/color_manager.dart';

class CustomDropdownMenu extends StatefulWidget {
  const CustomDropdownMenu(
      {super.key,
      required this.itemsList,
      required this.controller,
      this.onChanged,
      required this.hint});
  final List<String> itemsList;
  final TextEditingController controller;
  final void Function(String?)? onChanged;
  final String hint;
  @override
  State<CustomDropdownMenu> createState() => _MyWidgetState();
}

class _MyWidgetState extends State<CustomDropdownMenu> {
  String? category;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 30,
      width: MediaQuery.sizeOf(context).width / 2 - 30,
      child: Center(
        child: DropdownButtonFormField(
          items: widget.itemsList
              .map((String value) => DropdownMenuItem<String>(
                    value: value,
                    child: Text(value),
                  ))
              .toList(),
          value: category,
          alignment: Alignment.center,
          borderRadius: BorderRadius.circular(8),
          iconEnabledColor: ColorManager.primary,
          decoration: InputDecoration(
            contentPadding: EdgeInsets.all(5),
            hintText: 'Select an item', // Add hint text
          ),
          onChanged: (value) {
            setState(() {
              category = value;
            });
            widget.controller.text = value!;
          },
          validator: (value) {
            if (value == null || value.isEmpty) {
              return 'Please select an item';
            }
            return null;
          },
        ),
      ),
    );
  }
}

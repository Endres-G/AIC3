import 'package:aic_lll/core/themes/design_system.dart';
import 'package:flutter/material.dart';

class CustomDropdown extends StatelessWidget {
  final String title;
  final String hint;
  final int? value;
  final List<Map<String, dynamic>> items;
  final ValueChanged<int?> onChanged;

  const CustomDropdown({
    super.key,
    required this.title,
    required this.hint,
    required this.value,
    required this.items,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: const TextStyle(
            fontWeight: FontWeight.w700,
            fontSize: 20,
            color: DesignSystemColors.titleTextfield,
          ),
        ),
        const SizedBox(height: 8),
        SizedBox(
          width: 323,
          child: DropdownButtonFormField<int>(
            value: value,
            items: items
                .map((item) => DropdownMenuItem<int>(
                      value: item['id'],
                      child: Text(
                        item['name'],
                        style: const TextStyle(
                          fontSize: 18,
                          color: DesignSystemColors.titleTextfield,
                        ),
                      ),
                    ))
                .toList(),
            onChanged: onChanged,
            decoration: InputDecoration(
              hintStyle: const TextStyle(
                fontSize: 18,
                color: DesignSystemColors.textfieldInactiveColor,
              ),
              hintText: hint,
              border: OutlineInputBorder(
                borderSide: const BorderSide(
                  color: DesignSystemColors.textfieldInactiveColor,
                ),
                borderRadius: BorderRadius.circular(12),
              ),
              focusedBorder: OutlineInputBorder(
                borderSide: const BorderSide(
                  color: DesignSystemColors.secundaryBlue,
                ),
                borderRadius: BorderRadius.circular(12),
              ),
            ),
          ),
        ),
      ],
    );
  }
}

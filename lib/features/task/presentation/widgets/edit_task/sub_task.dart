import 'package:flutter/material.dart';

class SubTask extends StatelessWidget {
  const SubTask({
    super.key,
    required this.color,
    required this.onClose,
    required this.value,
    required this.onChanged,
  });

  final Color color;
  final VoidCallback onClose;
  final String value;
  final ValueChanged<String> onChanged;

  @override
  Widget build(BuildContext context) {
    final textStyle = Theme.of(context).textTheme.headlineSmall?.copyWith(
      color: color,
      fontWeight: FontWeight.w500,
    );

    return Row(
      children: [
        Icon(Icons.radio_button_unchecked, color: color, size: 28),
        const SizedBox(width: 14),
        Expanded(
          child: TextFormField(
            initialValue: value,
            style: textStyle,
            cursorColor: color,
            decoration: InputDecoration(
              hintText: 'Enter title',
              hintStyle: textStyle?.copyWith(
                color: color.withValues(alpha: 0.85),
                fontWeight: FontWeight.w400,
              ),
              border: InputBorder.none,
              isDense: true,
              contentPadding: EdgeInsets.zero,
            ),
            onChanged: onChanged,
          ),
        ),
        IconButton(
          onPressed: onClose,
          icon: Icon(Icons.close, color: color),
          visualDensity: VisualDensity.compact,
        ),
      ],
    );
  }
}
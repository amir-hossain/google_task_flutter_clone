import 'package:flutter/material.dart';

class SubTask extends StatelessWidget {
  const SubTask({
    super.key,
    required this.color,
    required this.onClose,
  });

  final Color color;
  final VoidCallback onClose;

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
          child: TextField(
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
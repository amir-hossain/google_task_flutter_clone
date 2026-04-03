import 'package:flutter/material.dart';

class InfoChipRow extends StatelessWidget {
  const InfoChipRow({super.key,
    required this.icon,
    required this.text,
    required this.color,
    this.withClose = false,
  });

  final IconData icon;
  final String text;
  final Color color;
  final bool withClose;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(icon, color: color),
        const SizedBox(width: 14),
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 8),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12),
            border: Border.all(color: color.withValues(alpha: 0.45)),
          ),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                text,
                style: Theme.of(
                  context,
                ).textTheme.titleSmall?.copyWith(color: color),
              ),
              if (withClose) ...[
                const SizedBox(width: 8),
                Icon(Icons.close, size: 16, color: color),
              ],
            ],
          ),
        ),
      ],
    );
  }
}
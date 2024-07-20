import 'package:flutter/material.dart';
import 'package:snack_ordering/theme/colors.dart';

import '../../../models/enums.dart';

class CategoryToggle extends StatelessWidget {
  final ProductCategory category;
  final IconData? icon;
  final bool isActive;
  final Function(ProductCategory) onSelected;
  const CategoryToggle({
    super.key,
    required this.category,
     this.icon,
    this.isActive = false,
    required this.onSelected,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => onSelected(category),
      borderRadius: BorderRadius.circular(28),
      child: Container(
        padding: const EdgeInsets.symmetric(
          horizontal: 16,
          vertical: 20,
        ),
        decoration: BoxDecoration(
          color: isActive ? Colors.black : Colors.transparent,
          borderRadius: BorderRadius.circular(28),
        ),
        child: Row(
          children: [
            if (icon != null)
              Icon(
                icon,
                color: isActive ? kPrimaryColor : Colors.black,
                size: 18,
              ),
            if (icon == null && !isActive)
              Text(
                category.name,
              ),
            const SizedBox(width: 6),
            if (isActive)
              Text(
                category.name,
                style: const TextStyle(color: Colors.white),
              )
          ],
        ),
      ),
    );
  }
}

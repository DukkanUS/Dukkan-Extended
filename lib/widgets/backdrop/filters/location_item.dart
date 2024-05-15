import 'package:flutter/material.dart';

import '../../../models/entities/listing_location.dart';
import 'container_filter.dart';

class LocationItem extends StatelessWidget {
  final ListingLocation location;
  final bool? isSelected;
  final Function? onTap;

  const LocationItem(
    this.location, {
    this.isSelected,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    var primaryText = Theme.of(context).primaryColor;
    var secondColor = Theme.of(context).colorScheme.secondary;
    var selected = isSelected ?? false;
    return GestureDetector(
      onTap: onTap as void Function()?,
      child: ContainerFilter(
        isSelected: selected,
        padding: const EdgeInsets.symmetric(vertical: 13, horizontal: 10.0),
        margin: const EdgeInsets.symmetric(horizontal: 15, vertical: 2)
            .copyWith(left: 20.0),
        child: Row(
          children: <Widget>[
            Icon(
              Icons.check,
              color: selected
                  ? Theme.of(context).primaryColor
                  : Colors.transparent,
              size: 20,
            ),
            const SizedBox(width: 10),
            Expanded(
              child: Text(
                location.name!,
                style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                      color:
                          selected ? primaryText : secondColor.withOpacity(0.8),
                      letterSpacing: 1.2,
                    ),
              ),
            ),
            const SizedBox(width: 20)
          ],
        ),
      ),
    );
  }
}

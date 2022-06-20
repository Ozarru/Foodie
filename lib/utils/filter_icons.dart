import '../models/models.dart';
import 'package:flutter/material.dart';
import 'package:tabler_icons/tabler_icons.dart';

class EatryFilter {
  static const List<FilterIcon> filertIcons = [
    timeIcon,
    locIcon,
    ratingIcon,
    vetIcon,
    // budgetIcon,
    // xpIcon,
  ];

  static const timeIcon = FilterIcon(
    icon: TablerIcons.calendar_time,
    label: 'Active hours',
  );
  static const locIcon = FilterIcon(
    icon: TablerIcons.location,
    label: 'Location',
  );
  static const ratingIcon = FilterIcon(
    icon: Icons.stars,
    label: 'Rating',
  );
  static const vetIcon = FilterIcon(
    icon: Icons.verified_outlined,
    label: 'Verified',
  );
  // static const budgetIcon = FilterIcon(
  //   icon: TablerIcons.wallet,
  //   label: 'Total budget',
  // );
  // static const xpIcon = FilterIcon(
  //   icon: TablerIcons.stars,
  //   label: 'Experience level',
  // );
}

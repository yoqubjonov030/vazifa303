import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class ProfileTabBarRow extends StatelessWidget {
  const ProfileTabBarRow({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      spacing: 5,
      children: [
        Container(
          width: 28,
          height: 28,
          decoration: BoxDecoration(
              color: Color(0xFFFFC6C9),
              borderRadius: BorderRadius.circular(14)),
          child: Center(
            child: SvgPicture.asset(
              "assets/svg/plus.svg",
            ),
          ),
        ),
        Container(
          width: 28,
          height: 28,
          decoration: BoxDecoration(
            color: Color(0xFFFFC6C9),
            borderRadius: BorderRadius.circular(14),
          ),
          child: Center(child: SvgPicture.asset("assets/svg/three_lines.svg")),
        ),
      ],
    );
  }
}

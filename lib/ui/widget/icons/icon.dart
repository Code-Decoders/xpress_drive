import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
part 'icons.dart';

class AppIcon extends StatelessWidget {
  final AppIcons appIcon;
  final Color? color;
  final double? size;
  final double? width;
  const AppIcon(this.appIcon, {Key? key, this.color, this.size, this.width})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SvgPicture.asset('assets/icons/${appIcon.name}.svg',
        color: color, height: size ?? 20, width: size ?? width ?? 20);
  }
}

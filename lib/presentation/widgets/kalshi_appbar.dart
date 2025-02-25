import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class KalshiAppbar extends AppBar {
  KalshiAppbar({super.key});

  @override
  bool? get centerTitle => true;

  @override
  Widget? get title => SvgPicture.asset("assets/images/image.svg");

  @override
  Color? get backgroundColor => Colors.white;
}
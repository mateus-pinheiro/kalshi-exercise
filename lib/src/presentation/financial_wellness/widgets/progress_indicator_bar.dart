import 'package:flutter/material.dart';
import 'package:kalshi_exercise/src/domain/entities/wellness_enum.dart';

class ProgressIndicatorBar extends StatelessWidget {
  final FinancialWellnessStatus status;

  const ProgressIndicatorBar({
    super.key,
    required this.status,
  });

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        return Row(
          children: [
            Expanded(
              child: CustomPaint(
                size: Size(constraints.maxWidth / 3, 20),
                painter: _progressPainter(status, 0),
              ),
            ),
            const SizedBox(width: 8),
            Expanded(
              child: CustomPaint(
                size: Size(constraints.maxWidth / 3, 20),
                painter: _progressPainter(status, 1),
              ),
            ),
            const SizedBox(width: 8),
            Expanded(
              child: CustomPaint(
                size: Size(constraints.maxWidth / 3, 20),
                painter: _progressPainter(status, 2),
              ),
            ),
          ],
        );
      },
    );
  }

  static _CustomShapePainter _progressPainter(
      FinancialWellnessStatus status, int index) {
    Color color = Colors.grey[300]!;

    switch (status) {
      case FinancialWellnessStatus.healthy:
        color = Color.fromRGBO(4, 199, 97, 1);
        break;
      case FinancialWellnessStatus.medium:
        color = index == 0 || index == 1 ? Colors.orange : Colors.grey[300]!;
        break;
      case FinancialWellnessStatus.low:
        color = index == 0 ? Colors.red : Colors.grey[300]!;
        break;
    }

    return _CustomShapePainter(
        color: color, isFirst: index == 0, isLast: index == 2);
  }
}

class _CustomShapePainter extends CustomPainter {
  final Color color;
  final bool isFirst;
  final bool isLast;

  _CustomShapePainter(
      {required this.color, this.isFirst = false, this.isLast = false});

  @override
  void paint(Canvas canvas, Size size) {
    Paint paint = Paint()
      ..color = color
      ..style = PaintingStyle.fill
      ..strokeWidth = 3
      ..strokeJoin = StrokeJoin.round;
    Path path = Path();
    path.moveTo(isFirst ? -0.5 : 0, 0);
    path.quadraticBezierTo(
      (size.width + 0.5) * (isFirst ? -0.14 : 0.12),
      size.height / 2,
      isFirst ? -0.5 : 0.5,
      size.height,
    );
    path.lineTo(size.width + 4, size.height);
    path.quadraticBezierTo(
      size.width * (1.18),
      size.height / 2,
      size.width + 4,
      0,
    );
    path.close();
    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => false;
}

// class RPSCustomPainter extends CustomPainter {
//     @override
//     void paint(Canvas canvas, Size size) {

// Paint paint_0_fill = Paint()..style=PaintingStyle.fill;
// paint_0_fill.color = Colors.black(#ffffff, var(--ge-dark-color, #121212)).withOpacity(1.0);
// canvas.drawRect(Rect.fromLTWH(0,0,size.width*NaN,size.height*NaN),paint_0_fill);

// Path path_1 = Path();
//     path_1.moveTo(20,0);
//     path_1.lineTo(360,0);
//     path_1.quadraticBezierTo(320,40,360,80);
//     path_1.lineTo(20,80);
//     path_1.quadraticBezierTo(-20,40,20,0);
//     path_1.close();

// Paint paint_1_stroke = Paint()..style=PaintingStyle.stroke..strokeWidth=2;
// paint_1_stroke.color=Color(0xffe07a5f).withOpacity(1.0);
// canvas.drawPath(path_1,paint_1_stroke);

// Paint paint_1_fill = Paint()..style=PaintingStyle.fill;
// paint_1_fill.color = Colors.light-dark(rgb(242, 204, 143), rgb(88, 55, 3)).withOpacity(1.0);
// canvas.drawPath(path_1,paint_1_fill);

// }

// @override
// bool shouldRepaint(covariant CustomPainter oldDelegate) {
//     return true;
// }
// }

import 'package:flutter/material.dart';
import 'package:kalshi_exercise/src/domain/entities/account_wellness_enum.dart';

class ProgressIndicatorBar extends StatelessWidget {
  final AccountWellnessStatus status;

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
            const SizedBox(width: 4),
            Expanded(
              child: CustomPaint(
                size: Size(constraints.maxWidth / 3, 20),
                painter: _progressPainter(status, 1),
              ),
            ),
            const SizedBox(width: 4),
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
      AccountWellnessStatus status, int index) {
    Color color = Colors.grey[300]!;

    switch (status) {
      case AccountWellnessStatus.healthy:
        color = Colors.green;
        break;
      case AccountWellnessStatus.medium:
        color = index == 0 || index == 1 ? Colors.orange : Colors.grey[300]!;
        break;
      case AccountWellnessStatus.low:
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
    path.moveTo(0, 0);
    path.quadraticBezierTo(
        size.width * (isFirst ? -0.15 : 0.15), size.height / 2, 0, size.height);
    path.lineTo(size.width, size.height);
    path.quadraticBezierTo(
        size.width * (isLast ? 1.15 : 1.2), size.height / 2, size.width, 0);
    path.close();
    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => false;
}

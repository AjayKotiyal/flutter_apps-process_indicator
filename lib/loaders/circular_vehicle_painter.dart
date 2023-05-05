import 'package:flutter/material.dart';
import 'dart:ui' as ui;

class VehiclePainter extends CustomPainter{
  final Color color ;
  final bool ltr ;

  const VehiclePainter({this.color = Colors.green, this.ltr=true,});

  @override
  void paint(Canvas canvas, Size size) {
    // It is working on 180 X 94 (h X w ) ratio
    // final double wheelDiameter = size.width*(28/180);
    const wFactor = 200, hFactor = 100 ;
    final w = size.width ; //* (180/274) ;
    final h = w * (hFactor/wFactor) ; // (94/180) ;
    final double wheelRadius = w * (16/wFactor);
    final wheelCoverDiameter = wheelRadius*2 + w * (6/wFactor) ;

    print('size=$size | w=$w , h=$h, wheelRadius=$wheelRadius | wheelCoverDiameter=$wheelCoverDiameter');
    // considering image width:height=94:180
    final pnt = Paint()
    // ..style = PaintingStyle.stroke
      ..color = color
      ..strokeWidth=2.0;
    // canvas.drawLine(Offset(10, 10), Offset(120, 200), pnt) ;
    // canvas.drawArc(Rect.fromPoints(Offset(0, 0), Offset(100, 150)), 0, 2, true, pnt);
    // Path wheel = Path()..fillType=PathFillType.evenOdd..addOval(oval)
    // double x = 0.0, y = h*(50/hFactor) ;
    Path wheels = Path()
      ..addOval(Rect.fromCircle(center: Offset(w * (22 / wFactor) + wheelCoverDiameter/2, h * (83 / hFactor)), radius: wheelRadius))
      ..addOval(Rect.fromCircle(center: Offset(w * (102 / wFactor)+ wheelCoverDiameter+wheelCoverDiameter/2, h * (83 / hFactor)), radius: wheelRadius))
    ;
    // Path wheelsInnerCircles = Path()
    //   ..addOval(Rect.fromCircle(center: Offset(w * (22 / wFactor) + wheelCoverDiameter/2, h * (83 / hFactor)), radius: wheelRadius/3))
    //   ..addOval(Rect.fromCircle(center: Offset(w * (102 / wFactor)+ wheelCoverDiameter+wheelCoverDiameter/2, h * (83 / hFactor)), radius: wheelRadius/3))
    // ;
    // final strokePaint = Paint()
    //   ..style=PaintingStyle.stroke
    //   ..color = color
    //   ..strokeWidth=2.0;

    Path mainPath = Path(); // , cirPath = Path();
    // ..fillType = PathFillType.nonZero
    if(ltr) {
      mainPath..relativeLineTo(0, h * (83 / hFactor))
        ..relativeLineTo(w * (22 / wFactor), 0)
        ..relativeArcToPoint(Offset(wheelCoverDiameter, 0), radius: Radius.circular(1),)
      // ..relativeArcToPoint(Offset(w*(36/wFactor),0), radius: Radius.circular(1), )
        ..relativeLineTo(w * (80 / wFactor), 0)
        ..relativeArcToPoint(Offset(wheelCoverDiameter, 0), radius: Radius.circular(1),)
        ..relativeLineTo(w * (22 / wFactor), 0)
        ..relativeLineTo(0, h * (-30 / hFactor))
        ..relativeLineTo(w * (-25 / wFactor), h * (-40 / hFactor))
        ..relativeLineTo(w * (-30 / wFactor), 0)
        ..relativeLineTo(0, h * (40 / hFactor))
        ..relativeLineTo(w * (-5 / wFactor), 0)
        ..relativeLineTo(0, h * (-53 / hFactor))
        ..close() // to origin
      // ..relativeLineTo(w*(-140/wFactor), 0)
        ..relativeMoveTo(w * (25 / wFactor), h * (83 / hFactor))
      // ..relativeArcToPoint(Offset(wheelRadius*2,0), radius: Radius.circular(2), largeArc: true)
      // ..relativeArcToPoint(Offset(-wheelRadius*2,0), radius: Radius.circular(2), largeArc: true)
      //   ..addOval(Rect.fromCircle(center: Offset(w * (22 / wFactor) + wheelCoverDiameter/2, h * (83 / hFactor)), radius: wheelRadius))
      //   ..addOval(Rect.fromCircle(center: Offset(w * (102 / wFactor)+ wheelCoverDiameter+wheelCoverDiameter/2, h * (83 / hFactor)), radius: wheelRadius))
          ;
    }else{
      /// To Make Symmetric Picture:
      /// 1) Move pencil (path) to top-right corner first
      /// 2) Make X-Axis as inverse (opposite) Signed of above of all path elements
      /// 3) wheels will be same
      // mainPath..relativeMoveTo(0, h * (53 / hFactor))
      //   ..relativeLineTo(0, h * (30 / hFactor))
      //   ..relativeLineTo(w * (28 / wFactor), 0)
      //   ..relativeArcToPoint(Offset(wheelCoverDiameter, 0), radius: Radius.circular(1),)
      //   ..relativeLineTo(w * (75 / wFactor), 0)
      //   ..relativeArcToPoint(Offset(wheelCoverDiameter, 0), radius: Radius.circular(1),)
      //   ..relativeLineTo(w * (29 / wFactor), 0)
      //   ..relativeLineTo(0, h * (-83 / hFactor))
      //   ..relativeLineTo(w*(-135/wFactor), 0)
      //   ..relativeLineTo(0, h * (53 / hFactor))
      //   ..relativeLineTo(w * (-5 / wFactor), 0)
      //   ..relativeLineTo(0, h * (-40 / hFactor))
      //   ..relativeLineTo(w * (-25 / wFactor), 0)
      //   ..close()
      //   ..addOval(Rect.fromCircle(center: Offset(w * (28 / wFactor) + wheelCoverDiameter/2, h * (83 / hFactor)), radius: wheelRadius))
      //   ..addOval(Rect.fromCircle(center: Offset(w * (103 / wFactor)+ wheelCoverDiameter+wheelCoverDiameter/2, h * (83 / hFactor)), radius: wheelRadius))
      mainPath
        ..relativeMoveTo(size.width, 0)
        ..relativeLineTo(0, h * (83 / hFactor))
        ..relativeLineTo(w * (-22 / wFactor), 0)
        ..relativeArcToPoint(Offset(-wheelCoverDiameter, 0), radius: Radius.circular(1), clockwise: false)
      // ..relativeArcToPoint(Offset(w*(36/wFactor),0), radius: Radius.circular(1), )
        ..relativeLineTo(w * (-80 / wFactor), 0)
        ..relativeArcToPoint(Offset(-wheelCoverDiameter, 0), radius: Radius.circular(1), clockwise: false)
        ..relativeLineTo(w * (-22 / wFactor), 0)
        ..relativeLineTo(0, h * (-30 / hFactor))
        ..relativeLineTo(w * (25 / wFactor), h * (-40 / hFactor))
        ..relativeLineTo(w * (30 / wFactor), 0)
        ..relativeLineTo(0, h * (40 / hFactor))
        ..relativeLineTo(w * (5 / wFactor), 0)
        ..relativeLineTo(0, h * (-53 / hFactor))
        ..close() // to origin
      // ..addOval(Rect.fromCircle(center: Offset(w * (22 / wFactor) + wheelCoverDiameter/2, h * (83 / hFactor)), radius: wheelRadius))
      // ..addOval(Rect.fromCircle(center: Offset(w * (102 / wFactor)+ wheelCoverDiameter+wheelCoverDiameter/2, h * (83 / hFactor)), radius: wheelRadius))

          ;
      // cirPath..addOval(Rect.fromCircle(center: Offset(w * (28 / wFactor) + wheelCoverDiameter/2, h * (83 / hFactor)), radius: wheelRadius/4))
      //   ..addOval(Rect.fromCircle(center: Offset(w * (103 / wFactor)+ wheelCoverDiameter+wheelCoverDiameter/2, h * (83 / hFactor)), radius: wheelRadius/4))
      // ;

    }
    // canvas.drawCircle(Offset(w * (28 / wFactor) + wheelCoverDiameter/2, h * (83 / hFactor)), wheelRadius/4, pnt) ;
    // pnt.style = PaintingStyle.fill ;
    // canvas.drawCircle(Offset(w * (28 / wFactor) + wheelCoverDiameter/2, h * (83 / hFactor)), wheelRadius, pnt) ;
    // canvas.drawPath(cirPath, strokePaint);
    canvas.drawPath(mainPath, pnt);
    // pnt.strokeWidth = 10 ;
    canvas.drawPath(wheels, pnt);
    // final innerCirclePaint = Paint()..color = Colors.transparent ;
    // canvas.drawPath(wheelsInnerCircles, innerCirclePaint);
    // if(!ltr){
    //   canvas.rotate(2) ;
    // }
    // canvas.translate(100, 50);
    // x = w*(20/wFactor) + wheelRadius ; y = h*(80/hFactor) ;
    // canvas.drawCircle(Offset(x,y), wheelRadius, pnt) ;
    // x = w*(130/wFactor) + wheelRadius ;
    // canvas.drawCircle(Offset(x,y), wheelRadius, pnt) ;
    // pnt.color = Colors.red ;
    // pnt = Paint()
    //   ..style = PaintingStyle.stroke
    //   ..color = Colors.red..strokeWidth=3.0 ;
    // p = Path()..moveTo(50, 50)
    // //   ..arcToPoint(Offset(0, 50), radius: Radius.elliptical(0.25, 0.85), clockwise: false)
    // // ..lineTo(100.0, 200.0)
    // // // ..moveTo(50, 100)
    // ..lineTo(0.0, 100.0)
    // // // ..moveTo(0, 400)
    // // // ..addArc(Rect.fromPoints(Offset(50, 100), Offset(50, 400)), 0.5, 2,)
    // // ..addArc(Rect.fromLTWH(0, 0, 120, 120,), 1.5, 1.5,)
    // // ..addRect(Rect.fromLTWH(0, 0, 120, 120,))
    // // ..addRect(Rect.fromCenter(center: Offset(20, 300), width: 120, height: 120,))
    // // ..arcToPoint(Offset(50, 200), radius: Radius.elliptical(5, 2))
    //     ;
    //
    //
    //
    // canvas.drawPath(p, pnt);
    // canvas.drawCircle(Offset(0,400), 150, pnt);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false ;


}

class VehicleWithBasePainter extends CustomPainter{
  final Color baseColor, vehicleColor ;
  final bool ltr ;
  final double baseFactor, vehicleFactor ;
  final double vehicleWidthFactor=200, vehicleHeightFactor=100 ;

  const VehicleWithBasePainter({this.baseColor = Colors.green, this.vehicleColor = Colors.blueGrey, this.ltr=true, this.baseFactor=5, this.vehicleFactor=1});

  @override
  void paint(Canvas canvas, Size size) {

    print('size=$size');
    final double vehicleWidth = size.width/baseFactor ;
    final vehicleHeight = vehicleWidth * (vehicleHeightFactor/vehicleWidthFactor) ;
    final double baseWidth = size.width/vehicleFactor ;
    final double baseRadius = baseWidth/2 ;
    _drawVehicle(canvas, vehicleWidth, vehicleHeight, vehicleColor, vehicleWidthFactor, vehicleHeightFactor);
    final pnt = Paint()
    // ..style = PaintingStyle.stroke
      ..color = baseColor;
    canvas.drawCircle(Offset(baseRadius,baseRadius), baseRadius, pnt);
  }

  void _drawVehicle(Canvas canvas, double w, double h, Color color, double wFactor, double hFactor){
    // It is working on 180 X 94 (h X w ) ratio
    // final double wheelDiameter = size.width*(28/180);

    // final w = width ; //* (180/274) ;
    // final h = w * (hFactor/wFactor) ; // (94/180) ;
    final double wheelRadius = w * (16/wFactor);
    final wheelCoverDiameter = wheelRadius*2 + w * (6/wFactor) ;

    print('w=$w , h=$h, wheelRadius=$wheelRadius | wheelCoverDiameter=$wheelCoverDiameter');
    // considering image width:height=94:180
    final pnt = Paint()
    // ..style = PaintingStyle.stroke
      ..color = color
      ..strokeWidth=2.0;
    // canvas.drawLine(Offset(10, 10), Offset(120, 200), pnt) ;
    // canvas.drawArc(Rect.fromPoints(Offset(0, 0), Offset(100, 150)), 0, 2, true, pnt);
    // Path wheel = Path()..fillType=PathFillType.evenOdd..addOval(oval)
    // double x = 0.0, y = h*(50/hFactor) ;
    Path wheels = Path()
      ..addOval(Rect.fromCircle(center: Offset(w * (22 / wFactor) + wheelCoverDiameter/2, h * (83 / hFactor)), radius: wheelRadius))
      ..addOval(Rect.fromCircle(center: Offset(w * (102 / wFactor)+ wheelCoverDiameter+wheelCoverDiameter/2, h * (83 / hFactor)), radius: wheelRadius))
    ;
    // Path wheelsInnerCircles = Path()
    //   ..addOval(Rect.fromCircle(center: Offset(w * (22 / wFactor) + wheelCoverDiameter/2, h * (83 / hFactor)), radius: wheelRadius/3))
    //   ..addOval(Rect.fromCircle(center: Offset(w * (102 / wFactor)+ wheelCoverDiameter+wheelCoverDiameter/2, h * (83 / hFactor)), radius: wheelRadius/3))
    // ;
    // final strokePaint = Paint()
    //   ..style=PaintingStyle.stroke
    //   ..color = color
    //   ..strokeWidth=2.0;

    Path mainPath = Path(); // , cirPath = Path();
    // ..fillType = PathFillType.nonZero
    if(ltr) {
      mainPath..relativeLineTo(0, h * (83 / hFactor))
        ..relativeLineTo(w * (22 / wFactor), 0)
        ..relativeArcToPoint(Offset(wheelCoverDiameter, 0), radius: Radius.circular(1),)
      // ..relativeArcToPoint(Offset(w*(36/wFactor),0), radius: Radius.circular(1), )
        ..relativeLineTo(w * (80 / wFactor), 0)
        ..relativeArcToPoint(Offset(wheelCoverDiameter, 0), radius: Radius.circular(1),)
        ..relativeLineTo(w * (22 / wFactor), 0)
        ..relativeLineTo(0, h * (-30 / hFactor))
        ..relativeLineTo(w * (-25 / wFactor), h * (-40 / hFactor))
        ..relativeLineTo(w * (-30 / wFactor), 0)
        ..relativeLineTo(0, h * (40 / hFactor))
        ..relativeLineTo(w * (-5 / wFactor), 0)
        ..relativeLineTo(0, h * (-53 / hFactor))
        ..close() // to origin
      // ..relativeLineTo(w*(-140/wFactor), 0)
        ..relativeMoveTo(w * (25 / wFactor), h * (83 / hFactor))
      // ..relativeArcToPoint(Offset(wheelRadius*2,0), radius: Radius.circular(2), largeArc: true)
      // ..relativeArcToPoint(Offset(-wheelRadius*2,0), radius: Radius.circular(2), largeArc: true)
      //   ..addOval(Rect.fromCircle(center: Offset(w * (22 / wFactor) + wheelCoverDiameter/2, h * (83 / hFactor)), radius: wheelRadius))
      //   ..addOval(Rect.fromCircle(center: Offset(w * (102 / wFactor)+ wheelCoverDiameter+wheelCoverDiameter/2, h * (83 / hFactor)), radius: wheelRadius))
          ;
    }else{
      /// To Make Symmetric Picture:
      /// 1) Move pencil (path) to top-right corner first
      /// 2) Make X-Axis as inverse (opposite) Signed of above of all path elements
      /// 3) wheels will be same
      // mainPath..relativeMoveTo(0, h * (53 / hFactor))
      //   ..relativeLineTo(0, h * (30 / hFactor))
      //   ..relativeLineTo(w * (28 / wFactor), 0)
      //   ..relativeArcToPoint(Offset(wheelCoverDiameter, 0), radius: Radius.circular(1),)
      //   ..relativeLineTo(w * (75 / wFactor), 0)
      //   ..relativeArcToPoint(Offset(wheelCoverDiameter, 0), radius: Radius.circular(1),)
      //   ..relativeLineTo(w * (29 / wFactor), 0)
      //   ..relativeLineTo(0, h * (-83 / hFactor))
      //   ..relativeLineTo(w*(-135/wFactor), 0)
      //   ..relativeLineTo(0, h * (53 / hFactor))
      //   ..relativeLineTo(w * (-5 / wFactor), 0)
      //   ..relativeLineTo(0, h * (-40 / hFactor))
      //   ..relativeLineTo(w * (-25 / wFactor), 0)
      //   ..close()
      //   ..addOval(Rect.fromCircle(center: Offset(w * (28 / wFactor) + wheelCoverDiameter/2, h * (83 / hFactor)), radius: wheelRadius))
      //   ..addOval(Rect.fromCircle(center: Offset(w * (103 / wFactor)+ wheelCoverDiameter+wheelCoverDiameter/2, h * (83 / hFactor)), radius: wheelRadius))
      mainPath
        ..relativeMoveTo(w, 0)
        ..relativeLineTo(0, h * (83 / hFactor))
        ..relativeLineTo(w * (-22 / wFactor), 0)
        ..relativeArcToPoint(Offset(-wheelCoverDiameter, 0), radius: Radius.circular(1), clockwise: false)
      // ..relativeArcToPoint(Offset(w*(36/wFactor),0), radius: Radius.circular(1), )
        ..relativeLineTo(w * (-80 / wFactor), 0)
        ..relativeArcToPoint(Offset(-wheelCoverDiameter, 0), radius: Radius.circular(1), clockwise: false)
        ..relativeLineTo(w * (-22 / wFactor), 0)
        ..relativeLineTo(0, h * (-30 / hFactor))
        ..relativeLineTo(w * (25 / wFactor), h * (-40 / hFactor))
        ..relativeLineTo(w * (30 / wFactor), 0)
        ..relativeLineTo(0, h * (40 / hFactor))
        ..relativeLineTo(w * (5 / wFactor), 0)
        ..relativeLineTo(0, h * (-53 / hFactor))
        ..close() // to origin
      // ..addOval(Rect.fromCircle(center: Offset(w * (22 / wFactor) + wheelCoverDiameter/2, h * (83 / hFactor)), radius: wheelRadius))
      // ..addOval(Rect.fromCircle(center: Offset(w * (102 / wFactor)+ wheelCoverDiameter+wheelCoverDiameter/2, h * (83 / hFactor)), radius: wheelRadius))

          ;
      // cirPath..addOval(Rect.fromCircle(center: Offset(w * (28 / wFactor) + wheelCoverDiameter/2, h * (83 / hFactor)), radius: wheelRadius/4))
      //   ..addOval(Rect.fromCircle(center: Offset(w * (103 / wFactor)+ wheelCoverDiameter+wheelCoverDiameter/2, h * (83 / hFactor)), radius: wheelRadius/4))
      // ;

    }
    // canvas.drawCircle(Offset(w * (28 / wFactor) + wheelCoverDiameter/2, h * (83 / hFactor)), wheelRadius/4, pnt) ;
    // pnt.style = PaintingStyle.fill ;
    // canvas.drawCircle(Offset(w * (28 / wFactor) + wheelCoverDiameter/2, h * (83 / hFactor)), wheelRadius, pnt) ;
    // canvas.drawPath(cirPath, strokePaint);
    canvas.drawPath(mainPath, pnt);
    // pnt.strokeWidth = 10 ;
    canvas.drawPath(wheels, pnt);
    // final innerCirclePaint = Paint()..color = Colors.transparent ;
    // canvas.drawPath(wheelsInnerCircles, innerCirclePaint);
    // if(!ltr){
    //   canvas.rotate(2) ;
    // }
    // canvas.translate(100, 50);
    // x = w*(20/wFactor) + wheelRadius ; y = h*(80/hFactor) ;
    // canvas.drawCircle(Offset(x,y), wheelRadius, pnt) ;
    // x = w*(130/wFactor) + wheelRadius ;
    // canvas.drawCircle(Offset(x,y), wheelRadius, pnt) ;
    // pnt.color = Colors.red ;
    // pnt = Paint()
    //   ..style = PaintingStyle.stroke
    //   ..color = Colors.red..strokeWidth=3.0 ;
    // p = Path()..moveTo(50, 50)
    // //   ..arcToPoint(Offset(0, 50), radius: Radius.elliptical(0.25, 0.85), clockwise: false)
    // // ..lineTo(100.0, 200.0)
    // // // ..moveTo(50, 100)
    // ..lineTo(0.0, 100.0)
    // // // ..moveTo(0, 400)
    // // // ..addArc(Rect.fromPoints(Offset(50, 100), Offset(50, 400)), 0.5, 2,)
    // // ..addArc(Rect.fromLTWH(0, 0, 120, 120,), 1.5, 1.5,)
    // // ..addRect(Rect.fromLTWH(0, 0, 120, 120,))
    // // ..addRect(Rect.fromCenter(center: Offset(20, 300), width: 120, height: 120,))
    // // ..arcToPoint(Offset(50, 200), radius: Radius.elliptical(5, 2))
    //     ;
    //
    //
    //
    // canvas.drawPath(p, pnt);
    // canvas.drawCircle(Offset(0,400), 150, pnt);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false ;
  
}

class SvgVehiclePainter extends CustomPainter {
  // final Color color;
  final ui.Image svg ;
  SvgVehiclePainter(this.svg);

  @override
  void paint(Canvas canvas, Size size) {
    Paint p = Paint()..color = Colors.deepPurple ;
    canvas.drawImage(svg, const Offset(0,0), p) ;
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false ;
}

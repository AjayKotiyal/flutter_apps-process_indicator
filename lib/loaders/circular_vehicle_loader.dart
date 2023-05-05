import 'package:flutter/material.dart';
import 'package:process_indicator/loaders/circular_vehicle_painter.dart';
import 'dart:ui' as ui ;
import 'dart:math' as math;

class CircularVehicleLoader extends StatefulWidget { //extends ProcessLoader
  final Color vehicleColor, baseColor ;
  final double size ;

  const CircularVehicleLoader({super.key, required this.vehicleColor, required this.baseColor, this.size=80.0}) ;

  @override
  State<CircularVehicleLoader> createState() => _CircularVehicleLoaderState();
}

class _CircularVehicleLoaderState extends State<CircularVehicleLoader> {
  final _totalAngle = math.pi*2 ;
  double _startAngle=0.0;
  late double _endAngle;
  late final double _vehicleWidth, _vehicleHeight, _baseRadius, _halfSize  ;
  // late final Offset _rotationOrigin ;

  @override
  void initState() {
    _halfSize = widget.size/2 ;
    _endAngle =  _totalAngle ;
    _vehicleWidth = widget.size / 3 ;
    _vehicleHeight = widget.size / 5 ;
    _baseRadius = _halfSize - _vehicleHeight ;
    // _rotationOrigin = Offset(0, _baseRadius) ; //Offset(0, (widget.size-_vehicleHeight)/2) ;
    debugPrint('CircularVehicleLoader: initState(): size=${widget.size} | _vehicleWidth=$_vehicleWidth | _vehicleHeight=$_vehicleHeight | _baseRadius=$_baseRadius | _endAngle=$_endAngle');
    // debugPrint('CircularVehicleLoader: initState(): _rotationOrigin=$_rotationOrigin');
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    debugPrint('CircularVehicleLoader: build(): _endAngle=$_endAngle');
    return Center(
      child: Container(
        width: widget.size, height: widget.size,
        // padding: EdgeInsets.all(30.0),
        decoration: BoxDecoration(border: Border.all(color: Colors.red)),
        // child: SizedBox(
        //   width: _vehicleWidth, //widget.size,
        //   height: _vehicleHeight, //widget.size,
          child: CustomPaint(
            size: ui.Size(100, 50), // Size(widget.size, widget.size),
            painter: VehiclePainter(color: widget.vehicleColor),
            // painter: VehicleWithBasePainter(vehicleColor: widget.vehicleColor),
            // child: const CircleAvatar(radius: 25, backgroundColor: Colors.blue,),
          ),
        // ),
        // child: TweenAnimationBuilder<double>(
        //   tween: Tween<double>(begin: _startAngle, end: _endAngle),
        //   duration: Duration(milliseconds: 4000),
        //   child: FittedBox(
        //     child: SizedBox(
        //       width: _vehicleWidth, //widget.size,
        //       height: _vehicleHeight, //widget.size,
        //       child: CustomPaint(
        //         size: Size(_vehicleWidth, _vehicleHeight),
        //         painter: VehicleWithBasePainter(vehicleColor: widget.vehicleColor),
        //         // child: CircleAvatar(radius: 25,),
        //       ),
        //     ),
        //   ),
        //   builder: (BuildContext context, double angle, Widget? child) {
        //     // return child ?? SizedBox();
        //     return Transform.rotate(
        //       angle: angle,
        //       alignment: Alignment.center, //bottomCenter, //topCenter,
        //       // origin: Offset(0,_baseRadius+_vehicleHeight),
        //       // origin: _rotationOrigin, //Offset(_baseRadius,_baseRadius),
        //       // origin: Offset(_baseRadius+_vehicleHeight,_baseRadius+_vehicleHeight),
        //       child: child,
        //     );
        //   },
        //   onEnd: ()=>setState(() {
        //     // startAngle=0.0; endAngle = math.pi*2 ;
        //     _endAngle += _totalAngle ;
        //   }),
        // ),
      ),
    );
  }

}

// class _CircularVehicleLoaderState extends State<CircularVehicleLoader> {
//   final _totalAngle = math.pi*2 ;
//   double _startAngle=0.0;
//   late double _endAngle;
//   late final double _vehicleWidth, _vehicleHeight, _baseRadius, _halfSize  ;
//   // late final Offset _rotationOrigin ;
//
//   @override
//   void initState() {
//     _halfSize = widget.size/2 ;
//     _endAngle =  _totalAngle ;
//     _vehicleWidth = widget.size / 3 ;
//     _vehicleHeight = widget.size / 5 ;
//     _baseRadius = _halfSize - _vehicleHeight ;
//     // _rotationOrigin = Offset(0, _baseRadius) ; //Offset(0, (widget.size-_vehicleHeight)/2) ;
//     debugPrint('CircularVehicleLoader: initState(): _vehicleWidth=$_vehicleWidth | _vehicleHeight=$_vehicleHeight | _baseRadius=$_baseRadius | _endAngle=$_endAngle');
//     // debugPrint('CircularVehicleLoader: initState(): _rotationOrigin=$_rotationOrigin');
//     super.initState();
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     debugPrint('CircularVehicleLoader: build(): _endAngle=$_endAngle');
//     return Center(
//       child: Container(
//         width: widget.size, height: widget.size,
//         decoration: BoxDecoration(border: Border.all(color: Colors.red)),
//         child: TweenAnimationBuilder<double>(
//           tween: Tween<double>(begin: _startAngle, end: _endAngle),
//           duration: Duration(milliseconds: 4000),
//           child: Column(
//             children: [
//               FittedBox(
//                 child: SizedBox(
//                   width: _vehicleWidth, //widget.size,
//                   height: _vehicleHeight, //widget.size,
//                   child: CustomPaint(
//                     size: Size(_vehicleWidth, _vehicleHeight),
//                     painter: VehiclePainter(color: widget.vehicleColor),
//                     // child: CircleAvatar(radius: 25,),
//                   ),
//                 ),
//               ),
//               Expanded(
//                 child: CircleAvatar(
//                   radius: _baseRadius,
//                   backgroundColor: widget.baseColor,
//                 ),
//               ),
//               SizedBox(
//                 width: _vehicleWidth, //widget.size,
//                 height: _vehicleHeight, //widget.size,
//               ),
//             ],
//           ),
//           builder: (BuildContext context, double angle, Widget? child) {
//             // return child ?? SizedBox();
//             return Transform.rotate(
//               angle: angle,
//               alignment: Alignment.center, //bottomCenter, //topCenter,
//               // origin: Offset(0,_baseRadius+_vehicleHeight),
//               // origin: _rotationOrigin, //Offset(_baseRadius,_baseRadius),
//               // origin: Offset(_baseRadius+_vehicleHeight,_baseRadius+_vehicleHeight),
//               child: child,
//             );
//           },
//           onEnd: ()=>setState(() {
//             // startAngle=0.0; endAngle = math.pi*2 ;
//             _endAngle += _totalAngle ;
//           }),
//         ),
//       ),
//     );
//   }
//   // @override
//   // Widget build(BuildContext context) {
//   //   debugPrint('CircularVehicleLoader: build(): _endAngle=$_endAngle');
//   //   return Center(
//   //     child: Container(
//   //       width: widget.size, height: widget.size,
//   //       decoration: BoxDecoration(border: Border.all(color: Colors.red)),
//   //       child: Stack(
//   //         children: [
//   //           Positioned(
//   //             left: _vehicleHeight,
//   //             top: _vehicleHeight,
//   //             child: CircleAvatar(
//   //               radius: _baseRadius,
//   //               backgroundColor: widget.baseColor,
//   //             ),
//   //             // child: Container(
//   //             //   width: _baseWidth, height: _baseWidth,
//   //             //   decoration: BoxDecoration(borderRadius: BorderRadius.circular(45.0), color: widget.baseColor),
//   //             // ),
//   //           ),
//   //           Positioned(
//   //             top: 0.0,
//   //             left:  _halfSize - _vehicleWidth/2,
//   //             child: TweenAnimationBuilder<double>(
//   //               tween: Tween<double>(begin: _startAngle, end: _endAngle),
//   //               duration: Duration(milliseconds: 4000),
//   //               child: FittedBox(
//   //                 child: Container(
//   //                   width: _vehicleWidth, //widget.size,
//   //                   height: _vehicleHeight, //widget.size,
//   //                   child: CustomPaint(
//   //                     size: Size(_vehicleWidth, _vehicleHeight),
//   //                     painter: VehiclePainter(color: widget.vehicleColor),
//   //                     // child: CircleAvatar(radius: 25,),
//   //                   ),
//   //                 ),
//   //               ),
//   //               builder: (BuildContext context, double angle, Widget? child) {
//   //                 // return child ?? SizedBox();
//   //                 return Transform.rotate(
//   //                   angle: angle,
//   //                   alignment: Alignment.bottomCenter, //topCenter,
//   //                   // origin: Offset(0,_baseRadius+_vehicleHeight),
//   //                   origin: _rotationOrigin, //Offset(_baseRadius,_baseRadius),
//   //                   // origin: Offset(_baseRadius+_vehicleHeight,_baseRadius+_vehicleHeight),
//   //                   child: child,
//   //                 );
//   //               },
//   //               onEnd: ()=>setState(() {
//   //                 // startAngle=0.0; endAngle = math.pi*2 ;
//   //                 _endAngle += _totalAngle ;
//   //               }),
//   //             ),
//   //             // child: FittedBox(
//   //             //   child: Container(
//   //             //     width: _vehicleWidth, //widget.size,
//   //             //     height: _vehicleHeight, //widget.size,
//   //             //     child: CustomPaint(
//   //             //       size: Size(_vehicleWidth, _vehicleHeight),
//   //             //       painter: VehiclePainter(widget.vehicleColor),
//   //             //       // child: CircleAvatar(radius: 25,),
//   //             //     ),
//   //             //   ),
//   //             // ),
//   //           ),
//   //         ],
//   //       ),
//   //     ),
//   //   );
//   // }
// }


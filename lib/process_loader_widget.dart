import 'package:flutter/material.dart';


// abstract class ProcessLoader extends StatefulWidget {
//   const ProcessLoader({super.key, required Widget loader}) ;
//
// // @override
// // State<ProcessLoader> createState() => _ProcessLoaderState();
// }

class ProcessLoader extends StatefulWidget {
  final Widget loader ;
  const ProcessLoader({super.key, required this.loader}) ;

  @override
  State<ProcessLoader> createState() => _ProcessLoaderState();
}

class _ProcessLoaderState extends State<ProcessLoader> {
  @override
  // Widget build(BuildContext context) => widget.loader ;
  Widget build(BuildContext context) {
    return SizedBox.expand(
      child: Opacity(
        opacity: 0.5,
        child: widget.loader,
      ),
    );
  }
}





import 'package:flutter/material.dart';
import 'package:process_indicator/process_loader_widget.dart';

class ProcessIndicatorInheritedWidget extends InheritedWidget {
  ProcessIndicatorInheritedWidget({
    super.key,
    required this.overlayEntry,
    // T loaderWidget,
    required super.child,
  }) ;
  // :entry = ProcessIndicatorOverlayEntry(loader: );
  // entry = ProcessIndicatorOverlayEntry(loader: );

  ProcessIndicatorOverlayEntry overlayEntry;

  static ProcessIndicatorInheritedWidget? of<T extends ProcessLoader>(BuildContext context) {
    final ProcessIndicatorInheritedWidget? result = context.dependOnInheritedWidgetOfExactType<ProcessIndicatorInheritedWidget>();
    assert(result != null, 'No ProcessIndicatorInheritedWidget found in context');
    return result!;
  }

  @override
  bool updateShouldNotify(ProcessIndicatorInheritedWidget old) => overlayEntry.loader != old.overlayEntry.loader ; // color != old.color;
}

class ProcessIndicatorOverlayEntry extends OverlayEntry {
  Widget loader ;
  // ProcessIndicatorOverlayEntry({required super.builder, });
  ProcessIndicatorOverlayEntry({required this.loader, }) : super(builder: (BuildContext context) => ProcessLoader(loader: loader), );
}
// class ProcessIndicatorOverlayEntry<T extends ProcessLoader> extends OverlayEntry {
//   T loader ;
//   // ProcessIndicatorOverlayEntry({required super.builder, });
//   ProcessIndicatorOverlayEntry({required this.loader, }) : super(builder: (BuildContext context) => loader, opaque: true);
// }


class ProcessIndicator {
  static void show(BuildContext context, {
    ProcessLoader? loaderWidget ,
    // ProcessLoader loaderWidget = const CircularVehicleLoader(vehicleColor: Colors.blueGrey, baseColor: Colors.green, size: 120.0,),
  }
      ){
    ProcessIndicatorInheritedWidget? indicatorInheritedWidget = ProcessIndicatorInheritedWidget.of(context) ;
    if(indicatorInheritedWidget == null){
      return ;
    }
    if(loaderWidget != null) {
      indicatorInheritedWidget.overlayEntry.loader = loaderWidget;
    }
    // OverlayEntry loaderEntry = OverlayEntry(builder: (BuildContext context) => loaderWidget );
    Overlay.of(context)?.insert(indicatorInheritedWidget.overlayEntry);
    // Overlay.of(context)?.insert(indicatorInheritedWidget.overlayEntry);
  }

  static void hide(BuildContext context){
    ProcessIndicatorInheritedWidget.of(context)?.overlayEntry.remove();
  }

}
import 'package:flutter/material.dart';
import 'package:flutter_template/widget/general/responsive/device_screen_type.dart';
import 'package:flutter_template/widget/general/responsive/sizing_information.dart';

class ResponsiveWidget extends StatelessWidget {
  final WidgetBuilder mobileBuilder;
  final WidgetBuilder tabletBuilder;
  final WidgetBuilder mobileLandscapeBuilder;
  final WidgetBuilder tabletLandscapeBuilder;
  final Widget Function(BuildContext context, SizeInformation sizeInformation) builder;

  const ResponsiveWidget({
    this.mobileBuilder,
    this.tabletBuilder,
    this.mobileLandscapeBuilder,
    this.tabletLandscapeBuilder,
    this.builder,
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context);
    return LayoutBuilder(builder: (context, boxSizing) {
      final info = SizeInformation(
        orientation: mediaQuery.orientation,
        deviceType: getDeviceType(mediaQuery),
        screenSize: mediaQuery.size,
        localWidgetSize: Size(boxSizing.maxWidth, boxSizing.maxHeight),
      );
      if (info.orientation == Orientation.landscape && info.deviceType == DeviceScreenType.Tablet && tabletLandscapeBuilder != null) {
        return tabletLandscapeBuilder(context);
      } else if (info.deviceType == DeviceScreenType.Tablet && tabletBuilder != null) {
        return tabletBuilder(context);
      } else if (info.orientation == Orientation.landscape && mobileLandscapeBuilder != null) {
        return mobileLandscapeBuilder(context);
      } else if (mobileBuilder != null) {
        return mobileBuilder(context);
      } else if (builder != null) {
        return builder(context, info);
      }
      throw Exception('Failed to build Responsive Widget');
    });
  }

  DeviceScreenType getDeviceType(MediaQueryData mediaQuery) {
    final orientation = mediaQuery.orientation;
    var deviceWidth = 0.0;
    if (orientation == Orientation.landscape) {
      deviceWidth = mediaQuery.size.height;
    } else {
      deviceWidth = mediaQuery.size.width;
    }
    if (deviceWidth > 600) {
      return DeviceScreenType.Tablet;
    }
    return DeviceScreenType.Mobile;
  }
}

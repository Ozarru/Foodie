import 'dart:convert';
import 'dart:async';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:google_maps_widget/google_maps_widget.dart';
import '../../env/env.dart';
import '/widgets/widgets.dart';
import '/utils/utils.dart';
import '/models/models.dart';

class CourierHome extends StatefulWidget {
  const CourierHome({super.key});

  @override
  State<CourierHome> createState() => _CourierHomeState();
}

class _CourierHomeState extends State<CourierHome> {
  var curLocation;

  @override
  void initState() {
    super.initState();
    getLocation();
    showPins();
  }

  void showPins() async {
    await curLocation;
    _markers.add(Marker(
      markerId: const MarkerId('Location'),
      position: curLocation,
      icon: BitmapDescriptor.defaultMarker,
      infoWindow: const InfoWindow(
        title: "You're here!!!'",
        snippet: 'Current location',
      ),
    ));
    setState(() {});
  }

// get location
  Future<LatLng> getLocation() async {
    var position = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high);
    var curLat = position.latitude, curLng = position.longitude;

    setState(() {
      curLocation = LatLng(curLat, curLng);
    });
    debugPrint('location = $curLocation');
    return curLocation;
  }

  final Completer<GoogleMapController> _controller = Completer();
  late BitmapDescriptor locIcon;
  late BitmapDescriptor desIcon;
  final Set<Marker> _markers = <Marker>{};

  @override
  Widget build(BuildContext context) {
    List<TestOrder> orders = localOrders;

    final LatLng targetLoc = curLocation ?? const LatLng(6.1256, 1.2254);
    const double camZoom = 14;
    const double camTilt = 80;
    const double camBear = 30;
    late var initialCamPosition = CameraPosition(
        target: targetLoc, zoom: camZoom, tilt: camTilt, bearing: camBear);
    return Scaffold(
      body: SafeArea(
        child: Stack(
          fit: StackFit.expand,
          children: [
            // const GoogleMapsWidget(
            //   apiKey: googleAPIKey,
            //   sourceLatLng: LatLng(40.484000837597925, -3.369978368282318),
            //   destinationLatLng: LatLng(40.48017307700204, -3.3618026599287987),
            // ),
            GoogleMap(
                myLocationButtonEnabled: true,
                myLocationEnabled: true,
                zoomControlsEnabled: false,
                compassEnabled: true,
                mapType: MapType.normal,
                initialCameraPosition: initialCamPosition,
                // markers: _markers,
                onMapCreated: (controller) {
                  _controller.complete(controller);
                  showPins();
                }),
            Positioned(
              bottom: 10,
              left: 0,
              right: 0,
              child: Container(
                  padding: const EdgeInsets.symmetric(vertical: 8),
                  height: 160,
                  width: double.infinity,
                  child: buildOrders(orders, context)),
            )
          ],
        ),
      ),
    );
  }

  Widget buildOrders(orders, context) {
    if (Responsive.isMobile(context)) {
      return OrdersList(orders: orders);
    } else if (Responsive.isTablet(context)) {
      return OrdersList(orders: orders);
    } else if (Responsive.isDesktop(context)) {
      return OrdersList(orders: orders);
    } else if (Responsive.isWideDesktop(context)) {
      return OrdersList(orders: orders);
    } else {
      return OrdersList(orders: orders);
    }
  }
}

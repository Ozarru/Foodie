import 'dart:convert';
import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_maps_widget/google_maps_widget.dart';
import 'package:tabler_icons/icon_data.dart';
import 'package:tabler_icons/tabler_icons.dart';
import 'package:get/get.dart';

import '../../env/env.dart';
import '../../models/models.dart';
import '../../utils/utils.dart';
import '../../widgets/widgets.dart';

class ClientOrderDetails extends StatefulWidget {
  const ClientOrderDetails({Key? key, required this.order}) : super(key: key);

  final TestOrder order;

  @override
  State<ClientOrderDetails> createState() => _ClientOrderDetailsState();
}

class _ClientOrderDetailsState extends State<ClientOrderDetails> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CourierAppBar(
          title: "My order from "
              '${widget.order.eatry}'),
      body: Stack(
        fit: StackFit.expand,
        children: [
          // GoogleMap(
          //     myLocationButtonEnabled: true,
          //     myLocationEnabled: true,
          //     zoomControlsEnabled: false,
          //     compassEnabled: true,
          //     mapType: MapType.normal,
          //     initialCameraPosition: initialCamPosition,
          //     markers: _markers,
          //     // polylines: {_kPolyline},
          //     polylines: _polylines,
          //     onMapCreated: (controller) {
          //       _controller.complete(controller);
          //       showPins();
          //       setPolylines();
          //     }),

          GoogleMapsWidget(
            apiKey: googleAPIKey,
            sourceLatLng: LatLng(widget.order.startLat, widget.order.startLng),
            destinationLatLng:
                LatLng(widget.order.stopLat, widget.order.stopLng),
            showPolyline: true,
            routeWidth: 2,
          ),
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: buildDetails(context, widget.order),
          ),
        ],
      ),
    );
  }

  Widget buildDetails(context, order) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 4, horizontal: 8),
      width: double.infinity,
      height: 220,
      decoration: BoxDecoration(
        borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(24), topRight: Radius.circular(24)),
        color: Colors.grey[900],
      ),
      child: Column(
        children: [
          Container(
            padding: const EdgeInsets.symmetric(vertical: 12),
            child: Column(
              children: [
                Text('Estimated time of delivery is 10:30 AM',
                    style: Theme.of(context)
                        .textTheme
                        .headline6!
                        .copyWith(color: Colors.grey[200])),
                const SizedBox(height: 10),
                Text('Your order is already on its way to you!',
                    style: Theme.of(context)
                        .textTheme
                        .bodySmall!
                        .copyWith(color: Colors.grey[500])),
              ],
            ),
          ),
          const Divider(
            color: Colors.grey,
          ),
          Container(
            padding: const EdgeInsets.symmetric(vertical: 8),
            // Stepper(type: StepperType.horizontal, steps: getSteps()),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: const [
                Icon(TablerIcons.receipt, color: Colors.lime),
                Icon(FontAwesomeIcons.kitchenSet, color: Colors.lime),
                Icon(Icons.delivery_dining, color: Colors.lime),
                Icon(Icons.check_circle, color: Colors.grey),
              ],
            ),
          ),
          const Divider(
            color: Colors.grey,
          ),
          Expanded(
            child: ListTile(
              leading: const CircleAvatar(
                  backgroundImage: AssetImage('assets/static/man.webp')),
              title: Text('Ozarru',
                  style: Theme.of(context)
                      .textTheme
                      .headline5!
                      .copyWith(color: Colors.grey[200])),
              subtitle: Text('Courier',
                  style: Theme.of(context)
                      .textTheme
                      .headline6!
                      .copyWith(color: Colors.grey[500])),
              trailing: SizedBox(
                  width: 140,
                  child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Container(
                          padding: const EdgeInsets.all(8),
                          decoration: BoxDecoration(
                              color: Colors.grey[200],
                              borderRadius: BorderRadius.circular(20)),
                          child: const Icon(
                            TablerIcons.phone_call,
                            color: Colors.black,
                            size: 20,
                          ),
                        ),
                        Container(
                          padding: const EdgeInsets.all(8),
                          decoration: BoxDecoration(
                              color: Colors.grey[200],
                              borderRadius: BorderRadius.circular(20)),
                          child: const Icon(
                            TablerIcons.message_circle_2,
                            color: Colors.black,
                            size: 20,
                          ),
                        ),
                      ])),
            ),
          )
        ],
      ),
    );
  }

  List<Step> getSteps() => const [
        Step(content: Text('Ordered'), title: Icon(Icons.receipt_long)),
        Step(content: Text('Cooked'), title: Icon(Icons.food_bank)),
        Step(content: Text('On the way'), title: Icon(Icons.delivery_dining)),
        Step(content: Text('Delivered'), title: Icon(Icons.check_circle)),
      ];
}

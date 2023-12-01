import 'dart:async';
import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:flutter_naver_map/flutter_naver_map.dart';

import 'package:percent_indicator/circular_percent_indicator.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';

import 'hospital_provider.dart';
import 'list_display.dart';

class HospitalMap extends StatefulWidget {
  const HospitalMap(this.whereToGo, {Key? key}) : super(key: key);

  final String whereToGo;

  @override
  _HospitalMapState createState() => _HospitalMapState();
}

class _HospitalMapState extends State<HospitalMap> {
  final HospitalProvider hospitalProvider = HospitalProvider();

  @override
  Widget build(BuildContext context) {
    final Completer<NaverMapController> mapControllerCompleter = Completer();

    return FutureBuilder(
      future: _init(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return _buildLoadingScreen();
        } else if (snapshot.hasError) {
          return Text('Error: ${snapshot.error}');
        } else {
          return _buildMainScreen(mapControllerCompleter);
        }
      },
    );
  }

  Widget _buildLoadingScreen() {
    return MaterialApp(
      home: Scaffold(
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                "가까운 병원들을 찾고 있어요",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25),
              ),
              const SizedBox(height: 20),
              CircularPercentIndicator(
                animation: true,
                animationDuration: 5000,
                restartAnimation: true,
                percent: 1.0,
                progressColor: Colors.greenAccent,
                radius: 45.0,
                lineWidth: 12.0,
              ),
              const SizedBox(height: 20),
              const Text(""),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildMainScreen(
      Completer<NaverMapController> mapControllerCompleter) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('병원찾기'),
        ),
        body: SlidingUpPanel(
          panel: ListDisplay(
              hospitalProvider.getHospitalCodeList(widget.whereToGo)),
          body: Padding(
            padding: const EdgeInsets.only(bottom: 180.0),
            child: NaverMap(
              options: NaverMapViewOptions(
                initialCameraPosition: NCameraPosition(
                  target: NLatLng(
                    hospitalProvider.lat,
                    hospitalProvider.long,
                  ),
                  zoom: 12,
                ),
                mapType: NMapType.basic,
                extent: const NLatLngBounds(
                  southWest: NLatLng(31.43, 122.37),
                  northEast: NLatLng(44.35, 132.0),
                ),
                indoorEnable: true,
                locationButtonEnable: true,
                consumeSymbolTapEvents: false,
              ),
              onMapReady: (controller) async {
                controller.getLocationTrackingMode();
                controller.getLocationOverlay();

                _addCurrentLocationMarker(controller);

                if (hospitalProvider.markers.isNotEmpty) {
                  controller.addOverlayAll(hospitalProvider.markers);
                }

                mapControllerCompleter.complete(controller);
                log("onMapReady", name: "onMapReady");
              },
              onCameraIdle: () {},
            ),
          ),
        ),
      ),
    );
  }

  void _addCurrentLocationMarker(NaverMapController controller) {
    NMarker currMarker = NMarker(
      id: "현재위치",
      position: NLatLng(
        hospitalProvider.lat,
        hospitalProvider.long,
      ),
      iconTintColor: Colors.transparent,
    );
    final onMarkerInfoWindow = NInfoWindow.onMarker(
      id: currMarker.info.id,
      text: currMarker.info.id,
    );
    currMarker.setOnTapListener((overlay) async {
      if (await currMarker.hasOpenInfoWindow()) {
        onMarkerInfoWindow.close();
      } else {
        currMarker.openInfoWindow(onMarkerInfoWindow);
      }
    });
    controller.addOverlay(currMarker);
    currMarker.openInfoWindow(onMarkerInfoWindow);
  }

  Future<void> _init() async {
    await hospitalProvider.getLoc();
    await hospitalProvider.loadLocation();
    await hospitalProvider.loadMarker(widget.whereToGo);
  }
}

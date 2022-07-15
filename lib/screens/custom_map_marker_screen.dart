import 'package:clippy_flutter/triangle.dart';
import 'package:custom_info_window/custom_info_window.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';


class PointObject {
  final Widget child;
  final LatLng location;

  PointObject({required this.child, required this.location});
}


class CustomMapMarkerScreen extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<CustomMapMarkerScreen> {

  CustomInfoWindowController _customInfoWindowController = CustomInfoWindowController();


  @override
  void dispose() {
    _customInfoWindowController.dispose();
    super.dispose();
  }


  final LatLng _latLng = LatLng(28.7041, 77.1025);
  final LatLng _latLng1 = LatLng(28.1041, 77.5025);
  final LatLng _latLng2 = LatLng(28.4041, 77.5225);
  final double _zoom = 15.0;
  Set<Marker> _markers = {};



  @override
  Widget build(BuildContext context) {
    _markers.add(
      Marker(
        markerId: MarkerId("marker_id"),
        position: _latLng,
        onTap: () {
          _customInfoWindowController.addInfoWindow!(
            Column(
              children: [
                Expanded(
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.blue,
                      borderRadius: BorderRadius.circular(4),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                            Icons.account_circle,
                            color: Colors.white,
                            size: 30,
                          ),
                          SizedBox(
                            width: 8.0,
                          ),
                          Text(
                            "I am here",
                            style:
                            Theme.of(context).textTheme.headline6!.copyWith(
                              color: Colors.white,
                            ),
                          )
                        ],
                      ),
                    ),
                    width: double.infinity,
                    height: double.infinity,
                  ),
                ),
                Triangle.isosceles(
                  edge: Edge.BOTTOM,
                  child: Container(
                    color: Colors.blue,
                    width: 20.0,
                    height: 10.0,
                  ),
                ),
              ],
            ),
            _latLng,
          );
        },
      ),
    );

    _markers.add(
      Marker(
        markerId: MarkerId("marker_id1"),
        position: _latLng1,
        onTap: () {
          _customInfoWindowController.addInfoWindow!(
            Column(
              children: [
                Expanded(
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.blue,
                      borderRadius: BorderRadius.circular(4),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                            Icons.account_circle,
                            color: Colors.white,
                            size: 30,
                          ),
                          SizedBox(
                            width: 8.0,
                          ),
                          Text(
                            "test 1",
                            style:
                            Theme.of(context).textTheme.headline6!.copyWith(
                              color: Colors.white,
                            ),
                          )
                        ],
                      ),
                    ),
                    width: double.infinity,
                    height: double.infinity,
                  ),
                ),
                Triangle.isosceles(
                  edge: Edge.BOTTOM,
                  child: Container(
                    color: Colors.blue,
                    width: 20.0,
                    height: 10.0,
                  ),
                ),
              ],
            ),
            _latLng1,
          );
        },
      ),
    );

    _markers.add(
      Marker(
        markerId: MarkerId("marker_id2"),
        position: _latLng2,
        onTap: () {
          _customInfoWindowController.addInfoWindow!(
            Column(
              children: [
                Expanded(
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.blue,
                      borderRadius: BorderRadius.circular(4),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                            Icons.account_circle,
                            color: Colors.white,
                            size: 30,
                          ),
                          SizedBox(
                            width: 8.0,
                          ),
                          Text(
                            "test 2",
                            style:
                            Theme.of(context).textTheme.headline6!.copyWith(
                              color: Colors.white,
                            ),
                          )
                        ],
                      ),
                    ),
                    width: double.infinity,
                    height: double.infinity,
                  ),
                ),
                Triangle.isosceles(
                  edge: Edge.BOTTOM,
                  child: Container(
                    color: Colors.blue,
                    width: 20.0,
                    height: 10.0,
                  ),
                ),
              ],
            ),
            _latLng2,
          );
        },
      ),
    );
    return Scaffold(
      appBar: AppBar(
        title: Text('Custom Info Window Example'),
        backgroundColor: Colors.red,
      ),
      body: Stack(
        children: <Widget>[
          GoogleMap(
            onTap: (position) {
              _customInfoWindowController.hideInfoWindow!();
            },
            onCameraMove: (position) {
              _customInfoWindowController.onCameraMove!();
            },
            onMapCreated: (GoogleMapController controller) async {
              _customInfoWindowController.googleMapController = controller;
            },
            markers: _markers,
            initialCameraPosition: CameraPosition(
              target: _latLng,
              zoom: _zoom,
            ),
          ),
          CustomInfoWindow(
            controller: _customInfoWindowController,
            height: 75,
            width: 150,
            offset: 50,
          ),
        ],
      ),
    );
  }
}
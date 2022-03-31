import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:location/location.dart';

class GoogleMapScreen extends StatefulWidget {
  const GoogleMapScreen({Key? key}) : super(key: key);

  @override
  _GoogleMapScreenState createState() => _GoogleMapScreenState();
}

class _GoogleMapScreenState extends State<GoogleMapScreen> {
  static final LatLng _kMapCenter = LatLng(22.2734719, 70.7510845);
  static const LatLng showLocation = const LatLng(22.327796, 70.767849);
  final Set<Marker> markers = new Set();

  static final CameraPosition _kInitialPosition = CameraPosition(target: showLocation, zoom: 11.0, tilt: 0, bearing: 0);
  late GoogleMapController _controller;
  Location _location = Location();


  void _onMapCreated(GoogleMapController _cntlr)
  {
    _controller = _cntlr;
    _location.onLocationChanged.listen((l) {
      _controller.animateCamera(
        CameraUpdate.newCameraPosition(
          CameraPosition(target: LatLng(l.latitude!, l.longitude!),zoom: 15),
        ),
      );
    });
  }


  Set<Marker> getmarkers() { //markers to place on map
    setState(() {
      markers.add(Marker( //add first marker
        markerId: MarkerId(showLocation.toString()),
        position: showLocation, //position of marker
        infoWindow: InfoWindow( //popup info
          title: 'Marker Title First ',
          snippet: 'My Custom Subtitle',
        ),
        icon: BitmapDescriptor.defaultMarker, //Icon for Marker
      ));

      markers.add(Marker( //add second marker
        markerId: MarkerId(showLocation.toString()),
        position: LatLng(22.246653, 70.799603), //position of marker
        infoWindow: InfoWindow( //popup info
          title: 'Marker Title Second ',
          snippet: 'My Custom Subtitle',
        ),
        icon: BitmapDescriptor.defaultMarker, //Icon for Marker
      ));

      markers.add(Marker( //add third marker
        markerId: MarkerId(showLocation.toString()),
        position: LatLng(22.297139, 70.830952), //position of marker
        infoWindow: InfoWindow( //popup info
          title: 'Marker Title Third ',
          snippet: 'My Custom Subtitle',
        ),
        icon: BitmapDescriptor.defaultMarker, //Icon for Marker
      ));

      //add more markers here
    });

    return markers;
  }



  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion(
      value: const SystemUiOverlayStyle(
        statusBarColor: Colors.transparent,
      ),
      child: Material(

        child: GoogleMap(
          initialCameraPosition: _kInitialPosition,
          mapType: MapType.normal,
          onMapCreated: _onMapCreated,

          markers: getmarkers(),
          zoomGesturesEnabled: true,
          myLocationButtonEnabled: false,
          rotateGesturesEnabled: true,
          tiltGesturesEnabled: true,

          onTap: _handleTap,
        ),
      ),
    );
  }



  _handleTap(LatLng point) {
    setState(() {

      markers.add(Marker(
        markerId: MarkerId(point.toString()),
        position: point,
        infoWindow: InfoWindow(
          title: 'I am a marker',
        ),
        icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueMagenta),
      ));
    });
  }
}

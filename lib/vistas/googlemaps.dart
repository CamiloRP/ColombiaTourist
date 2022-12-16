import'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:turistbogota/model/geo.dart';

class Geolocalization extends StatefulWidget {
  final DatosGeolocalizacion dg;
  const Geolocalization(this.dg, {Key? key}) : super(key: key);

  @override
  State<Geolocalization> createState() => _GeolocalizationState();
}

class _GeolocalizationState extends State<Geolocalization> {
  @override
  Widget build(BuildContext context) {
    return Material(
      child:Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: true,
          title: Text(widget.dg.direccion),
          leading: IconButton(icon:Icon(Icons.arrow_back),
          onPressed: ()=> Navigator.pop(context, false),
          ),
        ),
      body: GoogleMap(
        initialCameraPosition: CameraPosition(
        target:LatLng(widget.dg.longitud, widget.dg.latitud ),
          zoom: 17,
        ),
        markers: _marcador(),
      )
      )
    );
  }
  Set<Marker> _marcador(){
    var mar = Set<Marker>();
    mar.add(Marker(markerId: MarkerId(widget.dg.direccion),
    position:LatLng(widget.dg.longitud, widget.dg.latitud),
    icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueGreen),
    infoWindow: InfoWindow(
      title: widget.dg.direccion,
    )
    )
    );
    return mar;
  }
}


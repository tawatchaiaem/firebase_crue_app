import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class ServiceMapScreen extends StatefulWidget {
  const ServiceMapScreen({Key? key}) : super(key: key);

  @override
  _ServiceMapScreenState createState() => _ServiceMapScreenState();
}

class _ServiceMapScreenState extends State<ServiceMapScreen> {
  // Object Google Map Controller
  GoogleMapController? mapController;

  void _onMapCreated(GoogleMapController controller) {
    mapController = controller;
  }

  LatLng latlng = LatLng(13.8646363, 100.6116708);

  // Marker
  Map<MarkerId, Marker> markers = <MarkerId, Marker>{
    MarkerId('สำนักงานใหญ่'): Marker(
        markerId: MarkerId('สำนักงานใหญ่'),
        position: LatLng(13.864644194101475, 100.61386360933618),
        infoWindow: InfoWindow(
            title: 'บิซิเนสไลน์สำนักงานใหญ่',
            snippet:
                '46 ถ.รามอินทรา \nแขวงอนุสาวรีย์ เขตบางเขน \nกรุงเทพมหานคร 10220'),
        onTap: () {
          print('Marker Tapped');
        },
        onDragEnd: (LatLng position) {
          print('Drag End');
        }),
    MarkerId('สำนักงานย่อยรามอินทรา'): Marker(
        markerId: MarkerId('สำนักงานย่อยรามอินทรา'),
        position: LatLng(13.867279296890638, 100.60930793637314),
        infoWindow: InfoWindow(
            title: 'บิซิเนสไลน์สำนักงานย่อยรามอินทรา',
            snippet:
                '46 ถ.รามอินทรา \nแขวงอนุสาวรีย์ เขตบางเขน \nกรุงเทพมหานคร 10220'),
        onTap: () {
          print('Marker Tapped');
        },
        onDragEnd: (LatLng position) {
          print('Drag End');
        }),
    MarkerId('สาขา 2'): Marker(
        markerId: MarkerId('สาขา 2'),
        position: LatLng(13.864469647510733, 100.61203821555708),
        infoWindow: InfoWindow(
            title: 'บิซิเนสไลน์สาขา 2',
            snippet:
                '46 ถ.รามอินทรา \nแขวงอนุสาวรีย์ เขตบางเขน \nกรุงเทพมหานคร 10220'),
        onTap: () {
          print('Marker Tapped');
        },
        onDragEnd: (LatLng position) {
          print('Drag End');
        })
  };

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('พื้นที่ให้บริการของเรา'),
      ),
      body: GoogleMap(
        markers: Set<Marker>.of(markers.values),
        initialCameraPosition: CameraPosition(target: latlng, zoom: 16.0),
        mapType: MapType.normal,
        onMapCreated: _onMapCreated,
      ),
    );
  }
}

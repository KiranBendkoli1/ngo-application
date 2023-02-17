// ignore_for_file: prefer_const_constructors, non_constant_identifier_names

import 'dart:io';

import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:image_cropper/image_cropper.dart';
import 'package:image_picker/image_picker.dart';
import 'package:ngo_app/pages/admin_homepage.dart';
import 'package:screenshot/screenshot.dart';

class GetGeoTaggedImage extends StatefulWidget {
  const GetGeoTaggedImage({super.key});

  @override
  State<GetGeoTaggedImage> createState() => GetGeoTaggedImageState();
}

class GetGeoTaggedImageState extends State<GetGeoTaggedImage> {
  final storageRef = FirebaseStorage.instance.ref();
  Uint8List? bytes;
  final Geolocator geolocator = Geolocator();
  LocationPermission permission = LocationPermission.denied;
  var latitude,
      longitude,
      country,
      postalCode,
      locality,
      subLocality,
      administrativeArea,
      street;
  var _position, _address, _datetime, imageSelected, path = "", path1 = "";
  XFile _image = XFile("");
  bool changeUI = false;
  final picker = ImagePicker();
  Future getImage() async {
    var image;

    image = await picker.pickImage(source: ImageSource.camera);
    final croppedFile = await ImageCropper().cropImage(
      sourcePath: image.path,
    );
    setState(() {
      path1 = croppedFile!.path;
    });
    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        return Future.error('Location permissions are denied');
      }
    }
    Position position = await Geolocator.getCurrentPosition(
            desiredAccuracy: LocationAccuracy.high)
        .then((Position position) {
      setState(() {
        _position = position;
      });
      return position;
    });
    try {
      List<Placemark> p = await placemarkFromCoordinates(
          _position.latitude, _position.longitude);
      Placemark place = p[0];
      final DateTime now = DateTime.now();

      setState(() {
        _datetime =
            "${now.day}-${now.month}-${now.year} ${now.hour}:${now.minute}";
        _address =
            " ${place.locality} ${place.administrativeArea},${place.country}";
        subLocality = place.subLocality;
        street = place.street;
        locality = place.locality;
        administrativeArea = place.administrativeArea;
        country = place.country;
        postalCode = place.postalCode;
        latitude = _position.latitude;
        longitude = _position.longitude;
      });
      print("${latitude},  ${longitude}, ${_datetime}, ${_address}");
    } catch (e) {
      print(e);
    }
  }

  void getLocationInformation() async {}

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      body: SingleChildScrollView(
        child: Center(
          child: Column(children: [
            // ignore: prefer_const_constructors
            SizedBox(
              height: 40,
            ),
            changeUI
                ? country == null
                    ? CircularProgressIndicator()
                    : GeoTagImage(screenHeight)
                : TextButton(
                    onPressed: () {
                      getImage();
                    },
                    child: path1 == ""
                        ? Column(
                            children: [
                              Icon(
                                Icons.image,
                                size: screenHeight / 3,
                              ),
                              Text("Select Image")
                            ],
                          )
                        : Image.file(File(path1)),
                  ),
            ElevatedButton(
              onPressed: () {
                changeUI = true;
                setState(() {});
              },
              child: Text("Add Location"),
            ),
            ElevatedButton(
              onPressed: () async {
                final screenshotController = ScreenshotController();
                final bytes = await screenshotController.captureFromWidget(
                  Material(
                    child: GeoTagImage(screenWidth),
                  ),
                );
                setState(() {
                  this.bytes = bytes;
                });
                final geoTagImageReference =
                    storageRef.child("geotagimages/${subLocality}");
                try {
                  // Upload raw data.
                  await geoTagImageReference.putData(bytes).then((p0) {
                    Fluttertoast.showToast(
                      msg: "Image Uploaded",
                      toastLength: Toast.LENGTH_LONG,
                      gravity: ToastGravity.BOTTOM,
                      backgroundColor: Colors.blueGrey,
                      fontSize: 12,
                    ).then((value) {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => AdminHomePage()));
                    });
                  });
                } catch (e) {
                  // ...
                }
              },
              child: Text("Upload"),
            )
          ]),
        ),
      ),
    );
  }

  Widget GeoTagImage(screenWidth) => SingleChildScrollView(
          child: Stack(
        children: [
          Image.file(
            File(path1),
            width: screenWidth,
          ),
          Container(
            decoration: BoxDecoration(
              color: Color.fromARGB(255, 78, 72, 72).withOpacity(0.5),
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  _address,
                  style: TextStyle(color: Colors.white),
                ),
                Text(
                  "$street, $subLocality",
                  style: TextStyle(color: Colors.white),
                ),
                Text(
                  "$locality, $administrativeArea $postalCode, $country",
                  style: TextStyle(color: Colors.white),
                ),
                Text(
                  "Latitude $latitude",
                  style: TextStyle(color: Colors.white),
                ),
                Text(
                  "Longitude $longitude",
                  style: TextStyle(color: Colors.white),
                ),
                Text(
                  _datetime,
                  style: TextStyle(color: Colors.white),
                )
              ],
            ),
          ),
        ],
      ));
}

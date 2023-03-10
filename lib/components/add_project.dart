import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:image_cropper/image_cropper.dart';
import 'package:image_picker/image_picker.dart';
import 'package:ngo_app/pages/admin_homepage.dart';

class AddProject extends StatefulWidget {
  AddProject({super.key});

  @override
  State<AddProject> createState() => _AddProjectState();
}

class _AddProjectState extends State<AddProject> {
  FirebaseFirestore _firestore = FirebaseFirestore.instance;
  var projectId;
  void initState() {
    super.initState();
    getData();
  }

  Future<void> getData() async {
    QuerySnapshot querySnapshot = await _firestore.collection('projects').get();
    setState(() {
      projectId = querySnapshot.docs.length;
    });
    print(projectId);
  }

  final FirebaseStorage _storage = FirebaseStorage.instance;
  XFile? file;
  String projectTitle = '',
      projectDescription = '',
      projectCategory = '',
      projectAddress = '',
      path = "",
      path1 = "",
      imageUrl = "",
      projectTeamLeader = '';
  int projectFunds = 0;
  DateTime startDate = DateTime(2023);
  DateTime endDate = DateTime(2023);
  final ImagePicker impagePicker = ImagePicker();
  bool isOneDay = false;
  TextEditingController projectTitleController = TextEditingController();
  TextEditingController projectDescriptionController = TextEditingController();
  TextEditingController projectStartDateController = TextEditingController();
  TextEditingController projectEndDateController = TextEditingController();
  TextEditingController projectCategoryController = TextEditingController();
  TextEditingController projectFundsController = TextEditingController();
  TextEditingController projectAddressController = TextEditingController();
  TextEditingController projectTeamLeaderController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      backgroundColor: Color(0xffffffff),
      body: Center(
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.fromLTRB(16, 50, 16, 16),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.max,
              children: [
                Center(
                  child: Container(
                    height: 200,
                    width: screenWidth / 1.5,
                    child: Padding(
                      padding: EdgeInsets.zero,
                      child: TextButton(
                        style: ButtonStyle(),
                        onPressed: () async {
                          XFile? file = await impagePicker.pickImage(
                              source: ImageSource.gallery);
                          path = file!.path;
                          final croppedFile = await ImageCropper().cropImage(
                              sourcePath: path,
                              aspectRatio:
                                  CropAspectRatio(ratioX: 3, ratioY: 2));
                          path1 = croppedFile!.path;
                          setState(() {});
                        },
                        child: Container(
                          child: path1 == ""
                              ? Column(
                                  children: [
                                    Icon(
                                      Icons.image,
                                      size: screenWidth / 3,
                                    ),
                                    Text("Select Image")
                                  ],
                                )
                              : Image.file(File(path1)),
                        ),
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.fromLTRB(0, 30, 0, 16),
                  child: TextField(
                    controller: projectTitleController,
                    keyboardType: TextInputType.text,
                    style: TextStyle(
                      fontWeight: FontWeight.w400,
                      fontStyle: FontStyle.normal,
                      fontSize: 14,
                      color: Color(0xff000000),
                    ),
                    decoration: InputDecoration(
                      disabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12.0),
                        borderSide:
                            BorderSide(color: Color(0x00ffffff), width: 1),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12.0),
                        borderSide:
                            BorderSide(color: Color(0x00ffffff), width: 1),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12.0),
                        borderSide:
                            BorderSide(color: Color(0x00ffffff), width: 1),
                      ),
                      hintText: "Project Title",
                      hintStyle: TextStyle(
                        fontWeight: FontWeight.w400,
                        fontStyle: FontStyle.normal,
                        fontSize: 14,
                        color: Color(0xff9f9d9d),
                      ),
                      filled: true,
                      fillColor: Color(0xfff2f2f3),
                      isDense: false,
                      contentPadding:
                          EdgeInsets.symmetric(vertical: 8, horizontal: 12),
                    ),
                  ),
                ),
                TextField(
                  controller: projectDescriptionController,
                  minLines: 4,
                  maxLines: 20,
                  style: TextStyle(
                    fontWeight: FontWeight.w400,
                    fontStyle: FontStyle.normal,
                    fontSize: 14,
                    color: Color(0xff000000),
                  ),
                  decoration: InputDecoration(
                    disabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12.0),
                      borderSide:
                          BorderSide(color: Color(0x00ffffff), width: 1),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12.0),
                      borderSide:
                          BorderSide(color: Color(0x00ffffff), width: 1),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12.0),
                      borderSide:
                          BorderSide(color: Color(0x00ffffff), width: 1),
                    ),
                    hintText: "Project Description",
                    hintStyle: TextStyle(
                      fontWeight: FontWeight.w400,
                      fontStyle: FontStyle.normal,
                      fontSize: 14,
                      color: Color(0xff9f9d9d),
                    ),
                    filled: true,
                    fillColor: Color(0xfff2f2f3),
                    isDense: false,
                    contentPadding:
                        EdgeInsets.symmetric(vertical: 8, horizontal: 12),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.fromLTRB(0, 15, 0, 0),
                  child: TextField(
                    controller: projectTeamLeaderController,
                    keyboardType: TextInputType.text,
                    style: TextStyle(
                      fontWeight: FontWeight.w400,
                      fontStyle: FontStyle.normal,
                      fontSize: 14,
                      color: Color(0xff000000),
                    ),
                    decoration: InputDecoration(
                      disabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12.0),
                        borderSide:
                            BorderSide(color: Color(0x00ffffff), width: 1),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12.0),
                        borderSide:
                            BorderSide(color: Color(0x00ffffff), width: 1),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12.0),
                        borderSide:
                            BorderSide(color: Color(0x00ffffff), width: 1),
                      ),
                      hintText: "Project Lead",
                      hintStyle: TextStyle(
                        fontWeight: FontWeight.w400,
                        fontStyle: FontStyle.normal,
                        fontSize: 14,
                        color: Color(0xff9f9d9d),
                      ),
                      filled: true,
                      fillColor: Color(0xfff2f2f3),
                      isDense: false,
                      contentPadding:
                          EdgeInsets.symmetric(vertical: 8, horizontal: 12),
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.fromLTRB(0, 15, 0, 0),
                  child: TextField(
                    controller: projectFundsController,
                    keyboardType: TextInputType.number,
                    style: TextStyle(
                      fontWeight: FontWeight.w400,
                      fontStyle: FontStyle.normal,
                      fontSize: 14,
                      color: Color(0xff000000),
                    ),
                    decoration: InputDecoration(
                      disabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12.0),
                        borderSide:
                            BorderSide(color: Color(0x00ffffff), width: 1),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12.0),
                        borderSide:
                            BorderSide(color: Color(0x00ffffff), width: 1),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12.0),
                        borderSide:
                            BorderSide(color: Color(0x00ffffff), width: 1),
                      ),
                      hintText: "Funds Allocated",
                      hintStyle: TextStyle(
                        fontWeight: FontWeight.w400,
                        fontStyle: FontStyle.normal,
                        fontSize: 14,
                        color: Color(0xff9f9d9d),
                      ),
                      filled: true,
                      fillColor: Color(0xfff2f2f3),
                      isDense: false,
                      contentPadding:
                          EdgeInsets.symmetric(vertical: 8, horizontal: 12),
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.fromLTRB(0, 15, 0, 0),
                  child: TextField(
                    controller: projectCategoryController,
                    keyboardType: TextInputType.text,
                    style: TextStyle(
                      fontWeight: FontWeight.w400,
                      fontStyle: FontStyle.normal,
                      fontSize: 14,
                      color: Color(0xff000000),
                    ),
                    decoration: InputDecoration(
                      disabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12.0),
                        borderSide:
                            BorderSide(color: Color(0x00ffffff), width: 1),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12.0),
                        borderSide:
                            BorderSide(color: Color(0x00ffffff), width: 1),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12.0),
                        borderSide:
                            BorderSide(color: Color(0x00ffffff), width: 1),
                      ),
                      hintText: "Category",
                      hintStyle: TextStyle(
                        fontWeight: FontWeight.w400,
                        fontStyle: FontStyle.normal,
                        fontSize: 14,
                        color: Color(0xff9f9d9d),
                      ),
                      filled: true,
                      fillColor: Color(0xfff2f2f3),
                      isDense: false,
                      contentPadding:
                          EdgeInsets.symmetric(vertical: 8, horizontal: 12),
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.fromLTRB(0, 15, 0, 0),
                  child: TextField(
                    controller: projectAddressController,
                    keyboardType: TextInputType.text,
                    style: TextStyle(
                      fontWeight: FontWeight.w400,
                      fontStyle: FontStyle.normal,
                      fontSize: 14,
                      color: Color(0xff000000),
                    ),
                    decoration: InputDecoration(
                      disabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12.0),
                        borderSide:
                            BorderSide(color: Color(0x00ffffff), width: 1),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12.0),
                        borderSide:
                            BorderSide(color: Color(0x00ffffff), width: 1),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12.0),
                        borderSide:
                            BorderSide(color: Color(0x00ffffff), width: 1),
                      ),
                      hintText: "Address",
                      hintStyle: TextStyle(
                        fontWeight: FontWeight.w400,
                        fontStyle: FontStyle.normal,
                        fontSize: 14,
                        color: Color(0xff9f9d9d),
                      ),
                      filled: true,
                      fillColor: Color(0xfff2f2f3),
                      isDense: false,
                      contentPadding:
                          EdgeInsets.symmetric(vertical: 8, horizontal: 12),
                    ),
                  ),
                ),
                Row(
                  children: [
                    Checkbox(
                      value: isOneDay,
                      onChanged: (value) {
                        setState(() {
                          if (!isOneDay) {
                            isOneDay = true;
                          } else {
                            isOneDay = false;
                          }
                        });
                      },
                    ),
                    Text("is single day project"),
                  ],
                ),
                Padding(
                  padding: EdgeInsets.fromLTRB(0, 16, 0, 16),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      SizedBox(
                        width: screenWidth / 2.2,
                        child: TextField(
                          controller: projectStartDateController,
                          keyboardType: TextInputType.none,
                          readOnly: true,
                          onTap: () {
                            showDatePicker(
                                    context: context,
                                    initialDate: DateTime.now(),
                                    firstDate: DateTime(2022),
                                    lastDate: DateTime(2024))
                                .then((value) {
                              setState(() {
                                startDate = value!;
                                projectStartDateController.text =
                                    "${startDate.day}-${startDate.month}-${startDate.year}";
                              });
                            });
                          },
                          style: TextStyle(
                            fontWeight: FontWeight.w400,
                            fontStyle: FontStyle.normal,
                            fontSize: 14,
                            color: Color(0xff000000),
                          ),
                          decoration: InputDecoration(
                            disabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(12.0),
                              borderSide: BorderSide(
                                  color: Color(0x00ffffff), width: 1),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(12.0),
                              borderSide: BorderSide(
                                  color: Color(0x00ffffff), width: 1),
                            ),
                            enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(12.0),
                              borderSide: BorderSide(
                                  color: Color(0x00ffffff), width: 1),
                            ),
                            hintText: "Start Date",
                            hintStyle: TextStyle(
                              fontWeight: FontWeight.w400,
                              fontStyle: FontStyle.normal,
                              fontSize: 14,
                              color: Color(0xff9f9d9d),
                            ),
                            filled: true,
                            fillColor: Color(0xfff2f2f3),
                            isDense: false,
                            contentPadding: EdgeInsets.symmetric(
                                vertical: 8, horizontal: 12),
                          ),
                        ),
                      ),
                      Visibility(
                        visible: isOneDay ? false : true,
                        child: SizedBox(
                          width: screenWidth / 2.2,
                          child: TextField(
                            controller: projectEndDateController,
                            keyboardType: TextInputType.none,
                            readOnly: true,
                            onTap: () {
                              showDatePicker(
                                      context: context,
                                      initialDate: DateTime.now(),
                                      firstDate: DateTime(2022),
                                      lastDate: DateTime(2024))
                                  .then((value) {
                                setState(() {
                                  endDate = value!;
                                  projectEndDateController.text =
                                      "${endDate.day}-${endDate.month}-${endDate.year}";
                                });
                              });
                            },
                            style: TextStyle(
                              fontWeight: FontWeight.w400,
                              fontStyle: FontStyle.normal,
                              fontSize: 14,
                              color: Color(0xff000000),
                            ),
                            decoration: InputDecoration(
                              hintText: "End Date",
                              disabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(12.0),
                                borderSide: BorderSide(
                                    color: Color(0x00ffffff), width: 1),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(12.0),
                                borderSide: BorderSide(
                                    color: Color(0x00ffffff), width: 1),
                              ),
                              enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(12.0),
                                borderSide: BorderSide(
                                    color: Color(0x00ffffff), width: 1),
                              ),
                              hintStyle: TextStyle(
                                fontWeight: FontWeight.w400,
                                fontStyle: FontStyle.normal,
                                fontSize: 14,
                                color: Color(0xff9f9d9d),
                              ),
                              filled: true,
                              fillColor: Color(0xfff2f2f3),
                              isDense: false,
                              contentPadding: EdgeInsets.symmetric(
                                  vertical: 8, horizontal: 12),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: EdgeInsets.fromLTRB(0, 30, 0, 16),
                  child: MaterialButton(
                    onPressed: () {
                      saveProjectData(context);
                    },
                    color: Color(0xff0a490d),
                    elevation: 0,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12.0),
                    ),
                    padding: EdgeInsets.all(16),
                    child: Text(
                      "Save",
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w700,
                        fontStyle: FontStyle.normal,
                      ),
                    ),
                    textColor: Color(0xffffffff),
                    height: 50,
                    minWidth: MediaQuery.of(context).size.width,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void saveProjectData(BuildContext context) async {
    projectTitle = projectTitleController.text;
    projectDescription = projectDescriptionController.text;
    projectTeamLeader = projectTeamLeaderController.text;
    projectCategory = projectCategoryController.text;
    projectAddress = projectAddressController.text;
    projectFunds = int.parse(projectFundsController.text);
    var startDate = projectStartDateController.text;
    var endDate = projectEndDateController.text;
    setState(() {});
    try {
      Reference referenceRoot = _storage.ref();
      Reference referenceUserImages = referenceRoot.child('projects');
      Reference imageReference = referenceUserImages.child(projectTitle);
      await imageReference.putFile(File(path1));
      imageUrl = await imageReference.getDownloadURL();

      await _firestore.collection('projects').doc(projectTitle).set({
        'projectId': projectId,
        'projectTitle': projectTitle,
        'projectDescription': projectDescription,
        'imageUrl': imageUrl,
        'projectTeamLeader': projectTeamLeader,
        'projectCategory': projectCategory,
        'projectAddress': projectAddress,
        'projectFunds': projectFunds,
        'startDate': startDate,
        'endDate': endDate
      }).then((value) {
        Fluttertoast.showToast(
          msg: "Project Details of $projectTitle added Successfully",
          toastLength: Toast.LENGTH_LONG,
          gravity: ToastGravity.BOTTOM,
          backgroundColor: Colors.blueGrey,
          fontSize: 12,
        );
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => AdminHomePage(),
          ),
        );
      });
    } catch (e) {
      print(e.toString());
    }
  }
}

// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:ngo_app/model/project_model.dart';

class AdminProjectInfo extends StatefulWidget {
  ProjectModel projectModel;
  AdminProjectInfo({super.key, required this.projectModel});

  @override
  State<AdminProjectInfo> createState() => _AdminProjectInfoState();
}

class _AdminProjectInfoState extends State<AdminProjectInfo> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: Icon(
          Icons.arrow_back_ios_new_rounded,
          color: Color(0xFF0F6512),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            SizedBox(
              height: screenHeight / 6,
            ),
            Text(
              "${widget.projectModel.projectId}. ${widget.projectModel.projectTitle}",
              style: TextStyle(fontSize: 22),
            ),
            Center(
              child: Image.network(widget.projectModel.imageUrl,
                  width: screenWidth / 1.2),
            ),
            SizedBox(
              height: 20,
            ),
            Text(
              "Project Details",
              style: TextStyle(fontSize: 22),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Card(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    children: [
                      RichText(
                        text: TextSpan(
                          children: [
                            TextSpan(
                              text: 'Description: ',
                              style:
                                  TextStyle(fontSize: 16, color: Colors.black),
                            ),
                            TextSpan(
                              text: widget.projectModel.projectDescription,
                              style:
                                  TextStyle(fontSize: 15, color: Colors.black),
                            )
                          ],
                        ),
                      ),
                      RichText(
                        text: TextSpan(
                          children: [
                            TextSpan(
                              text: 'Team Leader: ',
                              style:
                                  TextStyle(fontSize: 16, color: Colors.black),
                            ),
                            TextSpan(
                              text: widget.projectModel.projectTeamLeader,
                              style:
                                  TextStyle(fontSize: 15, color: Colors.black),
                            )
                          ],
                        ),
                      ),
                      RichText(
                        text: TextSpan(
                          children: [
                            TextSpan(
                              text: 'Category: ',
                              style:
                                  TextStyle(fontSize: 16, color: Colors.black),
                            ),
                            TextSpan(
                              text: widget.projectModel.projectCategory,
                              style:
                                  TextStyle(fontSize: 15, color: Colors.black),
                            )
                          ],
                        ),
                      ),
                      RichText(
                        text: TextSpan(
                          children: [
                            TextSpan(
                              text: 'Address: ',
                              style:
                                  TextStyle(fontSize: 16, color: Colors.black),
                            ),
                            TextSpan(
                              text: widget.projectModel.projectAddress,
                              style:
                                  TextStyle(fontSize: 15, color: Colors.black),
                            )
                          ],
                        ),
                      ),
                      RichText(
                        text: TextSpan(
                          children: [
                            TextSpan(
                              text: 'Funds Allocated: ',
                              style:
                                  TextStyle(fontSize: 16, color: Colors.black),
                            ),
                            TextSpan(
                              text: widget.projectModel.projectFunds.toString(),
                              style:
                                  TextStyle(fontSize: 15, color: Colors.black),
                            )
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

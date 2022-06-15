import 'dart:io';

import 'package:careclub/View/Screens/login_screen.dart';
import 'package:careclub/View/Screens/otp_screen.dart';
import 'package:careclub/View/Screens/register_screen.dart';
import 'package:careclub/View/Utilities/colors.dart';
import 'package:careclub/View/Utilities/file_select_button.dart';
import 'package:careclub/View/Utilities/material_button.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';

import '../../ViewModel/auth_methods.dart';

class Verfication extends StatefulWidget {
  final bool isAdmin;

  // final String name, password, confirmPassword;
  const Verfication({Key? key, required this.isAdmin}) : super(key: key);

  @override
  _VerficationState createState() => _VerficationState();
}

class _VerficationState extends State<Verfication> {

  PlatformFile? file_1, file_2, file_3, file_4;
  String fileName_1 = "", fileName_2 = "", fileName_3 = "", fileName_4 = "";
  Future<void> filePick(int index) async {
    final pickerResult = await FilePicker.platform.pickFiles(
      type: FileType.custom,
      allowedExtensions: ['pdf'],
    );

    if (pickerResult != null) {
      if (index == 1) {
        file_1 = pickerResult.files.first;
        setState(() {
          fileName_1 = file_1!.name;
        });
      } else if (index == 2) {
        file_2 = pickerResult.files.first;
        setState(() {
          fileName_2 = file_2!.name;
        });
      } else if (index == 3) {
        file_3 = pickerResult.files.first;
        setState(() {
          fileName_3 = file_3!.name;
        });
      } else if (index == 4) {
        file_4 = pickerResult.files.first;
        setState(() {
          fileName_4 = file_4!.name;
        });
      }
    } else {
      //PROVIDE SNACK BAR OR TOAST TO SHOW FILEW NOT PICKED LATER
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Verification"),
        backgroundColor: btnColor,
        elevation: 0,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 15),
        child: Center(
          child: Column(
            children: [
              Row(
                children: [
                  Expanded(
                    child: (file_1 != null)
                        ? const FileButton().containText(context, fileName_1)
                        : const FileButton().containText(context, "Add File"),
                  ),
                  const SizedBox(
                    width: 10.0,
                  ),
                  FileButton(
                    icon: Icons.add,
                    function: () => filePick(1),
                  ),
                  const SizedBox(
                    width: 10.0,
                  ),
                  FileButton(
                      icon: Icons.cancel_outlined,
                      function: () {
                        setState(() {
                          file_1 == null;
                          fileName_1 = "Add File";
                        });
                      }),
                ],
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.03,
              ),
              Row(
                children: [
                  Expanded(
                    child: (file_2 != null)
                        ? const FileButton().containText(context, fileName_2)
                        : const FileButton().containText(context, "Add File"),
                  ),
                  const SizedBox(
                    width: 10.0,
                  ),
                  FileButton(
                    icon: Icons.add,
                    function: () => filePick(2),
                  ),
                  const SizedBox(
                    width: 10.0,
                  ),
                  FileButton(
                      icon: Icons.cancel_outlined,
                      function: () {
                        setState(() {
                          file_2 == null;
                          fileName_2 = "Add File";
                        });
                      }),
                ],
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.03,
              ),
              Row(
                children: [
                  Expanded(
                    child: (file_3 != null)
                        ? const FileButton().containText(context, fileName_3)
                        : const FileButton().containText(context, "Add File"),
                  ),
                  const SizedBox(
                    width: 10.0,
                  ),
                  FileButton(
                    icon: Icons.add,
                    function: () => filePick(3),
                  ),
                  const SizedBox(
                    width: 10.0,
                  ),
                  FileButton(
                      icon: Icons.cancel_outlined,
                      function: () {
                        setState(() {
                          file_3 == null;
                          fileName_3 = "Add File";
                        });
                      }),
                ],
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.03,
              ),
              Row(
                children: [
                  Expanded(
                    child: (file_4 != null)
                        ? const FileButton().containText(context, fileName_4)
                        : const FileButton().containText(context, "Add File"),
                  ),
                  const SizedBox(
                    width: 10.0,
                  ),
                  FileButton(
                    icon: Icons.add,
                    function: () => filePick(4),
                  ),
                  const SizedBox(
                    width: 10.0,
                  ),
                  FileButton(
                      icon: Icons.cancel_outlined,
                      function: () {
                        setState(() {
                          file_4 == null;
                          fileName_4 = "Add File";
                        });
                      }),
                ],
              ),
              Align(
                alignment: Alignment.centerRight,
                child: IconButton(
                  onPressed:
                      () {}, // ON CLICK OPEN DIALOG BOX TO GIVE NECESSARY INFO ABOUT UPLOADING AND WHY HE SHOULD UPLOAD THESE DOCS
                  icon: const Icon(
                    Icons.info_outline_rounded,
                    color: btnColor,
                  ),
                ),
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.03,
              ),
              MaterialBtn(
                height: 55,
                width: MediaQuery.of(context).size.width * 0.5,
                color: btnColor,
                text: "REGISTER",
                radius: 18,
                function: () async {
                  if (passwordController.text == confirmController.text) {
                    //in place of this condition here check whether files have been selected or not because this condidtion is already checked in previous screen
                    String rec = await AuthMethods().registerAsAdmin(
                      email: emailController.text,
                      password: passwordController.text,
                      username: usernameController.text,
                      isAdmin: widget.isAdmin, 
                    );
                    if (rec == 'success') {
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const LoginScreen(),
                        ),
                      );
                    } else {
                      print("nothuingf qpojdwkd");
                    }
                  } else {
                    //create a toast or snackbar to show below issue
                    print('Password do not match');
                  }
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}
              // Container(
              //   height: MediaQuery.of(context).size.height * 0.09,
              //   width: double.infinity,
              //   decoration: BoxDecoration(
              //     border: Border.all(color: btnColor),
              //     borderRadius: BorderRadius.circular(10),
              //   ),
              //   child: (file_1 != null)
              //       ? Center(
              //           child: Text(
              //             fileName_1,
              //             style: const TextStyle(
              //               fontSize: 18,
              //               color: labelColor,
              //             ),
              //           ),
              //         )
              //       : TextButton(
              //           onPressed: () => filePick(1),
              //           child: const Text(
              //             "+ Add File",
              //             style: TextStyle(fontSize: 20, color: labelColor),
              //           ),
              //         ),
              // ), Incase there's a need for this
import 'package:flutter/material.dart';
import 'package:qr_flutter/qr_flutter.dart';

class GenerateQR extends StatefulWidget {
  const GenerateQR({Key? key}) : super(key: key);

  @override
  _GenerateQRState createState() => _GenerateQRState();
}

class _GenerateQRState extends State<GenerateQR> {
  String qrInputData = "";
  final qrInputDataFeed = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //Appbar having title
      appBar: AppBar(
        backgroundColor: Colors.indigo.shade400,
        title: const Text("Generate QR Code"),
      ),
      body: Center(
        child: Container(
          padding: EdgeInsets.all(20),
          child: SingleChildScrollView(
            //Scroll view given to Column
            child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  qrInputData != "" ? QrImage(data: qrInputData) : Container(),
                  SizedBox(height: 20),
                  Text(
                    "Generate QR Code",
                    style: TextStyle(fontSize: 20),
                  ),

                  //TextField for input link
                  TextField(
                    controller: qrInputDataFeed,
                    decoration:
                        InputDecoration(hintText: "Enter your link here..."),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(12.0),
                    //Button for generating QR code
                    child: Card(
                      elevation: 4.0,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: TextButton(
                        onPressed: () async {
                          if (qrInputDataFeed.text.isEmpty) {
                            setState(() {
                              qrInputData = "";
                            });
                          } else {
                            setState(() {
                              qrInputData = qrInputDataFeed.text;
                            });
                          }
                        },
                        //Title given on Button
                        child: Text(
                          "Generate QR Code",
                          style: TextStyle(
                            color: Colors.indigo[900],
                          ),
                        ),
                      ),
                    ),
                  ),
                ]),
          ),
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';

import 'encypt_data.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: HomeView(),
    );
  }
}

class HomeView extends StatefulWidget {

  @override
  _HomeViewState createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  TextEditingController? _controller=TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.orange,
      appBar: AppBar(
        title: Text("Encrypt and Decrypt Data"),
      ),
      body: SingleChildScrollView(
        child: Container(
          margin: EdgeInsets.only(top:10,bottom: 10),
          child: _buildBody(),
        ),
      ),
    );
  }

  Widget _buildBody() {
    return Container(
      height: 280,
      width: MediaQuery.of(context).size.width,
      margin: EdgeInsets.only(left: 10,right: 10),
      child: Card(
        elevation: 2,
        child:  Container(
          padding: EdgeInsets.only(left: 15,right: 15,top:
          15,bottom: 15),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                child: TextField(
                  controller: _controller,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    hintText: 'Enter Text',
                  ),
                ),
              ),
              SizedBox(height: 30),
              Text("EncryptText : ${EncryptData.encrypted!=null?EncryptData.encrypted?.base64:''}",
                maxLines: 2,
                style:TextStyle(
                    color: Colors.black,
                    fontSize: 16
                ),
                overflow: TextOverflow.ellipsis,
              ),
              SizedBox(height: 10,),
              Expanded(
                child: Text("DecryptText : ${EncryptData.decrypted!=null?EncryptData.decrypted:''}",
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    style:TextStyle(
                        color: Colors.black,
                        fontSize: 16
                    )
                ),
              ),
              SizedBox(height: 20,),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      primary: Colors.blue, // background
                      onPrimary: Colors.white,
                    ),
                    onPressed: () {
                      setState(() {
                        EncryptData.encryptAES(_controller!.text);
                      });
                    },
                    child: Text('Encryption'),
                  ),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      primary: Colors.blue, // background
                      onPrimary: Colors.white,
                    ),
                    onPressed: () {
                      setState(() {
                        EncryptData.decryptAES(_controller!.text);
                      });
                    },
                    child: Text('Decryption'),
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}

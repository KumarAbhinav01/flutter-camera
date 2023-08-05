import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:flutter_camera/main_screen.dart';

void main() async {
  // Ensure that plugins are initialized before running the app
  WidgetsFlutterBinding.ensureInitialized();
  // Get a list of available cameras
  final cameras = await availableCameras();
  // Use the first camera in the list
  final firstCamera = cameras.first;

  runApp(MyApp(camera: firstCamera));
}

class MyApp extends StatelessWidget {
  final CameraDescription camera;

  const MyApp({Key? key, required this.camera}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primaryColor: Colors.cyan,
        useMaterial3: true,
      ),
      routes: {
        '/': (context) => const MyHomePage(title: "Flutter Camera"),
        '/main': (context) => MainScreen(camera: camera),
      },
    );
  }
}


class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.cyanAccent,
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            MaterialButton(
              height: 50,
              color: Colors.cyanAccent,
              onPressed: (){
                Navigator.pushNamed(context, "/main");
              },
              child: const Text("Camera Page", style: TextStyle(fontSize: 20),),
            )
          ],
        ),
      ),
    );
  }
}

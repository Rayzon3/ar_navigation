import 'package:flutter/material.dart';
import 'package:arkit_plugin/arkit_plugin.dart';
import 'package:vector_math/vector_math_64.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  late ARKitController arKitController;

  @override
  void dispose() {
    arKitController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    void onARKitViewCreated(ARKitController arkitController) {
      arKitController = arkitController;
      final node = ARKitNode(
          geometry: ARKitSphere(radius: 0.1), position: Vector3(0, 0, -0.5));
      arKitController.add(node);
    }

    return Scaffold(
      appBar: AppBar(
        title: const Text("AR Navigation"),
      ),
      body: ARKitSceneView(onARKitViewCreated: onARKitViewCreated),
    );
  }
}

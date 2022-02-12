import 'package:cay_platform/model/trainings.dart';
import 'package:cay_platform/view/drawer/drawer.dart';
import 'package:cay_platform/view/home/widgets/custom_app_bar_home.dart';
import 'package:cay_platform/view/home/widgets/training.dart';
import 'package:cay_platform/view/selected_training/selected_training.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    List name = Provider.of<Trainings>(context).name;
    List image = Provider.of<Trainings>(context).imagePath;
    List category = Provider.of<Trainings>(context).category;

    return Scaffold(
      drawer: const CustomDrawer(),
      backgroundColor: const Color(0xFFEDF7F8),
      body: ListView(
        
        children: [
          const CustomAppBarForHome(),
          const Padding(
            padding:  EdgeInsets.all(8.0),
            child:  Text("Popular Trainign", style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
          ),
          Container(
            height: MediaQuery.of(context).size.height / 2.3,
            child: ListView(
              scrollDirection: Axis.horizontal,
              children: [
                Training(
                  widget:const SelectedTraining(),
                  name: "Name",
                  imagePath: image[0],
                  category: "Category",
                ),
                Training(
                  widget:const SelectedTraining(),
                  name: name[0],
                  imagePath: image[0],
                  category: category[0],
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
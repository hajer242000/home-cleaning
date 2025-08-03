import 'package:flutter/material.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:get/instance_manager.dart';
import 'package:homecleaning/Screens/ExploreFolder/service_details.dart';
import 'package:homecleaning/Theme/app_theme.dart';

class AllPhoto extends StatefulWidget {
  final List<String> images;
  const AllPhoto({super.key, required this.images});

  @override
  State<AllPhoto> createState() => _AllPhotoState();
}

class _AllPhotoState extends State<AllPhoto> {
  int imageIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            height: Get.height,
            width: Get.width,
            decoration: BoxDecoration(
              image: DecorationImage(
                fit: BoxFit.cover,
                image: AssetImage(widget.images[imageIndex]),
              ),
            ),
            child: Align(
              alignment: Alignment.topLeft,
              child: Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 20,
                  vertical: 50,
                ),
                child: IconButton(
                  onPressed: () {
                    Get.to(ServiceDetails());
                  },
                  icon: Container(
                    height: 40,
                    width: 40,

                    decoration: BoxDecoration(
                      color: tertiaryColor,
                      shape: BoxShape.circle,
                    ),
                    child: Icon(Icons.arrow_back, size: 24),
                  ),
                ),
              ),
            ),
          ),
          Positioned(
            bottom: 50,
            left: 0,
            right: 0,
            child: SizedBox(
              height: 80,
              child: Card(
                color: tertiaryColor,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: widget.images.length,
                    itemBuilder: (context, index) {
                      return InkWell(
                        onTap: () {
                          setState(() {
                            imageIndex = index;
                          });
                        },
                        child: Container(
                          margin: EdgeInsets.only(right: 4),
                          width: 50,
                          height: 50,

                          decoration: BoxDecoration(
                            shape: BoxShape.rectangle,
                            borderRadius: BorderRadius.circular(6),
                            color: Colors.grey[300],
                            image: DecorationImage(
                              image: AssetImage(widget.images[index]),
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                      );
                    },
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

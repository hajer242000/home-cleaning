import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:homecleaning/Components/button.dart';
import 'package:homecleaning/Components/leading_app_bar.dart';
import 'package:homecleaning/Theme/app_theme.dart';
import 'package:easy_localization/easy_localization.dart' as easy;

class Filter extends StatefulWidget {
  const Filter({super.key});

  @override
  State<Filter> createState() => _FilterState();
}

class _FilterState extends State<Filter> {
  double _minPrice = 30;
  double _maxPrice = 60;
  String selectedRating = easy.tr('rating_4_5_above');
  List<String> selectedCategories = [easy.tr('all')];
  List<String> categories = [
    easy.tr('all'),
    easy.tr('cleaning'),
    easy.tr('repairing'),
    easy.tr('plumbing'),
  ];
  int selectedDateIndex = 0;

  List<String> dates = [
    easy.tr('today_date'),
    easy.tr('mon_date'),
    easy.tr('tue_date'),
    easy.tr('wed_date'),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(easy.tr('filter')),
        leading: LeadingAppBar(
          onPressed: () {
            Get.back();
          },
        ),
      ),
      body: Stack(
        children: [
          SizedBox(
            height: Get.height,
            width: Get.width,
            child: Padding(
              padding: const EdgeInsets.all(20),
              child: ListView(
                children: [
                   Text(
                    easy.tr('location'),
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 10),
                  DropdownButtonFormField<String>(
                    dropdownColor: quaternaryColor,
                    value: easy.tr('new_york_usa'),
                    items:  [
                      DropdownMenuItem(
                        value: easy.tr('new_york_usa'),
                        child: Text(easy.tr('new_york_usa')),
                      ),
                    ],
                    onChanged: (value) {},
                    decoration: InputDecoration(
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: BorderSide(color: quaternaryColor),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: BorderSide(color: quaternaryColor),
                      ),
                    ),
                  ),
                  const SizedBox(height: 20),
                   Text(
                    easy.tr('category'),
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 10),
                  Wrap(
                    spacing: 10,
                    children: categories.map((cat) {
                      final isSelected = selectedCategories.contains(cat);
                      return ChoiceChip(
                        showCheckmark: false,
                        label: Text(cat),
                        selected: isSelected,
                        onSelected: (_) {
                          setState(() {
                            selectedCategories = [cat];
                          });
                        },
                        selectedColor: primaryColor,
                        backgroundColor: Colors.grey[200],
                        labelStyle: TextStyle(
                          color: isSelected ? Colors.white : Colors.black,
                        ),
                      );
                    }).toList(),
                  ),
                  const SizedBox(height: 20),
                   Text(
                    easy.tr('priceRange'),
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  RangeSlider(
                    min: 20,
                    max: 70,
                    divisions: 5,
                    values: RangeValues(_minPrice, _maxPrice),
                    labels: RangeLabels(
                      'OMR${_minPrice.toInt()}',
                      'OMR${_maxPrice.toInt()}',
                    ),
                    onChanged: (RangeValues values) {
                      setState(() {
                        _minPrice = values.start;
                        _maxPrice = values.end;
                      });
                    },
                    activeColor: primaryColor,
                  ),
                  const SizedBox(height: 10),
                   Text(
                    easy.tr('reviews'),
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  ...[
                    '4.5 and above',
                    '4.0 - 4.5',
                    '3.5 - 4.0',
                    '3.0 - 3.5',
                    '2.5 - 3.0',
                  ].map(
                    (rating) => RadioListTile(
                      value: rating,
                      groupValue: selectedRating,
                      title: Row(
                        children: [
                          Row(
                            children: List.generate(
                              5,
                              (_) => const Icon(
                                Icons.star,
                                color: Colors.orange,
                                size: 20,
                              ),
                            ),
                          ),
                          const SizedBox(width: 10),
                          Text(rating),
                        ],
                      ),
                      onChanged: (value) {
                        setState(() {
                          selectedRating = value!;
                        });
                      },
                      activeColor: primaryColor,
                    ),
                  ),
                  const SizedBox(height: 10),
                   Text(
                    easy.tr('availableDate'),
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 10),
                  SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      children: List.generate(dates.length, (index) {
                        final isSelected = selectedDateIndex == index;
                        return Padding(
                          padding: const EdgeInsets.only(right: 10),
                          child: ChoiceChip(
                            showCheckmark: false,
                            label: Text(
                              dates[index],
                              textAlign: TextAlign.center,
                            ),

                            selected: isSelected,
                            onSelected: (_) {
                              setState(() {
                                selectedDateIndex = index;
                              });
                            },
                            selectedColor: primaryColor,
                            backgroundColor: Colors.grey[200],
                            labelStyle: TextStyle(
                              color: isSelected ? Colors.white : Colors.black,
                            ),
                            padding: const EdgeInsets.symmetric(
                              horizontal: 12,
                              vertical: 10,
                            ),
                          ),
                        );
                      }),
                    ),
                  ),
                  const SizedBox(height: 30),
                ],
              ),
            ),
          ),

          Positioned(
            bottom: 0,
            child: Container(
              height: Get.height / 7,
              width: Get.width,
              decoration: BoxDecoration(
                color: tertiaryColor,
                boxShadow: [
                  BoxShadow(color: Colors.grey, blurRadius: 1, spreadRadius: 1),
                ],
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(20),
                  topRight: Radius.circular(20),
                ),
              ),
              child: Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 20,
                  vertical: 30,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Expanded(
                      child: InkWell(
                        onTap: () {
                          setState(() {
                            selectedCategories = [easy.tr('all')];
                            _minPrice = 30;
                            _maxPrice = 60;
                            selectedRating = easy.tr('rating_4_5_above');
                            selectedDateIndex = 0;
                          });
                        },
                        child: SizedBox(
                          width: double.infinity,
                          child: Container(
                            padding: EdgeInsets.symmetric(vertical: 15),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(30),
                              color: quaternaryColor,
                            ),
                            child: Center(
                              child: Text(
                                easy.tr('resetFilter'),
                                style: TextStyle(
                                  color: primaryColor,
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(width: 10),
                    Expanded(
                      child: InkWell(
                        onTap: () {
                          print("object");
                        },
                        child: AppButton(title: easy.tr('apply'),)
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

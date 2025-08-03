import 'package:flutter/material.dart';
import 'package:homecleaning/Components/badge_clipper.dart';
import 'package:homecleaning/Theme/app_theme.dart';
import 'package:easy_localization/easy_localization.dart' as easy;
class Review extends StatefulWidget {
  const Review({super.key});

  @override
  State<Review> createState() => _ReviewState();
}

class _ReviewState extends State<Review> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: [
          const SizedBox(height: 10),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
               Text(
                easy.tr('reviews'),
                style: TextStyle(fontSize: 14, fontWeight: FontWeight.w500),
              ),
              Row(
                children: [
                  Icon(Icons.edit, color: primaryColor),
                  Text(
                    easy.tr('addReview'),
                    style: TextStyle(
                      color: primaryColor,
                      fontSize: 12,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ],
              ),
            ],
          ),
          const SizedBox(height: 10),
          TextFormField(
            decoration: InputDecoration(
              fillColor: tertiaryColor,
              filled: true,
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(15),
                borderSide: BorderSide(color: secondaryColor),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(15),
                borderSide: BorderSide(color: secondaryColor),
              ),
              prefixIcon: Icon(Icons.search, color: primaryColor),
              hintText: easy.tr('searchInReviews'),
            ),
          ),
          const SizedBox(height: 10),
          Row(
            children: [
              OutlinedButton.icon(
                onPressed: () {},
                icon: Icon(Icons.tune, size: 16, color: Colors.black87),
                label: Text(
                  easy.tr('filter'),
                  style: const TextStyle(color: Colors.black87),
                ),
                style: OutlinedButton.styleFrom(
                  shape: const StadiumBorder(),
                  side: BorderSide(color: Colors.grey.shade300),
                  padding: const EdgeInsets.symmetric(
                    horizontal: 12,
                    vertical: 8,
                  ),
                  backgroundColor: quaternaryColor,
                ),
              ),
              Expanded(
                child: SizedBox(height: 40,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: 5,
                    itemBuilder: (context, index) {
                      return Container(
                        margin:EdgeInsets.symmetric(horizontal: 2) ,
                        child: OutlinedButton(
                          onPressed: () {},
                        style: OutlinedButton.styleFrom(
                                shape: const StadiumBorder(),
                                side: BorderSide(color: Colors.grey.shade300),
                                 padding: const EdgeInsets.symmetric(
                      horizontal: 12,
                      vertical: 8,
                    ),
                                backgroundColor: Colors.white,
                              ),
                          child: Text(
                            easy.tr('label'),
                            style: const TextStyle(color: Colors.black87),
                          ),
                        ),
                      );
                    },
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 10),
          Expanded(
            child: ListView.separated(
              padding: EdgeInsets.zero,
              itemBuilder: (context, index) {
                return SizedBox(
                  height: 200,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              VerifiedAvatar(),
                              SizedBox(width: 10),
                              Text(
                                easy.tr('daleThiel'),
                                style: TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ],
                          ),
                          Text(
                            easy.tr('elevenMonthsAgo'),
                            style: TextStyle(
                              fontWeight: FontWeight.w400,
                              fontSize: 12,
                              color: secondaryColor,
                            ),
                          ),
                        ],
                      ),
                      Column(
                        children: [
                          Text(
                           easy.tr('loremSnippet'),
                            style: TextStyle(
                              fontWeight: FontWeight.w400,
                              fontSize: 12,
                              color: secondaryColor,
                            ),
                          ),
                          Row(
                            children: [
                              ...List.generate(
                                5,
                                (int i) =>
                                    Icon(Icons.star, color: Colors.amber),
                              ),
                              Text(
                                '5.0',
                                style: TextStyle(
                                  fontWeight: FontWeight.w500,
                                  fontSize: 14,
                                  color: secondaryColor,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ],
                  ),
                );
              },
              separatorBuilder: (context, index) {
                return Divider();
              },
              itemCount: 5,
            ),
          ),
        ],
      ),
    );
  }
}

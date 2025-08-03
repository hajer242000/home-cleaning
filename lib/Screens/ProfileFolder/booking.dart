import 'package:flutter/material.dart';

class Booking {
  final String category;        
  final String title;            
  final String provider;        
  final String price;             
  final String dateTime;         
  final String addressLabel;      
  final String address;           
  final ImageProvider image;     

  Booking({
    required this.category,
    required this.title,
    required this.provider,
    required this.price,
    required this.dateTime,
    required this.addressLabel,
    required this.address,
    required this.image,
  });
}

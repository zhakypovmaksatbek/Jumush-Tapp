// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

class CompanyInfo extends StatelessWidget {
  final String nameOrganization;
  final String location;
  final String direction;

  const CompanyInfo({
    super.key,
    required this.nameOrganization,
    required this.location,
    required this.direction,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _buildRow(Icons.business_center, nameOrganization),
        _buildRow(Icons.location_on, location),
        _buildRow(Icons.category_outlined, direction),
      ],
    );
  }

  Padding _buildRow(IconData icon, String text) {
    String limitText(String text, int maxLength) {
      if (text.length <= maxLength) {
        return text;
      } else {
        return '${text.substring(0, maxLength)}.';
      }
    }

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4.0),
      child: Row(
        children: [
          Padding(
            padding: const EdgeInsets.only(right: 10),
            child: Icon(
              icon,
            ),
          ),
          Text(limitText(text, 26))
        ],
      ),
    );
  }
}

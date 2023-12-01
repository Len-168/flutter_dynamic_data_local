import 'package:cine_stream_ui/constant/colors.dart';
import 'package:flutter/material.dart';

class BoxSerachReusable extends StatelessWidget {
  BoxSerachReusable({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 50,
      decoration: BoxDecoration(
        color: BoxSerachColor,
        borderRadius: BorderRadius.circular(18),
      ),
      child: Padding(
        padding: const EdgeInsets.only(left: 20, top: 3),
        child: TextFormField(
          cursorColor: IconSerachColor,
          decoration: InputDecoration(
            border: InputBorder.none,
            suffixIcon: Icon(
              Icons.search,
              size: 30,
              color: IconSerachColor,
            ),
            hintText: "Serach",
            hintStyle: TextStyle(
              color: IconSerachColor,
              fontWeight: FontWeight.w500,
              fontSize: 16,
            ),
          ),
        ),
      ),
    );
  }
}

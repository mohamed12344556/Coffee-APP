import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class TypeToggle extends StatefulWidget {
  bool isDeliver;
  TypeToggle({super.key, required this.isDeliver});

  @override
  State<TypeToggle> createState() => _TypeToggleState();
}

class _TypeToggleState extends State<TypeToggle> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 315,
      height: 48,
      decoration: BoxDecoration(
          color: const Color(0xffF2F2F2),
          borderRadius: BorderRadius.circular(14)),
      child: Row(
        children: [
          GestureDetector(
            onTap: () {
              setState(() {
                widget.isDeliver = false;
              });
            },
            child: Container(
              width: 153.5,
              height: 40,
              alignment: Alignment.center,
              decoration: BoxDecoration(
                color: widget.isDeliver == false
                    ? Color(0xffC67C4E)
                    : Color(0xfffff),
                borderRadius: BorderRadius.circular(10),
              ),
              child: Text(
                "Deliver",
                style: GoogleFonts.sora(
                  color:
                      widget.isDeliver == false ? Colors.white : Colors.black,
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
          ),
          GestureDetector(
            onTap: () {
              setState(() {
                widget.isDeliver = true;
              });
            },
            child: Container(
              width: 153.5,
              height: 40,
              alignment: Alignment.center,
              decoration: BoxDecoration(
                color: widget.isDeliver == true
                    ? Color(0xffC67C4E)
                    : Color(0xfffff),
                borderRadius: BorderRadius.circular(10),
              ),
              child: Text(
                "Pick Up",
                style: GoogleFonts.sora(
                  color: widget.isDeliver == true ? Colors.white : Colors.black,
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}

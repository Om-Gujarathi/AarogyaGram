import 'package:flutter/material.dart';

import '../../../Modals/Slots.dart';

class SlotsCard extends StatefulWidget {
  const SlotsCard({super.key, required this.slot, required this.function});
  final VoidCallback function;
  final Slot slot;

  @override
  State<SlotsCard> createState() => _SlotsCardState();
}

class _SlotsCardState extends State<SlotsCard> {
  bool? isSelected;
  @override
  void initState() {
    isSelected = widget.slot.isAvailable;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        if (widget.slot.isAvailable) {
          setState(() {
            isSelected = !isSelected!;
          });
          if (isSelected!) {
            widget.function;
          }
        }
        // print("IsSelected : $isSelected");
      },
      child: Container(
        margin: const EdgeInsets.only(right: 8),
        height: 50,
        width: 100,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12),
            border: Border.all(
                color: isSelected! ? Colors.blue : Colors.grey, width: 2)),
        child: Center(
          child: Text(
            // "2.00 pm",
            "${widget.slot.time.hour} : ${widget.slot.time.minute}",
            // slot["time"].toString(),
            textAlign: TextAlign.center,
            style: TextStyle(
                color: isSelected! ? Colors.blue : Colors.grey, fontSize: 18),
          ),
        ),
      ),
    );
  }
}

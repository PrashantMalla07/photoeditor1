import 'package:flutter/material.dart';

class AdjustmentSliders extends StatelessWidget {
  final String label;
  final double value;
  final Function(double) onChanged;

  const AdjustmentSliders({
    Key? key,
    required this.label,
    required this.value,
    required this.onChanged,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 30),
      child: Row(
        children: [
          Text(
            '$label: ',
            style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(width: 10), // Add some spacing
          Expanded(
            child: SliderTheme(
              data: SliderTheme.of(context).copyWith(
                valueIndicatorTextStyle: TextStyle(
                  color: Colors.white,
                ),
              ),
              child: Slider(
                value: value * 100,
                min: -100,
                max: 100,
                onChanged: (newValue) => onChanged(newValue / 100),
                label: '${(value * 100).toStringAsFixed(0)}',
                divisions: 200,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

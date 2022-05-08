import 'package:flutter/material.dart';

class MyRadioOption<T> extends StatelessWidget {
  final T value;
  final T? groupValue;
  final String label;
  final String text;
  final ValueChanged<T?> onChanged;

  const MyRadioOption({
    required this.value,
    required this.groupValue,
    required this.label,
    required this.text,
    required this.onChanged,
  });

  Widget _buildLabel() {
    final bool isSelected = value == groupValue;

    return Container(
      width: 50,
      height: 50,
      decoration: ShapeDecoration(
        shape: CircleBorder(
          side: BorderSide(
            color: Colors.black,
          ),
        ),
        color: isSelected ? Colors.teal : Colors.white,
      ),
      child: Center(
        child: Text(
          value.toString(),
          style: TextStyle(
            color: isSelected ? Colors.white : Colors.teal,
            fontSize: 24,
          ),
        ),
      ),
    );
  }

  Widget _buildText() {
    return Text(
      text,
      style: const TextStyle(color: Colors.black, fontSize: 24),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(5),
      child: GestureDetector(
        onTap: () => onChanged(value),
       // splashColor: Colors.teal.withOpacity(0.5),
        child: Padding(
          padding: EdgeInsets.all(5),
          child: Row(
            children: [
              _buildLabel(),
              const SizedBox(width: 10),
              _buildText(),
            ],
          ),
        ),
      ),
    );
  }
}

class CustomRadioExample extends StatefulWidget {

  @override
  State createState() => new _CustomRadioExampleState();
}

class _CustomRadioExampleState extends State<CustomRadioExample> {

  String? _groupValue;

  ValueChanged<String?> _valueChangedHandler() {
    return (value) => setState(() => _groupValue = value!);
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: AppBar(
        title: const Text('Woolha.com Flutter Tutorial'),
        backgroundColor: Colors.teal,
      ),
      body: Column(
        children: [
          MyRadioOption<String>(
            value: 'A',
            groupValue: _groupValue,
            onChanged: _valueChangedHandler(),
            label: 'A',
            text: 'One',
          ),
          MyRadioOption<String>(
            value: 'B',
            groupValue: _groupValue,
            onChanged: _valueChangedHandler(),
            label: 'B',
            text: 'Two',
          ),
          MyRadioOption<String>(
            value: 'C',
            groupValue: _groupValue,
            onChanged: _valueChangedHandler(),
            label: 'C',
            text: 'Three',
          ),
          MyRadioOption<String>(
            value: 'D',
            groupValue: _groupValue,
            onChanged: _valueChangedHandler(),
            label: 'D',
            text: 'Four',
          ),
          MyRadioOption<String>(
            value: 'E',
            groupValue: _groupValue,
            onChanged: _valueChangedHandler(),
            label: 'E',
            text: 'Five',
          ),
        ],
      ),
    );
  }
}
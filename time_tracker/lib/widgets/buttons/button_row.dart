import 'package:flutter/material.dart';
import 'package:time_tracker/utils/utils.dart';

class ButtonRow extends StatefulWidget {
  const ButtonRow({Key? key}) : super(key: key);

  @override
  _ButtonRowState createState() => _ButtonRowState();
}

class _ButtonRowState extends State<ButtonRow> {
  List<String> values = [
    'Home',
    'Personal',
    'Work',
  ];

  int _selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 25,
      width: 180,
      child: ShaderMask(
        shaderCallback: (Rect rect) {
          return const LinearGradient(
            begin: Alignment.centerLeft,
            end: Alignment.centerRight,
            colors: [
              white,
              Colors.transparent,
              Colors.transparent,
              white,
            ],
            stops: [0.0, 0.1, 0.9, 1.0],
          ).createShader(rect);
        },
        blendMode: BlendMode.dstOut,
        child: Padding(
          padding: const EdgeInsets.only(left: 7, right: 7),
          child: ListView.separated(
            itemCount: values.length,
            scrollDirection: Axis.horizontal,
            separatorBuilder: (BuildContext context, int index) => const Gap(8),
            itemBuilder: (BuildContext context, int index) {
              return InkWell(
                onTap: () {
                  setState(
                    () => _selectedIndex = index,
                  );
                },
                splashColor: Colors.transparent,
                highlightColor: Colors.transparent,
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(7),
                    color: index == _selectedIndex
                        ? const Color(0xff16171b)
                        : Colors.transparent,
                  ),
                  padding:
                      const EdgeInsets.symmetric(horizontal: 6, vertical: 0),
                  child: Center(
                    child: Text(
                      values[index],
                      style: const TextStyle(
                        color: Color(0xff36383c),
                        fontSize: 16,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ),
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';

import 'piano_section.dart';
import 'piano_slider.dart';
import 'theme.dart';

class PianoView extends StatefulWidget {
  const PianoView({
    this.showLabels = false,
    required this.keyWidth,
    required this.labelsOnlyOctaves,
    this.disableScroll = false,
    this.feedback,
  });

  final double keyWidth;
  final bool showLabels;
  final bool labelsOnlyOctaves;
  final bool disableScroll;
  final bool? feedback;

  @override
  _PianoViewState createState() => _PianoViewState();
}

class _PianoViewState extends State<PianoView> {
  int _currentOctave = 3;
  late ScrollController _controller;

  double get currentOffset => widget.keyWidth * (7 * _currentOctave);

  @override
  void initState() {
    _controller = ScrollController(initialScrollOffset: currentOffset);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Flex(
      direction: Axis.vertical,
      children: <Widget>[
        Flexible(
          flex: 1,
          child: Container(
            child: PianoSlider(
              theme: ThemeUtils(context),
              keyWidth: widget.keyWidth,
              currentOctave: _currentOctave,
              octaveTapped: (int octave) {
                setState(() {
                  _currentOctave = octave;
                });
                _controller.jumpTo(currentOffset);
              },
            ),
          ),
        ),
        Flexible(
          flex: 8,
          child: PianoSection(
              controller: _controller,
              disableScroll: widget.disableScroll,
              keyWidth: widget.keyWidth,
              showLabels: widget.showLabels,
              labelsOnlyOctaves: widget.labelsOnlyOctaves),
        ),
      ],
    );
  }
}

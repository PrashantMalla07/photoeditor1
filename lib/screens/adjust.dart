import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:screenshot/screenshot.dart';

import '../services/app_image_provider.dart';

class AdjustScreen extends StatefulWidget {
  const AdjustScreen({Key? key}) : super(key: key);

  @override
  State<AdjustScreen> createState() => _AdjustScreenState();
}

class _AdjustScreenState extends State<AdjustScreen> {
  late AppImageProvider imageProvider;
  ScreenshotController screenshotController = ScreenshotController();
  double _brightness = 0.0;
  double _contrast = 0.0;
  double _saturation = 0.0;
  double _exposure = 0.0;
  double _brilliance = 0.0;
  double _highlights = 0.0;
  double _shadows = 0.0;
  double _vibrance = 0.0;
  double _warmth = 0.0;
  double _colorTint = 0.0;
  double _sharpness = 0.0;
  double _blur = 0.0;
  double _sharp = 0.0;
  double _vignette = 0.0;

  @override
  void initState() {
    super.initState();
    imageProvider = Provider.of<AppImageProvider>(context, listen: false);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: const CloseButton(),
        title: const Text('Adjustments'),
        actions: [
        IconButton(
  onPressed: () async {
    Uint8List? bytes = await screenshotController.capture();
    imageProvider.changeImage(bytes!);
    if (mounted) return;
    Navigator.of(context).pop();
  },
  icon: const Icon(Icons.done),
)
        ],
      ),
      body: Center(
        child: Consumer<AppImageProvider>(
          builder: (BuildContext context, value, Widget? child) {
            if (value.currentImage != null) {
              return Screenshot(
                controller: screenshotController,
                child: ColorFiltered(
                  colorFilter: ColorFilter.matrix(
                    <double>[
                      1, 0, 0, 0, _brightness * 100,
                      0, 1, 0, 0, _brightness * 100,
                      0, 0, 1, 0, _brightness * 100,
                      0, 0, 0, 1, 0,
                    ],
                  ),
                  child: ColorFiltered(
                    colorFilter: ColorFilter.matrix(
                      <double>[
                        1 + _contrast, 0, 0, 0, 0,
                        0, 1 + _contrast, 0, 0, 0,
                        0, 0, 1 + _contrast, 0, 0,
                        0, 0, 0, 1, 0,
                      ],
                    ),
                    child: ColorFiltered(
                      colorFilter: ColorFilter.matrix(
                        <double>[
                          1 + _saturation, 0, 0, 0, 0,
                          0, 1 + _saturation, 0, 0, 0,
                          0, 0, 1 + _saturation, 0, 0,
                          0, 0, 0, 1, 0,
                        ],
                      ),
                      child: ColorFiltered(
                        colorFilter: ColorFilter.matrix(
                          <double>[
                            1 + _exposure, 0, 0, 0, 0,
                            0, 1 + _exposure, 0, 0, 0,
                            0, 0, 1 + _exposure, 0, 0,
                            0, 0, 0, 1, 0,
                          ],
                        ),
                        child: ColorFiltered(
                          colorFilter: ColorFilter.matrix(
                            <double>[
                              1 + _brilliance, 0, 0, 0, 0,
                              0, 1 + _brilliance, 0, 0, 0,
                              0, 0, 1 + _brilliance, 0, 0,
                              0, 0, 0, 1, 0,
                            ],
                          ),
                          child: ColorFiltered(
                            colorFilter: ColorFilter.matrix(
                              <double>[
                                1 + _highlights, 0, 0, 0, 0,
                                0, 1 + _highlights, 0, 0, 0,
                                0, 0, 1 + _highlights, 0, 0,
                                0, 0, 0, 1, 0,
                              ],
                            ),
                            child: ColorFiltered(
                              colorFilter: ColorFilter.matrix(
                                <double>[
                                  1 + _shadows, 0, 0, 0, 0,
                                  0, 1 + _shadows, 0, 0, 0,
                                  0, 0, 1 + _shadows, 0, 0,
                                  0, 0, 0, 1, 0,
                                ],
                              ),
                              child: ColorFiltered(
                                colorFilter: ColorFilter.matrix(
                                  <double>[
                                    1 + _vibrance, 0, 0, 0, 0,
                                    0, 1 + _vibrance, 0, 0, 0,
                                    0, 0, 1 + _vibrance, 0, 0,
                                    0, 0, 0, 1, 0,
                                  ],
                                ),
                                child: ColorFiltered(
                                  colorFilter: ColorFilter.matrix(
                                    <double>[
                                      1 + _warmth, 0, 0, 0, 0,
                                      0, 1 + _warmth, 0, 0, 0,
                                      0, 0, 1 + _warmth, 0, 0,
                                      0, 0, 0, 1, 0,
                                    ],
                                  ),
                                  child: ColorFiltered(
                                    colorFilter: ColorFilter.matrix(
                                      <double>[
                                        1 + _colorTint, 0, 0, 0, 0,
                                        0, 1 + _colorTint, 0, 0, 0,
                                        0, 0, 1 + _colorTint, 0, 0,
                                        0, 0, 0, 1, 0,
                                      ],
                                    ),
                                    child: ColorFiltered(
                                      colorFilter: ColorFilter.matrix(
                                        <double>[
                                          1 + _sharpness, 0, 0, 0, 0,
                                          0, 1 + _sharpness, 0, 0, 0,
                                          0, 0, 1 + _sharpness, 0, 0,
                                          0, 0, 0, 1, 0,
                                        ],
                                      ),
                                      child: ColorFiltered(
                                        colorFilter: ColorFilter.matrix(
                                          <double>[
                                            1 - _vignette, 0, 0, 0, 0,
                                            0, 1 - _vignette, 0, 0, 0,
                                            0, 0, 1 - _vignette, 0, 0,
                                            0, 0, 0, 1, 0,
                                          ],
                                        ),
                                        child: Image.memory(value.currentImage!),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              );
            }
            return const Center(
              child: CircularProgressIndicator(),
            );
          },
        ),
      ),
      bottomNavigationBar: Container(
        width: double.infinity,
        height: 200,
        color: Colors.black,
        child: SafeArea(
          child: _buildAdjustments(),
        ),
      ),
    );
  }

  Widget _buildAdjustments() {
    return SingleChildScrollView(
      scrollDirection: Axis.vertical,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          _buildSlider('Brightness', _brightness, _adjustBrightness),
          _buildSlider('Contrast', _contrast, _adjustContrast),
          _buildSlider('Saturation', _saturation, _adjustSaturation),
          _buildSlider('Exposure', _exposure, _adjustExposure),
          _buildSlider('Brilliance', _brilliance, _adjustBrilliance),
          _buildSlider('Highlights', _highlights, _adjustHighlights),
          _buildSlider('Shadows', _shadows, _adjustShadows),
          _buildSlider('Vibrance', _vibrance, _adjustVibrance),
          _buildSlider('Warmth', _warmth, _adjustWarmth),
          _buildSlider('Color Tint', _colorTint, _adjustColorTint),
          _buildSlider('Sharpness', _sharpness, _adjustSharpness),
          _buildSlider('Blur', _blur, _adjustBlur),
          _buildSlider('Sharp', _sharp, _adjustSharp),
          _buildSlider('Vignette', _vignette, _adjustVignette),
        ],
      ),
    );
  }

  Widget _buildSlider(String label, double value, Function(double) onChanged) {
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

  void _adjustBrightness(double value) {
    setState(() {
      _brightness = value;
    });
  }

  void _adjustContrast(double value) {
    setState(() {
      _contrast = value;
    });
  }

  void _adjustSaturation(double value) {
    setState(() {
      _saturation = value;
    });
  }

  void _adjustExposure(double value) {
    setState(() {
      _exposure = value;
    });
  }

  void _adjustBrilliance(double value) {
    setState(() {
      _brilliance = value;
    });
  }

  void _adjustHighlights(double value) {
    setState(() {
      _highlights = value;
    });
  }

  void _adjustShadows(double value) {
    setState(() {
      _shadows = value;
    });
  }

  void _adjustVibrance(double value) {
    setState(() {
      _vibrance = value;
    });
  }

  void _adjustWarmth(double value) {
    setState(() {
      _warmth = value;
    });
  }

  void _adjustColorTint(double value) {
    setState(() {
      _colorTint = value;
    });
  }

  void _adjustSharpness(double value) {
    setState(() {
      _sharpness = value;
    });
  }

  void _adjustBlur(double value) {
    setState(() {
      _blur = value;
    });
  }

  void _adjustSharp(double value) {
    setState(() {
      _sharp = value;
    });
  }

  void _adjustVignette(double value) {
    setState(() {
      _vignette = value;
    });
  }
}
import 'package:flutter/material.dart';
import 'package:flutter_tts/flutter_tts.dart';
import 'package:speech_to_text/speech_to_text.dart' as stt;
import 'package:avatar_glow/avatar_glow.dart';
import 'package:studious_app/widgets/common/main_button.dart';

import '../../configs/themes/app_color.dart';
import '../../widgets/questions/custom_app_bar.dart';

class TextPage extends StatefulWidget {
  const TextPage({Key? key}) : super(key: key);
  static const String routeName = '/textspeech';

  @override
  State<TextPage> createState() => _TextPageState();
}

class _TextPageState extends State<TextPage> {
  FlutterTts flutterTts = FlutterTts();
  TextEditingController controller = TextEditingController();

  late stt.SpeechToText _speech;
  bool _isListening = false;
  String _textSpeech = 'Press the mic to start speaking';
  int count = 0;
  List data = [];

  void listen() async {
    if (!_isListening) {
      bool available = await _speech.initialize(
        onStatus: (status) => print("$status"),
        onError: (errorNotification) => print("$errorNotification"),
      );
      if (available) {
        setState(() {
          _isListening = true;
        });
        _speech.listen(
            onResult: (result) => setState(() {
                  _textSpeech = result.recognizedWords;
                }));
      }
    } else {
      setState(() {
        _isListening = false;
      });
      _speech.stop();
    }
  }

  double volume = 1.0;
  double pitch = 1.0;
  double speechRate = 0.5;
  List<String>? languages;
  String langCode = "en-US";

  @override
  void initState() {
    super.initState();
    init();
    _speech = stt.SpeechToText();
  }

  void init() async {
    languages = List<String>.from(await flutterTts.getLanguages);
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(gradient: mainGradient()),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        appBar: const CustomAppBar(title: "Speech Text"),
        body: SingleChildScrollView(
          child: Container(
            margin: const EdgeInsets.only(top: 20, left: 16, right: 16),
            child: Center(
              child: Column(children: [
                SizedBox(
                  height: MediaQuery.of(context).size.width / 3 * 2,
                  child: Text(
                    _textSpeech,
                    style: const TextStyle(
                      fontSize: 26,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ),
                const SizedBox(
                  width: 10,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    ElevatedButton(
                      onPressed: _speak,
                      child: const Text("Speak"),
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    ElevatedButton(
                      onPressed: _stop,
                      child: const Text("Stop"),
                    ),
                  ],
                ),
                Container(
                  margin: const EdgeInsets.only(left: 10),
                  child: Row(
                    children: [
                      const SizedBox(
                        width: 80,
                        child: Text(
                          "Volume",
                          style: TextStyle(fontSize: 17),
                        ),
                      ),
                      Slider(
                        min: 0.0,
                        max: 1.0,
                        value: volume,
                        onChanged: (value) {
                          setState(() {
                            volume = value;
                          });
                        },
                      ),
                      Container(
                        margin: const EdgeInsets.only(left: 10),
                        child: Text(
                            double.parse((volume).toStringAsFixed(2))
                                .toString(),
                            style: const TextStyle(fontSize: 17)),
                      )
                    ],
                  ),
                ),
                Container(
                  margin: const EdgeInsets.only(left: 10),
                  child: Row(
                    children: [
                      const SizedBox(
                        width: 80,
                        child: Text(
                          "Pitch",
                          style: TextStyle(fontSize: 17),
                        ),
                      ),
                      Slider(
                        min: 0.5,
                        max: 2.0,
                        value: pitch,
                        onChanged: (value) {
                          setState(() {
                            pitch = value;
                          });
                        },
                      ),
                      Container(
                        margin: const EdgeInsets.only(left: 10),
                        child: Text(
                            double.parse((pitch).toStringAsFixed(2)).toString(),
                            style: const TextStyle(fontSize: 17)),
                      )
                    ],
                  ),
                ),
                Container(
                  margin: const EdgeInsets.only(left: 10),
                  child: Row(
                    children: [
                      const SizedBox(
                        width: 80,
                        child: Text(
                          "Speech Rate",
                          style: TextStyle(fontSize: 17),
                        ),
                      ),
                      Slider(
                        min: 0.0,
                        max: 1.0,
                        value: speechRate,
                        onChanged: (value) {
                          setState(() {
                            speechRate = value;
                          });
                        },
                      ),
                      Container(
                        margin: const EdgeInsets.only(left: 10),
                        child: Text(
                            double.parse((speechRate).toStringAsFixed(2))
                                .toString(),
                            style: const TextStyle(fontSize: 17)),
                      )
                    ],
                  ),
                ),
                if (languages != null)
                  Container(
                    margin: const EdgeInsets.only(left: 10),
                    child: Row(
                      children: [
                        const Text(
                          "Language :",
                          style: TextStyle(fontSize: 17),
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                        DropdownButton<String>(
                          focusColor: Colors.white,
                          value: langCode,
                          style: const TextStyle(color: Colors.white),
                          iconEnabledColor: Colors.black,
                          items: languages!
                              .map<DropdownMenuItem<String>>((String? value) {
                            return DropdownMenuItem<String>(
                              value: value!,
                              child: Text(
                                value,
                                style: const TextStyle(color: Colors.black),
                              ),
                            );
                          }).toList(),
                          onChanged: (String? value) {
                            setState(() {
                              langCode = value!;
                            });
                          },
                        ),
                      ],
                    ),
                  )
              ]),
            ),
          ),
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
        floatingActionButton: AvatarGlow(
          animate: _isListening,
          glowColor: Colors.pinkAccent,
          endRadius: 100,
          duration: const Duration(milliseconds: 2000),
          repeatPauseDuration: const Duration(milliseconds: 100),
          repeat: true,
          child: FloatingActionButton(
            onPressed: () => listen(),
            child: Icon(_isListening ? Icons.mic : Icons.mic_none),
          ),
        ),
      ),
    );
  }

  void initSetting() async {
    await flutterTts.setVolume(volume);
    await flutterTts.setPitch(pitch);
    await flutterTts.setSpeechRate(speechRate);
    await flutterTts.setLanguage(langCode);
  }

  void _speak() async {
    initSetting();
    await flutterTts.speak(_textSpeech);
  }

  void _stop() async {
    await flutterTts.stop();
  }
}

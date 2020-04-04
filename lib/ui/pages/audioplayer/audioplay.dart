import 'package:flutter/material.dart';
import 'package:audioplayers/audioplayers.dart';
import 'package:audioplayers/audio_cache.dart';

class AudioPlayDemo extends StatefulWidget {
  @override
  _AudioPlayDemoState createState() => _AudioPlayDemoState();
}

class _AudioPlayDemoState extends State<AudioPlayDemo> {
  var _audioPlayer = AudioPlayer();
  var _audiocache = AudioCache(prefix: "audio/");
  bool _primeiraExecucao = true;
  double _volume = 0.5;

  _executar() async {
    _audioPlayer.setVolume(_volume);

    if (_primeiraExecucao) {
      _audioPlayer = await _audiocache.play("viper.mp3");
      _primeiraExecucao = false;
    } else
      _audioPlayer.resume();
  }

  _pausar() async {
    int resultado = await _audioPlayer.pause();
  }

  _parar() async {
    int resultado = await _audioPlayer.stop();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("音频播放测试demo"),
      ),
      body: Column(
        children: <Widget>[
          Slider(
            value: _volume,
            min: 0,
            max: 1,
            divisions: 10,
            onChanged: (volume) {
              setState(() {
                _volume = volume;
                _audioPlayer.setVolume(volume);
              });
            },
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Padding(
                padding: EdgeInsets.all(16),
                child: GestureDetector(
                  onTap: () {
                    _executar();
                  },
                  child: Text("播放"),
                ),
              ),
              Padding(
                padding: EdgeInsets.all(16),
                child: GestureDetector(
                  onTap: () {
                    _pausar();
                  },
                  child: Text("暂停"),
                ),
              ),
              Padding(
                padding: EdgeInsets.all(16),
                child: GestureDetector(
                  onTap: () {
                    _parar();
                  },
                  child: Text("中止"),
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}

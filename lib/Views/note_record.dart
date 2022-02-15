import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class NOteRecordView extends StatelessWidget {
  const NOteRecordView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFfbfbff),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 30),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            const SoundTrack(),
            // SizedBox(height: 50),
            Align(
              alignment: Alignment.bottomRight,
              child: Consumer(
                builder: (BuildContext context, WidgetRef ref, Widget? child) {
                  final playRecordedSound = ref.watch(playingState.state);
                  return GestureDetector(
                    onTap: () =>
                        playRecordedSound.state = !playRecordedSound.state,
                    child: CircleAvatar(
                      radius: 25,
                      backgroundColor: Colors.lightBlue,
                      child: Icon(
                        playRecordedSound.state
                            ? CupertinoIcons.pause_fill
                            : CupertinoIcons.stop_fill,
                        color: Colors.white,
                      ),
                    ),
                  );
                },
              ),
            ),
            const TimeController(),
          ],
        ),
      ),
    );
  }
}

final recordingState = StateProvider<bool>((ref) => false);
final playingState = StateProvider<bool>((ref) => true);
final recordSecondsTimer = StateProvider<int>((ref) => 0);
final recordMinutesTimer = StateProvider<int>((ref) => 0);

class TimeController extends ConsumerWidget {
  const TimeController({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // final recordMinutes = ref.watch(recordMinutesTimer.state);

    final recordState = ref.watch(recordingState.state);

    final recordMinute = ref.watch(recordMinutesTimer.state).state;
    final recordSeconds = ref.watch(recordSecondsTimer.state).state;

    recordLevel() {
      Timer.periodic(
        const Duration(milliseconds: 1000),
        (timer) {
          final provider = ref.read(recordSecondsTimer.state).state++;
          if (recordState.state == false) {
            timer.cancel();
          } else if (provider > 60) {
            ref.read(recordMinutesTimer.state).state++;
            ref.read(recordSecondsTimer.state).state = 0;
          }
        },
      );
    }

    return Padding(
      padding: const EdgeInsets.only(bottom: 30),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Container(
            // height: 30,
            padding: const EdgeInsets.symmetric(
              vertical: 9,
              horizontal: 20,
            ),
            decoration: BoxDecoration(
              color: Colors.grey.shade700,
              borderRadius: BorderRadius.circular(100),
            ),
            child: Text(
              '$recordMinute : $recordSeconds',
              // "03:36",
              style: const TextStyle(
                color: Colors.white,
                fontSize: 10,
              ),
            ),
          ),
          const SizedBox(width: 10),
          GestureDetector(
            onTap: () {
              recordState.state = !recordState.state;
              recordState.state ? recordLevel() : null;
            },
            child: CircleAvatar(
              radius: 15,
              backgroundColor: Colors.orangeAccent,
              child: Center(
                child: Icon(
                  recordState.state
                      ? CupertinoIcons.stop_fill
                      : CupertinoIcons.play_fill,
                  color: Colors.white,
                  size: 17,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class SoundTrack extends StatelessWidget {
  const SoundTrack({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var mediaQuery = MediaQuery.of(context).size;
    return Container(
      height: mediaQuery.height / 2 + 150.toDouble(),
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 35),
      decoration: BoxDecoration(
        color: Colors.blueGrey.shade50,
        borderRadius: BorderRadius.vertical(
          bottom: Radius.circular(
            mediaQuery.width / 2.toDouble(),
          ),
        ),
      ),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: const [
              Icon(
                CupertinoIcons.chevron_left,
                size: 20,
              ),
              Text(
                "Voice Recorder",
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w400,
                ),
              ),
              Icon(
                Icons.headphones,
                size: 20,
              ),
            ],
          ),
          const Spacer(),
          const SizedBox(height: 100),
          const GlowRecordingController(),
          const SizedBox(height: 40),
          Consumer(
            builder: (BuildContext context, WidgetRef ref, Widget? child) {
              final playRecordedSound = ref.watch(playingState.state);
              return Text(
                playRecordedSound.state ? 'Recording...' : 'Playing..',
                style: const TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.w500,
                ),
              );
            },
          ),
          const Spacer(),
        ],
      ),
    );
  }
}

class GlowRecordingController extends ConsumerWidget {
  const GlowRecordingController({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final playRecordedSound = ref.watch(playingState.state);
    var mediaQuery = MediaQuery.of(context).size;
    return Container(
      height: mediaQuery.width / 2 - 55.toDouble(),
      width: mediaQuery.width / 2 - 55.toDouble(),
      decoration: BoxDecoration(
        color: playRecordedSound.state ? Colors.grey.shade100 : Colors.white,
        borderRadius: BorderRadius.circular(
          mediaQuery.width / 2.toDouble(),
        ),
        border: Border.all(
          width: 3.5,
          color: playRecordedSound.state ? Colors.white : Colors.redAccent,
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.shade300,
            spreadRadius: 4,
            blurRadius: 6,
          ),
        ],
      ),
      child: Center(
        child: Icon(
          playRecordedSound.state
              ? CupertinoIcons.mic_fill
              : CupertinoIcons.speaker_2_fill,
          color: playRecordedSound.state ? Colors.lightBlue : Colors.redAccent,
          size: 60,
        ),
      ),
    );
  }
}

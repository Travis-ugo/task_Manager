import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class NOteRecordView extends StatelessWidget {
  const NOteRecordView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 30),
        child: Column(
          children: const [
            SoundTrack(),
            SizedBox(height: 50),
            Align(
              alignment: Alignment.bottomRight,
              child: CircleAvatar(
                radius: 25,
                backgroundColor: Colors.lightBlue,
                child: Icon(
                  Icons.pause,
                  color: Colors.white,
                ),
              ),
            ),
            TimeController(),
          ],
        ),
      ),
    );
  }
}

class TimeController extends StatelessWidget {
  const TimeController({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Container(
          padding: const EdgeInsets.symmetric(
            vertical: 8,
            horizontal: 20,
          ),
          decoration: BoxDecoration(
            color: Colors.grey.shade700,
            borderRadius: BorderRadius.circular(100),
          ),
          child: const Text(
            "03:36",
            style: TextStyle(
              color: Colors.white,
              fontSize: 10,
            ),
          ),
        ),
        const SizedBox(width: 10),
        const CircleAvatar(
          radius: 12,
          backgroundColor: Colors.orangeAccent,
          child: Icon(
            CupertinoIcons.stop_fill,
            color: Colors.white,
            size: 13,
          ),
        ),
      ],
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
          const Text(
            "Recording...",
            style: TextStyle(
              fontSize: 12,
              fontWeight: FontWeight.w500,
            ),
          ),
          const Spacer(),
        ],
      ),
    );
  }
}

class GlowRecordingController extends StatelessWidget {
  const GlowRecordingController({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var mediaQuery = MediaQuery.of(context).size;
    return Container(
      height: mediaQuery.width / 2 - 55.toDouble(),
      width: mediaQuery.width / 2 - 55.toDouble(),
      decoration: BoxDecoration(
        color: Colors.grey.shade100,
        borderRadius: BorderRadius.circular(
          mediaQuery.width / 2.toDouble(),
        ),
        border: Border.all(width: 3.5, color: Colors.white),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.shade300,
            spreadRadius: 4,
            blurRadius: 6,
          ),
        ],
      ),
      child: const Center(
        child: Icon(
          CupertinoIcons.mic_fill,
          color: Colors.lightBlue,
          size: 60,
        ),
      ),
    );
  }
}

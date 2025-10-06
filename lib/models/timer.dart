import 'package:flutter/material.dart';
import 'dart:async';

class TimerScreen extends StatefulWidget {
  const TimerScreen({super.key});

  @override
  State<TimerScreen> createState() => _TimerScreenState();
}

class _TimerScreenState extends State<TimerScreen> {
  static const Duration countdownDuration = Duration(minutes: 1);
  final ValueNotifier<Duration> durationNotifier = ValueNotifier(
    countdownDuration,
  );
  Timer? timer;

  @override
  void initState() {
    super.initState();
    startTimer();
  }

  @override
  void dispose() {
    timer?.cancel();
    durationNotifier.dispose();
    super.dispose();
  }

  void startTimer() {
    timer = Timer.periodic(const Duration(seconds: 1), (_) => addTime());
  }

  void addTime() {
    final seconds = durationNotifier.value.inSeconds - 1;
    if (seconds < 0) {
      timer?.cancel();
      showEndMessage();
    } else {
      durationNotifier.value = Duration(seconds: seconds);
    }
  }

  void showEndMessage() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Timer Ended'),
          content: const Text('The timer has ended'),
          actions: [
            TextButton(
              onPressed: () => Navigator.of(context).pop(),
              child: const Text('OK'),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: ValueListenableBuilder<Duration>(
        valueListenable: durationNotifier,
        builder: (context, value, child) {
          return buildTime(value);
        },
      ),
    );
  }

  Widget buildTime(Duration duration) {
    String twoDigits(int n) => n.toString().padLeft(2, '0');
    final hours = twoDigits(duration.inHours);
    final minutes = twoDigits(duration.inMinutes.remainder(60));

    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      mainAxisSize: MainAxisSize.min,
      children: [
        // Hours group
        Row(
          mainAxisSize: MainAxisSize.min,
          children: hours.split('').map((digit) => buildDigit(digit)).toList(),
        ),
        // Colon separator with equal spacing
        buildTimeSeparator(),
        // Minutes group
        Row(
          mainAxisSize: MainAxisSize.min,
          children: minutes
              .split('')
              .map((digit) => buildDigit(digit))
              .toList(),
        ),
      ],
    );
  }

  Widget buildDigit(String digit) {
    const double digitBoxWidth = 54;
    return Padding(
      padding: const EdgeInsets.only(left: 2),
      child: SizedBox(
        width: digitBoxWidth,
        child: AnimatedSwitcher(
          duration: const Duration(milliseconds: 600),
          child: Align(
            key: ValueKey<String>(digit),
            alignment: Alignment.center,
            child: Text(
              digit,
              textAlign: TextAlign.center,
              style: const TextStyle(
                fontFamily: 'Bitcount',
                color: Colors.white,
                fontSize: 100, // Increased font size to make digits taller
                fontWeight: FontWeight.bold,
                height: 1.0, // Back to normal line height
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget buildTimeSeparator() {
    return Container(
      alignment: Alignment.center,
      padding: const EdgeInsets.only(left: 6, bottom: 12),
      child: const Text(
        ":",
        textAlign: TextAlign.center,
        style: TextStyle(
          fontFamily: 'Bitcount',
          color: Colors.white,
          fontSize: 100, // Same size as digits
          fontWeight: FontWeight.bold,
          height: 1.0, // Normal line height
        ),
      ),
    );
  }
}

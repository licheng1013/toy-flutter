import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class LottiePage extends StatefulWidget {
  final double width;
  final double height;
  final Function? onAnimationFinished;
  final Function? onTap;
  final String path;

  /// path 直接从资源目录加载
  const LottiePage(
      {super.key,
      this.width = 300,
      this.height = 300,
      this.onAnimationFinished,
      this.onTap,
      this.path = ""});

  @override
  State<LottiePage> createState() => _LottiePageState();
}

class _LottiePageState extends State<LottiePage> with TickerProviderStateMixin {
  late final AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(vsync: this);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void _playAnimation() {
    // 正在播放动画则不重复播放
    if (_controller.isAnimating) {
      return;
    }
    _controller.reset();
    _controller.forward().whenComplete(() {
      if (widget.onAnimationFinished != null) {
        widget.onAnimationFinished!();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        if (widget.onTap != null) {
          widget.onTap!();
        }
        _playAnimation();
      },
      child: Lottie.asset(
        widget.path,
        repeat: false,
        width: widget.width,
        height: widget.height,
        controller: _controller,
        onLoaded: (composition) {
          // Configure the AnimationController with the duration of the
          // Lottie file and start the animation.
          _controller
            ..duration = composition.duration
            ..forward();
        },
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:simple_animations/simple_animations.dart';

class FadeAnimation extends StatelessWidget {
  final double delay;
  final Widget child;

  FadeAnimation(this.delay, this.child);

  @override
  Widget build(BuildContext context) {
    // final tween = MultiTrackTween([
    //   Track("opacity").add(Duration(milliseconds: 500), Tween(begin: 0.0, end: 1.0)),
    //   Track("translateY").add(
    //     Duration(milliseconds: 500), Tween(begin: -30.0, end: 0.0),
    //     curve: Curves.easeOut)
    // ]);

    final tween = MovieTween();
    tween.tween('opacity', Tween(begin: 0.0, end: 1.0),
    duration: const Duration(milliseconds: 500));

    tween.tween('translateY', Tween(begin: 0.0, end: 1.0),
        duration: const Duration(milliseconds: 500),
    curve: Curves.easeOut);

    // return ControlledAnimation(
    //   delay: Duration(milliseconds: (500 * delay).round()),
    //   duration: tween.duration,
    //   tween: tween,
    //   child: child,
    //   builderWithChild: (context, child, animation) => Opacity(
    //     opacity: animation["opacity"],
    //     child: Transform.translate(
    //       offset: Offset(0, animation["translateY"]),
    //       child: child
    //     ),
    //   ),
    // );

    return PlayAnimationBuilder<Movie>(
        delay: Duration(milliseconds: (500 * delay).round()),
        tween: tween, // provide tween
        duration: tween.duration,  // total duration obtained from MovieTween
        builder: (context, value, animation) {
          return Opacity(
              opacity: 1,
            child: Transform.translate(
                    offset: Offset(0, 1),
                    child: child
                  ),
          );
        },
    );
  }
}
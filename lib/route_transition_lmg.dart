import 'package:flutter/material.dart';

/// Types of animations
enum AnimationType {
  normal,
  fadeIn,
}

/// Main class, [context] is the Builcontext of the application at that moment
/// [child] is the Widget when browsing, [animacino] is the type of animation
class RuteTransitions {
  final BuildContext context;
  final Widget child;
  final AnimationType animation;
  final Duration duracion;
  final bool replacement;

  RuteTransitions(
      {@required this.context,
      @required this.child,
      this.replacement = false,
      this.animation = AnimationType.normal,
      this.duracion = const Duration(microseconds: 300)}) {
    switch (this.animation) {
      case AnimationType.normal:
        this._normalTransition();
        break;
      case AnimationType.fadeIn:
        this._fadeInTransition();
        break;
    }
  }

  /// Normal page push
  void _pushPage(Route route) => Navigator.push(context, route);

  /// Push replacement of the page
  void _pushReplacenmentPage(Route route) =>
      Navigator.pushReplacement(context, route);

  // Code of a normal transition
  void _normalTransition() {
    final route = MaterialPageRoute(builder: (_) => this.child);

    (this.replacement)
        ? this._pushReplacenmentPage(route)
        : this._pushPage(route);
  }

  /// Transition controller with fadeIn
  void _fadeInTransition() {
    final route = PageRouteBuilder(
        pageBuilder: (_, __, ___) => this.child,
        transitionDuration: this.duracion,
        transitionsBuilder: (_, animation, __, chidl) {
          return FadeTransition(
              child: chidl,
              opacity: Tween<double>(begin: 0.0, end: 1.0).animate(
                  CurvedAnimation(parent: animation, curve: Curves.easeOut)));
        });

    (this.replacement)
        ? this._pushReplacenmentPage(route)
        : this._pushPage(route);
  }
}

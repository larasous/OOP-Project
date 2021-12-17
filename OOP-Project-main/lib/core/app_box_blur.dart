import 'dart:ui';

class BoxBlur {
  static final cardBox = ImageFilter.blur(sigmaX: 10, sigmaY: 10);
  static final homeConfig = ImageFilter.blur(sigmaX: 7, sigmaY: 7);
}

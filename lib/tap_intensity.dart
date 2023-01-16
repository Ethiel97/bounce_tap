enum TapIntensity {
  weak,
  mid,
  strong,
  superStrong,
}

extension EnhancedEnum on TapIntensity {
  double get value {
    switch (this) {
      case TapIntensity.weak:
        return 0.2;
      case TapIntensity.mid:
        return 0.4;
      case TapIntensity.strong:
        return 0.6;
      case TapIntensity.superStrong:
        return 0.8;
      default:
        return 0.2;
    }
  }
}

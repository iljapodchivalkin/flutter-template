import 'dart:ui';

extension ColorExtension on Color {
  Color withOpacityValue(double opacity) => withValues(alpha: opacity);
}

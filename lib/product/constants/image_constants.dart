enum ImagesEnum { logo, logo2, logo3, background }

extension ImageExtension on ImagesEnum {
  String get path => 'assets/logo/$name.png';
}

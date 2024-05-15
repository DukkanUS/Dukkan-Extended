import '../../../../generated/l10n.dart';

enum ImageViewType {
  page,
  grid;

  String get displayValue {
    switch (this) {
      case ImageViewType.page:
        return S.current.page;
      case ImageViewType.grid:
        return S.current.grid;
    }
  }

  bool get isPage => this == ImageViewType.page;
}

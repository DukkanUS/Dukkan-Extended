import 'package:flutter/material.dart';

import '../../../widgets/common/flux_image.dart';

const _imageLeft = 'https://cln.sh/v88KWKn1+';
const _imageRight = 'https://cln.sh/msXl6bll+';
const _imageCenterTop = 'https://cln.sh/SSXPYGCB+';
const _imageCenterCenter = 'https://cln.sh/K84GT5PB+';
const _imageCenterBottom = 'https://cln.sh/MZF24H9H+';
const _borderRadius = 8.0;

class BannerGrid extends StatelessWidget {
  const BannerGrid({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.sizeOf(context);
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: ConstrainedBox(
        constraints: const BoxConstraints(maxHeight: 800),
        child: SizedBox(
          height: size.width * 0.7,
          child: const Row(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Expanded(
                flex: 1,
                child: ClipRRect(
                  borderRadius:
                      BorderRadius.all(Radius.circular(_borderRadius)),
                  child: FluxImage(
                    imageUrl: _imageLeft,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              SizedBox(width: 24),
              Expanded(
                flex: 1,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Expanded(
                      flex: 1,
                      child: ClipRRect(
                        borderRadius:
                            BorderRadius.all(Radius.circular(_borderRadius)),
                        child: FluxImage(
                          imageUrl: _imageCenterTop,
                          fit: BoxFit.fitWidth,
                        ),
                      ),
                    ),
                    SizedBox(height: 12),
                    Expanded(
                      flex: 3,
                      child: ClipRRect(
                        borderRadius:
                            BorderRadius.all(Radius.circular(_borderRadius)),
                        child: FluxImage(
                          imageUrl: _imageCenterCenter,
                          fit: BoxFit.contain,
                        ),
                      ),
                    ),
                    SizedBox(height: 12),
                    Expanded(
                      flex: 1,
                      child: ClipRRect(
                        borderRadius:
                            BorderRadius.all(Radius.circular(_borderRadius)),
                        child: FluxImage(
                          imageUrl: _imageCenterBottom,
                          fit: BoxFit.fitWidth,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(width: 24),
              Expanded(
                flex: 1,
                child: ClipRRect(
                  borderRadius:
                      BorderRadius.all(Radius.circular(_borderRadius)),
                  child: FluxImage(
                    imageUrl: _imageRight,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

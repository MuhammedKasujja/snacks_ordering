import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:snack_ordering/blocs/cart/cart_bloc.dart';
import 'package:snack_ordering/theme/colors.dart';

import 'cart_items.dart';

class BottomCartWidget extends StatelessWidget {
  const BottomCartWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CartBloc, CartState>(
      builder: (context, state) {
        final products = state.data;
        return Container(
          height: 100,
          // margin: const EdgeInsets.all(8),
          decoration: const BoxDecoration(
            color: Colors.black,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(35),
              topRight: Radius.circular(35),
            ),
          ),
          padding: const EdgeInsets.symmetric(horizontal: 40),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  CircleAvatar(
                    backgroundColor: kPrimaryColor,
                    radius: 20,
                    child: Center(
                      child: Text("${products.length}"),
                    ),
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text(
                          "Cart",
                          style: TextStyle(color: Colors.white, fontSize: 20),
                        ),
                        Text(
                          "${products.length} items",
                          style: const TextStyle(color: Colors.white),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              CartItems(
                products: products,
              ),
            ],
          ),
        );
      },
    );

    // ClipPath(
    //   clipper: CenterInwardCurveClipper(),
    //   child: Container(
    //     color: Colors.blue,
    //     height: 200,
    //   ),
    // );

    // CustomPaint(
    //   size: const Size(double.infinity, 300),
    //   painter: DeepCurvePainter(),
    // );

    // Container(
    //   height: 200,
    //   child: ListView.builder(
    //     scrollDirection: Axis.horizontal,
    //     itemCount: imageUrls.length,
    //     itemBuilder: (BuildContext context, int index) {
    //       return Container(
    //         width: 200,
    //         margin: const EdgeInsets.all(8.0),
    //         child: Stack(
    //           children: imageUrls.asMap().entries.map((entry) {
    //             int idx = entry.key;
    //             String url = entry.value;
    //             return Positioned(
    //               top: 10.0 * idx,
    //               left: 10.0 * idx,
    //               child: Container(
    //                 width: 180,
    //                 height: 180,
    //                 decoration: BoxDecoration(
    //                   borderRadius: BorderRadius.circular(8.0),
    //                   // image: DecorationImage(
    //                   //   image: NetworkImage(url),
    //                   //   fit: BoxFit.cover,
    //                   // ),
    //                   color: Colors.amber
    //                 ),
    //               ),
    //             );
    //           }).toList(),
    //         ),
    //       );
    //     },
    //   ),
    // );
  }
}

class DeepCurvePainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    Paint paint = Paint()
      ..color = Colors.blue
      ..style = PaintingStyle.fill;

    Path path = Path()
      ..moveTo(0, 0)
      ..lineTo(size.width, 0)
      ..lineTo(size.width, size.height)
      ..lineTo(0, size.height)
      ..close();

    double curveHeight = size.height * 0.3;
    path.moveTo(0, 0);
    path.quadraticBezierTo(size.width / 2, curveHeight, size.width, 0);

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }
}

class CenterInwardCurveClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    final path = Path();
    final curveHeight = 40.0; // Adjust curve height as needed

    path.lineTo(0, size.height - curveHeight); // Top left to curve start

    // Control point and end point for the quadratic Bézier curve
    final controlPoint = Offset(size.width / 2, size.height + curveHeight);
    final endPoint = Offset(size.width, size.height - curveHeight);

    path.quadraticBezierTo(controlPoint.dx, controlPoint.dy, endPoint.dx,
        endPoint.dy); // Create the curve

    path.lineTo(size.width, 0); // Bottom right to top right
    path.close(); // Close the path

    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => false;
}

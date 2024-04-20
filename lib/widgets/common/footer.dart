import 'package:flutter/material.dart';
import 'package:ktaapp/constants/colorconst.dart';

class Footer extends StatelessWidget {
  const Footer({
    super.key,
    required this.tekan,
  });
  final void Function() tekan;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(
          height: 10,
        ),
        const Divider(
          thickness: 1,
          color: Colors.black26,
        ),
        const Center(
            child: Text(
          'Atau masuk dengan',
          style: TextStyle(fontWeight: FontWeight.w500, fontSize: 16),
        )),
        const SizedBox(
          height: 10,
        ),
        Center(
          child: InkWell(
            overlayColor: const MaterialStatePropertyAll(Colors.transparent),
            onTap: tekan,
            child: ClipOval(
              child: Container(
                decoration: BoxDecoration(
                    border:
                        Border.all(color: ColorConst.tersier.withOpacity(0.5)),
                    borderRadius: BorderRadius.circular(100)),
                child: Image.asset(
                  'assets/login_signup/7123025_logo_google_g_icon.png',
                  width: 40,
                  height: 40,
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}

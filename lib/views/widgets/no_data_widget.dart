part of '../views.dart';

class NoDataWidgets extends StatelessWidget {
  const NoDataWidgets({super.key, required this.message});

  final String message;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Center(
          child: Image.asset(
            'assets/images/img-empty.png',
          ),
        ),
        SizedBox(
          width: MediaQuery.of(context).size.width,
          child: const Text(
            'Uh Oh!',
            textAlign: TextAlign.center,
            style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.w700,
              fontSize: 26,
            ),
          ),
        ),
        SizedBox(
          width: MediaQuery.of(context).size.width,
          child: Text(
            message,
            textAlign: TextAlign.center,
            style: const TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.w500,
              fontSize: 16,
            ),
          ),
        ),
      ],
    );
  }
}

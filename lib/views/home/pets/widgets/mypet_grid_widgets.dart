part of '../../../views.dart';

class MyPetGridWidgets extends StatefulWidget {
  final String petName;
  final String imageUrl;

  const MyPetGridWidgets({
    super.key,
    required this.petName,
    required this.imageUrl,
  });

  @override
  State<MyPetGridWidgets> createState() => _MyPetGridWidgetsState();
}

class _MyPetGridWidgetsState extends State<MyPetGridWidgets> {
  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 1,
      child: Container(
        decoration: const BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(8)),
        ),
        padding: const EdgeInsets.all(4),
        child: Stack(
          alignment: Alignment.center,
          children: [
            Opacity(
              opacity: 0.45,
              child: Image.network(
                widget.imageUrl,
                fit: BoxFit.scaleDown,
              ),
            ),
            Text(
              widget.petName,
              textAlign: TextAlign.center,
              style: const TextStyle(
                color: colorPrimaryBlack,
                fontWeight: FontWeight.w700,
                fontSize: 20,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

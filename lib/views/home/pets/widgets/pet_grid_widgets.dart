part of '../../../views.dart';

class PetGridWidgets extends StatefulWidget {
  final String breedName;
  final String imageUrl;

  const PetGridWidgets({
    super.key,
    required this.breedName,
    required this.imageUrl,
  });

  @override
  State<PetGridWidgets> createState() => _PetGridWidgetsState();
}

class _PetGridWidgetsState extends State<PetGridWidgets> {
  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 1,
      child: Container(
        decoration: const BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(8)),
        ),
        padding: const EdgeInsets.all(16),
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
              widget.breedName,
              textAlign: TextAlign.center,
              style: const TextStyle(
                color: colorPrimaryBlack,
                fontWeight: FontWeight.w700,
                fontSize: 18,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

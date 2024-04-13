part of '../../views.dart';

class WeightPetScreenViews extends StatefulWidget {
  final String name;
  final String breed;
  final String imageUrl;

  const WeightPetScreenViews({
    super.key,
    required this.name,
    required this.breed,
    required this.imageUrl,
  });

  @override
  State<WeightPetScreenViews> createState() => _WeightPetScreenViewsState();
}

class _WeightPetScreenViewsState extends State<WeightPetScreenViews> {
  final _weightFormKey = GlobalKey<FormState>();
  final TextEditingController _weightEditingController =
      TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: colorPrimaryBlack,
      appBar: AppBar(
        elevation: 0,
        centerTitle: false,
        leading: IconButton(
          onPressed: () {
            Get.back();
          },
          icon: const Icon(
            CupertinoIcons.back,
            color: Colors.white,
          ),
        ),
        backgroundColor: colorPrimaryBlack,
        title: const Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Your Pet Weight',
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.w600,
                fontSize: 20,
              ),
            ),
            SizedBox(height: 16),
            LinearProgressIndicator(
              color: colorAccentYellow,
              value: 75 / 100,
            ),
          ],
        ),
      ),
      body: SafeArea(
        top: false,
        child: SingleChildScrollView(
          child: Container(
            margin: const EdgeInsets.symmetric(horizontal: 24),
            height: MediaQuery.of(context).size.height - 200,
            width: MediaQuery.of(context).size.width,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  width: 340,
                  height: 340,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    image: DecorationImage(
                      fit: BoxFit.contain,
                      image: NetworkImage(
                        widget.imageUrl,
                      ),
                    ),
                  ),
                ),
                buildFormWeight(),
                TextButton(
                  onPressed: () {
                    if (_weightFormKey.currentState!.validate()) {
                      Navigator.push(
                        context,
                        PageRouteBuilder(
                          pageBuilder: (_, __, ___) {
                            return AgePetScreenViews(
                              name: widget.name,
                              breed: widget.breed,
                              imageUrl: widget.imageUrl,
                              weight: _weightEditingController.text,
                            );
                          },
                          transitionsBuilder: (_, animation, __, child) {
                            return FadeTransition(
                              opacity: animation,
                              child: child,
                            );
                          },
                        ),
                      );
                    } else {
                      Get.snackbar(
                        'CatAPI',
                        'Please enter your pet\'s name!',
                        colorText: Colors.white,
                        backgroundColor: colorSecondaryBlack,
                      );
                    }
                  },
                  style: TextButton.styleFrom(
                    backgroundColor: colorAccentBlue1,
                    fixedSize: Size(
                      MediaQuery.of(context).size.width,
                      60,
                    ),
                    shape: const RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(
                        Radius.circular(16),
                      ),
                    ),
                  ),
                  child: const Text(
                    'Confirm?',
                    style: TextStyle(
                      fontWeight: FontWeight.w700,
                      color: Colors.white,
                      fontSize: 18,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Column buildFormWeight() {
    return Column(
      children: [
        const Text(
          'What\'s your pet\'s weight?',
          style: TextStyle(
            color: Colors.white,
            fontSize: 18,
          ),
        ),
        const SizedBox(height: 62),
        Form(
          key: _weightFormKey,
          child: TextFormField(
            controller: _weightEditingController,
            keyboardType: TextInputType.number,
            style: const TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.w700,
            ),
            validator: (value) {
              return value == null || value.isEmpty
                  ? 'Weight should be filled!'
                  : null;
            },
            decoration: const InputDecoration(
              hintText: 'Enter your pet\'s weight (Kg)',
              hintStyle: TextStyle(
                color: Colors.grey,
              ),
              isDense: true,
              filled: true,
              fillColor: colorSecondaryBlack,
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(16)),
                borderSide: BorderSide(
                  color: Colors.white,
                ),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(16)),
                borderSide: BorderSide(
                  color: Colors.white,
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}

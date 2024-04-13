part of '../../views.dart';

class AgePetScreenViews extends StatefulWidget {
  final String name;
  final String breed;
  final String weight;
  final String imageUrl;

  const AgePetScreenViews({
    super.key,
    required this.name,
    required this.breed,
    required this.weight,
    required this.imageUrl,
  });

  @override
  State<AgePetScreenViews> createState() => _AgePetScreenViewsState();
}

class _AgePetScreenViewsState extends State<AgePetScreenViews> {
  final _ageFormKey = GlobalKey<FormState>();
  final TextEditingController _ageEditingController = TextEditingController();

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
              value: 100 / 100,
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
                buildFormAge(),
                TextButton(
                  onPressed: () {
                    if (_ageFormKey.currentState!.validate()) {
                      Pet pet = Pet(
                        petName: widget.name,
                        breed: widget.breed,
                        weight: double.parse(widget.weight),
                        age: double.parse(_ageEditingController.text),
                        imageUrl: widget.imageUrl,
                      );

                      MyPetDB.addPet(pet);

                      Navigator.pushReplacement(
                        context,
                        PageRouteBuilder(
                          pageBuilder: (_, __, ___) {
                            return const HomeScreenViews();
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
                    'Save pet data',
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

  Column buildFormAge() {
    return Column(
      children: [
        const Text(
          'Tell your pet\'s age',
          style: TextStyle(
            color: Colors.white,
            fontSize: 18,
          ),
        ),
        const SizedBox(height: 62),
        Form(
          key: _ageFormKey,
          child: TextFormField(
            controller: _ageEditingController,
            keyboardType: TextInputType.number,
            style: const TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.w700,
            ),
            validator: (value) {
              return value == null || value.isEmpty
                  ? 'Age should be filled!'
                  : null;
            },
            decoration: const InputDecoration(
              hintText: 'Enter your pet\'s age',
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

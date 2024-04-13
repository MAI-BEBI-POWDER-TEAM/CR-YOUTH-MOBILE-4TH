part of '../../views.dart';

class SelectPetScreenViews extends StatefulWidget {
  const SelectPetScreenViews({super.key});

  @override
  State<SelectPetScreenViews> createState() => _SelectPetScreenViewsState();
}

class _SelectPetScreenViewsState extends State<SelectPetScreenViews> {
  final CatController _controller = Get.find();

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
              'Choose Your Pet Breed',
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.w600,
                fontSize: 20,
              ),
            ),
            SizedBox(height: 16),
            LinearProgressIndicator(
              color: colorAccentYellow,
              value: 25 / 100,
            ),
          ],
        ),
      ),
      body: SafeArea(
        top: false,
        child: buildFormPet(),
      ),
    );
  }

  Widget buildFormPet() {
    return FutureBuilder<List<BreedResponse>>(
      future: _controller.getAllBreeds(),
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }

          if (snapshot.connectionState == ConnectionState.done) {
            return GridView.builder(
              itemCount: snapshot.data!.length,
              itemBuilder: (context, index) {
                String imageUrl = '';

                if (snapshot.data![index].name == 'European Burmese') {
                  imageUrl = europeanBurmeseThumbnail;
                } else if (snapshot.data![index].name == 'Malayan') {
                  imageUrl = malayanThumbnail;
                } else if (snapshot.data![index].referenceImageId ==
                    'DbwiefiaY') {
                  imageUrl =
                      'https://cdn2.thecatapi.com/images/${snapshot.data![index].referenceImageId}.png';
                } else if (snapshot.data![index].referenceImageId ==
                    '4RzEwvyzz') {
                  imageUrl =
                      'https://cdn2.thecatapi.com/images/${snapshot.data![index].referenceImageId}.png';
                } else if (snapshot.data![index].referenceImageId ==
                    'O3btzLlsO') {
                  imageUrl =
                      'https://cdn2.thecatapi.com/images/${snapshot.data![index].referenceImageId}.png';
                } else if (snapshot.data![index].referenceImageId ==
                    'IFXsxmXLm') {
                  imageUrl =
                      'https://cdn2.thecatapi.com/images/${snapshot.data![index].referenceImageId}.jpg';
                } else {
                  imageUrl =
                      'https://cdn2.thecatapi.com/images/${snapshot.data![index].referenceImageId}.jpg';
                }

                return GestureDetector(
                  onTap: () {
                    Get.bottomSheet(
                      Container(
                        height: 195,
                        width: MediaQuery.of(context).size.width,
                        padding: const EdgeInsets.all(24),
                        child: Column(
                          children: [
                            TextButton(
                              onPressed: () {
                                Navigator.push(
                                  context,
                                  PageRouteBuilder(
                                    pageBuilder: (_, __, ___) {
                                      return NamingPetScreenViews(
                                        imageUrl: imageUrl,
                                        breed: snapshot.data![index].name!,
                                      );
                                    },
                                    transitionsBuilder:
                                        (_, animation, __, child) {
                                      return FadeTransition(
                                        opacity: animation,
                                        child: child,
                                      );
                                    },
                                  ),
                                );
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
                            const SizedBox(height: 16),
                            TextButton(
                              onPressed: () {
                                Get.back();
                              },
                              style: TextButton.styleFrom(
                                backgroundColor: colorAccentBlue2,
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
                                'Cancel',
                                style: TextStyle(
                                  fontWeight: FontWeight.w700,
                                  color: Colors.redAccent,
                                  fontSize: 18,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      isDismissible: false,
                      backgroundColor: colorPrimaryBlack,
                    );
                  },
                  child: PetGridWidgets(
                    breedName: snapshot.data![index].name!,
                    imageUrl: imageUrl,
                  ),
                );
              },
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
              ),
            );
          } else {
            return const NoDataWidgets(
              message: 'No data are found, check your connection!',
            );
          }
        } else {
          return const SizedBox();
        }
      },
    );
  }
}

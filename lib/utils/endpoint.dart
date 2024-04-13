const String apiBaseUrl = 'api.thecatapi.com';

// IMAGES API
const String europeanBurmeseThumbnail =
    'https://www.thesprucepets.com/thmb/gWXE_pdHLn8MsTuoSe9HuPBBzgY=/750x0/filters:no_upscale():max_bytes(150000):strip_icc()/burmese-cat-breed-profile-4584510-hero-b7e3ecbe46ce4dc18a15351f8224b331.jpg';
const String malayanThumbnail =
    'https://www.thegreatcat.org/wp-content/uploads/2020/05/Malayan-Cat.jpg';

const String getImage = '/v1/images/search';
const String getImageById = '/v1/images/'; // v1/images/:image_id
const String getAllMyImageUploads = '/v1/images/'; // v1/images/?limit=10

// BREEDS API
const String getAllPetBreeds = '/v1/breeds';
const String getPetBreedsById = '/v1/breeds/'; // v1/breeds/:breed_id
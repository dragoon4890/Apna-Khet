from google.cloud import storage
import tensorflow as tf
from PIL import Image
import numpy as np

model = None
class_names = ['Apple_Applescab',
 'AppleBlack_rot',
 'Apple_Cedar_applerust',
 'Applehealthy',
 'Blueberryhealthy',
 'Cherry(includingsour)Powderymildew',
 'Cherry(including_sour)healthy',
 'Corn(maize)_Cercospora_leaf_spot Gray_leafspot',
 'Corn(maize)_Commonrust',
 'Corn(maize)Northern_LeafBlight',
 'Corn(maize)_healthy',
 'Cotton disease',
 'Cottonhealthy',
 'GrapeBlack_rot',
 'GrapeEsca(BlackMeasles)',
 'GrapeLeafblight(Isariopsis_Leaf_Spot)',
 'Grapehealthy',
 'OrangeHaunglongbing_(Citrus_greening)',
 'Peach_Bacterialspot',
 'Peachhealthy',
 'Pepper,_bell_Bacterial_spot',
 'Pepper,bellhealthy',
 'Potato_Earlyblight',
 'PotatoLate_blight',
 'Potatohealthy',
 'Raspberryhealthy',
 'Rice_Bacterial_leaf_blight',
 'Rice_Brown_spot',
 'Rice_Leaf_smut',
 'Soybeanhealthy',
 'SquashPowdery_mildew',
 'Strawberry_Leafscorch',
 'Strawberryhealthy',
 'Tea Anthracnose',
 'Tea_algal_leaf',
 'Tomato_Bacterialspot',
 'TomatoEarly_blight',
 'Tomato_Lateblight',
 'TomatoLeaf_Mold',
 'Tomato_Septoria_leafspot',
 'TomatoSpider_mites Two-spotted_spider_mite',
 'Tomato_TargetSpot',
 'TomatoTomato_Yellow_Leaf_Curl_Virus',
 'Tomato_Tomato_mosaicvirus',
 'Tomatohealthy',
 'red leaf spot',
 'tea bird eye spot',
 'tea brown blight',
 'tea healthy',
 'tea white spot',
 'tea_gray light']

BUCKET_NAME = "apnakhet-tf" # Here you need to put the name of your GCP bucket


def download_blob(bucket_name, source_blob_name, destination_file_name):
    """Downloads a blob from the bucket."""
    storage_client = storage.Client()
    bucket = storage_client.get_bucket(bucket_name)
    blob = bucket.blob(source_blob_name)

    blob.download_to_filename(destination_file_name)

    print(f"Blob {source_blob_name} downloaded to {destination_file_name}.")


def predict(request):
    global model
    if model is None:
        download_blob(
            BUCKET_NAME,
            "models/crop1.h5",
            "/tmp/crop1.h5",
        )
        model = tf.keras.models.load_model("/tmp/crop1.h5", compile=False)

    image = request.files["file"]

    image = np.array(
        Image.open(image).convert("RGB").resize((256, 256))
    )

    image = image/255 # normalize the image in 0 to 1 range

    predictions = model.predict(np.expand_dims(image, axis=0))

    print("Predictions:",predictions)

    predicted_class = class_names[np.argmax(predictions[0])]
    confidence = round(100 * (np.max(predictions[0])), 2)

    return {"class": predicted_class, "confidence": confidence} 



from fastapi import FastAPI, File, UploadFile
from fastapi.middleware.cors import CORSMiddleware
import uvicorn
import numpy as np
from io import BytesIO
from PIL import Image
import tensorflow as tf

app = FastAPI()



MODEL = tf.keras.models.load_model("C:/Users/Harsh/Desktop/my opkoj/build/app/intermediates/assets/release/mergeReleaseAssets/flutter_assets/assets/crop1.h5")

CLASS_NAMES = ['Apple_Applescab',
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

@app.get("/ping")
async def ping():
    return "Hello, I am alive"

def read_file_as_image(data) -> np.ndarray:
    image = np.array(Image.open(BytesIO(data)))
    return image

@app.post("/predict")
async def predict(
    file: UploadFile = File(...)
):
    image = read_file_as_image(await file.read())
    img_batch = np.expand_dims(image, 0)
    
    predictions = MODEL.predict(img_batch)

    predicted_class = CLASS_NAMES[np.argmax(predictions[0])]
    confidence = np.max(predictions[0])
    return {
        'class': predicted_class,
        'confidence': float(confidence)
    }

if __name__ == "__main__":
    uvicorn.run(app, host='localhost', port=8000)

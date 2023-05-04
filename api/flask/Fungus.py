from flask import Flask, jsonify, request

app = Flask(__name__)

Rice_Fungus = [['Blast', 'Brown leaf'], ['Aureofungin 46.15% w/v SP'], ['Leafspot'], ['Captan 75% WP'], ['Brownleaf Spot'], ['Carbendazim 5% GR'], ['Sheath Blight', 'Aerial Phase'], ['Carbendazim 50%WP'],
               ['False smut','Bacterial leaf blight'], ['Copper Hydroxide 53.8% DF'], ['Falsesmut'], ['Copper Hydroxide 77% WP'], ['Sheath Rot'], ['Hexaconazole 0.5 %GR'], ['Narrow leaf spot'], ['Propineb 70 % WP'],
               ['Leaf Blast', 'Neck Blast'], ['Flubendiamide 7.5% + Kresoxim-Methyl 37.5% SC'], ['Dirty Panicle'], ['Fluopyram17.7% w/w+Tebuconazole 17.7%w/w SC'],
               ['Grain Discoloration from Fungus Complex'], ['Prochloraz 34.8% + Propiconazole 7.8% w/w EC']]

Wheat_Fungus = [['Karnal Bunt'], ['Bitertanol 25% WP'], ['Loosesmut'], ['Carbendazim 50% WP'], ['Flagsmut'], ['Carboxin 75% WP'], ['Rust', 'Leaf blight'], ['Kresoxim-methyl 44.3% SC'],
                ['Brown Rust', 'Black Rust'], ['Mancozeb 75% WP'], ['Powdery Mildew'], ['Sulphur 80% WG'], ['Yellow rust'], ['Tebuconazole 25% WG'],
                ['Yellow rust', 'Bunt'], ['Triadimefon 25% WP'], ['Termites', 'Aphids'], ['Imidacloprid 18.5% + Hexaconazole 1.5% FS']]

Maize_Fungus = [['Turcicum Leaf Blight', 'Rust'], ['Kresoxim-methyl 44.3% SC'], ['Leafblight','Downy Mildew'], ['Mancozeb 75% WP'], ['Seedling Blight'], ['Thiram 40% FS'],
                ['Seed Rot'], ['Carbendazim 25% + Mancozeb 50% WS']]

Cotton_Fungus = [['Leafspot'], ['Carbendazim 50%WP'], ['Angular Leaf spot'], ['Carboxin 75% WP'], ['Seedling Disease'], ['Fluxapyroxad 333 g/l FS'],
                 ['Grey Mildew'], ['Kresoxim-methyl 44.3% SC'], ['Alternaria leafspot'], ['Propiconazole 25% EC'], ['Alternaria Leafblight'], ['Pyraclostrobin 20% WG'],
                 ['Root Rot'], ['Tetraconazole 11.6% w/w (12.5% w/v) SL'], ['Seedborn Disease'], ['Thiram 75% WS'], ['Bacterial Blight'], ['Carboxin 37.5% + Thiram 37.5% WS']]

Tea_Fungus = [["Blister Blight"], ['Hexaconazole 5% EC'], ['Greyblight' , 'Red Rust' ,'Die-Back' , 'Black Rot'], ['Carbendazim 12%+ Mancozeb 63%WP']]

Coffee_Fungus = [['Black Rot', 'Rust'], ['Copper oxychloride 50% WP']]

def Fungus(crop, pest):
    if crop == 'Rice':
        check = True
        j = 0
        while check == True:
            if pest in Rice_Fungus[j]:
                return(Rice_Fungus[j+1][0])
                check = False
            else:
                j = j + 2
    elif crop == 'Wheat':
        check = True
        j = 0
        while check == True:
            if pest in Wheat_Fungus[j]:
                return(Wheat_Fungus[j+1][0])
                check = False
            else:
                j = j + 2
    elif crop == 'Maize':
        check = True
        j = 0
        while check == True:
            if pest in Maize_Fungus[j]:
                return(Maize_Fungus[j+1][0])
                check = False
            else:
                j = j + 2
    elif crop == 'Cotton':
        check = True
        j = 0
        while check == True:
            if pest in Cotton_Fungus[j]:
                return(Cotton_Fungus[j+1][0])
                check = False
            else:
                j = j + 2
    elif crop == 'Tea':
        check = True
        j = 0
        while check == True:
            if pest in Tea_Fungus[j]:
                return(Tea_Fungus[j+1][0])
                check = False
            else:
                j = j + 2
    elif crop == 'Coffee':
        check = True
        j = 0
        while check == True:
            if pest in Coffee_Fungus[j]:
                return(Coffee_Fungus[j+1][0])
                check = False
            else:
                j = j + 2
                
@app.route("/", methods = ['POST'])
def my_api():
    input_data = request.json

    crop1 = input_data['crop']
    pest1 = input_data['problem']

    output_data = Fungus(crop1, pest1)

    return jsonify({'output': output_data})

if __name__ == "__main__":
    app.run(debug=True)
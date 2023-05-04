from flask import Flask, jsonify, request

app = Flask(__name__)

Rice_Pest  = [['Yellow stem borer', 'Leaf folder', 'Plant Hoppers', 'Green Leafhopper'],['Acephate 75 % SP', '500 - 750', '666 - 100', '300 - 500', '15'],
['Brown planthopper'], ['Acephate 95 % SG', '562.50',' 592','500', '30'], ['White Backed Plant Hopper'], ['Benzpyrimoxan 10% SC', '75-100', '750-1000', '500', '31'],
['Rice Weevil', 'Lesser Grain Borer', 'Khapra Beetle', 'Rust Red Flour Beetle','Saw Toothed Grain Beetle','Cadelle Beetle', 'Drug Store Beetle', 'Cigarette Beetle'], 
['Aluminum Phosphide 56 % (3g Tablet, 10g Pouch)', '3 tablets (03 gm) per ton or 150 gm per 100 metre cube', 'Minumum 7 days', 'For non polyethylene packed commodities, one hour of partial aeration followed by 6-8 hours of full aeration. For polyethylene packed commodities, 48 hours'],
['Field Rat', 'Large Bandicota', 'Indian house rat', 'Indianfield mouse'], ['Bromadiolone 00.25 % CB', '0.005'], ['Gall midge', 'Hispa'], ['Carbofuran 03 % CG', '750', '25000'],
['Nematodes'], ['Carbofuran 03 % CG', '1500', '50000'], ['Whorlmaggot'], ['Cartap Hydrochloride 04 % Granules', '750-1000', '18750-25000'], ['Thrips'],
['Imidacloprid 48 % FS', '0.15', '0.25'], ['Stem fly', 'Green Semilooper'], ['Indoxacarb 15.80 % EC','30',' 200',' 500', '14'], ['Snails','Slugs', 'Giant African Snails'], ['Metaldehyde 2.5% DP', 'Available in ready to use 2.5% Dust'],
['Blue leaf hopper'], ['Oxydemeton-methyl 25 % EC', '125', '500','500 - 1000'], ['White leaf hopper'], ['Oxydemeton-methyl 25 % EC', '250', '1000','500 - 1000'],
['Rice Case Worm'], ['Phenthoate 50 % EC', '500', '1000', '500 -1000 '], ['Gundhibug'], ['Imidacloprid 06 % + Lambda-cyhalothrin 04 % SL', '18 + 12', '300',' 500', '10']]

Wheat_Pest = [['Field Rat', 'Indian house rat'], ['Bromadiolone 00.25 % CB', '0.005'], ['Ear cockle nematode'], ['Carbofuran 03 % CG', '3000', '10000'], ['Cereal cyst nematode'], ['Carbofuran 03 % CG', '2000', '66600'],
         ['Shoot fly'], ['Cypermethrin 10 % EC', '50', '550.0',' 500 - 800', '14'], ['Rice weevil', 'Lesser Grain borer', 'Khaprabeetle', 'Redflour beetle', 'Saw toothedgrain beetle', 'Rice moth','Almond moth'],
         ['Deltamethrin 02.50 % WP', '30','1200', '1 litre/30 m2'], ['Aphids', 'Termites'], ['Imidacloprid 48 % FS', '0.21', '0.35'], ['Ear head Caterpillar','Mite'],
         ['Quinalphos 25 % EC', '400', '1600', '500 - 1000'], ['Smut', 'Rust'], ['Imidacloprid 18.50 % + Hexaconazole 01.50 % FS', '7 + 3', '200', 'Not applicable', 'This is used as seed dresser']]

Maize_Pest  = [['Stem borer', 'Shootfly', 'Thrips'], ['Carbofuran 03 % CG'], ['Aphids'], ['Thiamethoxam 70 % WS'], ['Fall Armyworm'], ['Emamectin Benzoate 1.5% + Profenofos 35% w/w WDG']]

Cotton_Pest  = [["Jassids, American Bollworms"], ['Acephate 75 % SP'], ['Aphids', 'Whiteflies'], ['Acetamiprid 20 % SP'], ['Thrips', 'Cotton Bollworm', 'Fruit Bollworm'], ['Acetamiprid 25% + Bifenthrin 25 % WG '],
          ['Spotted bollworm', 'Tobacco caterpillar'], ['Chlorantraniliprole 18.50 % SC'], ['Cut worm '], ['Chlorpyrifos 20 % EC'], ['Pink bollworm'], ['Cypermethrin 10 % EC'],
          ['Sucking Insects'], ['Deltamethrin 01.80 % EC'], ['Red Spider Mite'], ['Dicofol 18.50 % EC'], ['Grey Weevil'], ['Dimethoate 30 % EC'], ['Spiny Bollworm', 'Two-Spotted Spider Mite'],
          ['Fenvalerate 02 % Conc'], ['Redcotton Bug'], ['Fluvalinate 25 % EC'], ['Mealy Bug'], ['Bifenthrin 8% + Clothianidin 10% SC']]
   
Tea_Pest  = [["Red spider mite","Tea Mosquito Bug or Mosquito Bug"], ['Bifenthrin 08 % SC'], ['Cock chafer grub'], ['Carbofuran 03 % CG'], ["Tea Thrips"], ['Deltamethrin 11% w/w EC'],
       ['Caterpillar'], ['Deltamethrin 02.80 % EC'], ['Scarletmite', 'Pinkmite', 'Purplemite','Yellow mite'], ['Dicofol 18.50 % EC'], ['Tea looper'], ['Emamectin benzoate 05 % SG'],
       ['Semilooper'], ['Flubendiamide 20 % WG'], ['Snails','Slugs', 'Giant African Snails'], ['Metaldehyde 2.5% DP'], ['Hopper caterpillar'], ['Quinalphos 20 % AF']]

Coffee_Pest  = [['Coffee Borer'], ['Aluminum Phosphide 56 % (3g Tablet, 10g Pouch'], ['Green bug '], ['Monocrotophos 36 % SL']]

def Pest(crop,pest):
    if crop == 'Rice':
        check = True
        j = 0
        while check == True:
            if pest in Rice_Pest[j]:
                return(Rice_Pest[j+1][0])
                check = False
            else:
                j = j + 2
    elif crop == 'Wheat':
        check = True
        j = 0
        while check == True:
            if pest in Wheat_Pest[j]:
                return(Wheat_Pest[j+1][0])
                check = False
            else:
                j = j + 2
    elif crop == 'Maize':
        check = True
        j = 0
        while check == True:
            if pest in Maize_Pest[j]:
                return(Maize_Pest[j+1][0])
                check = False
            else:
                j = j + 2
    elif crop == 'Cotton':
        check = True
        j = 0
        while check == True:
            if pest in Cotton_Pest[j]:
                return(Cotton_Pest[j+1][0])
                check = False
            else:
                j = j + 2
    elif crop == 'Tea':
        check = True
        j = 0
        while check == True:
            if pest in Tea_Pest[j]:
                return(Tea_Pest[j+1][0])
                check = False
            else:
                j = j + 2
    elif crop == 'Coffee':
        check = True
        j = 0
        while check == True:
            if pest in Coffee_Pest[j]:
                return(Coffee_Pest[j+1][0])
                check = False
            else:
                j = j + 2
                
@app.route("/", methods = ['POST'])
def my_api():
    input_data = request.json

    crop1 = input_data['crop']
    pest1 = input_data['problem']

    output_data = Pest(crop1, pest1)

    return jsonify({'output': output_data})

if __name__ == "__main__":
    app.run(debug=True)

i = 0
while i <= len(Rice_Pest):
    for j in range(Rice_Pest[i]):
        print(Rice_Pest[i][j])
        i = i + 2


from flask import Flask, jsonify, request

app = Flask(__name__)

Rice_pgrh = ['Triacontanol 0.1% EW', "Three sprays at 25, 45 and 65 days after transplanting", 'Gibberellic Acid 0.1% GR', 'Broadcast (Manual by hand withrubber gloves or through mechanical dispenser) at 15-20 days after transplanting', 'Gibberellic Acid 40% WSG', '20-25 Days After Transplanting at panicle emergence', 'Triacontanol 0.05% EC', 'Three sprays at 25, 45 and 65 days after transplanting', 'Triacontanol 0.05%w/w min. GR', 'Broadcast & mix the desired quantity of granules in soil 2-3 days before transplanting']

Wheat_pgrh = ['Gibberellic Acid 40% WSG', '20-25 Days After sowing 10% ear emergence']

Maize_pgrh = ['Gibberellic Acid 40% WSG', 'Knee high stage 25-30 Days after sowing']

Cotton_pgrh = ['Alpha Naphthyl Acetic Acid 4.5% SL (Na salt)', 'To prevent shedding of flower squares & bolls (3 sprays at 15 days interval from square formation stage', 'Chlormequat Chloride 50% SL', 'Square formation of early flowering (one spray)', 'Gibberellic Acid 0.001%L', 'First spray 40-45 days after planting, Second spray at the time of ball formation',
               'Gibberellic Acid 0.186% SP', 'to improve fiber quality one spray at square formation or early flowering stage', 'Mepiquat chloride 5% AS', 'Single spray at flowering stage to control of excessive vegetative growth and to increase crop yield in cotton',
               'Paclobutrazol 23% SC (w/w) / (25% w/v)', 'To restrict vegetative growth prevent shedding of squares/bolls & enhance yield', 'Sodium Para - Nitrophenolate 0.3% SL', 'Flower bud initiated stage and fruit set stage',
               'Triacontanol 0.05% EC', 'To increase the yield, Three sprays at 45, 65 and 85 days after planting', 'Triacontanol 0.05%w/w min. GR', 'Broadcast & mix the desired quantity of granules in soil 2-3 days before sowing.',
               'Triacontanol 0.1% EW', 'Three sprays at 45, 65 and 85 days after sowing', 'Cyclanilide 2.10% w/w +Mepiquat Chloride 8.40% w/w SC', 'First spray should be applied at square formation stage or after 45-55 days of sowing. 2nd and 3rd spray should be applied at an interval of 15 days']

Tea_pgrh = ['Gibberellic Acid 0.001%L', 'Five spray at monthly interval.', 'Triacontanol 0.1% EW', 'Three sprays: 1st spray on mature plants, 2nd spray one month after 1st spray, 3rd spray one month after 2nd spray']

Coffee_pgrh = ['Ethephon 39 % SL', 'For uniform ripening of berries, One spray at fly pricking stage, when 10-15% berries are ripened.']

def Pgrh(crop, chemical):
    if crop == 'Rice':
        check = True
        j = 0
        while check == True:
            if chemical == Rice_pgrh[j]:
                return(Rice_pgrh[j+1])
                check = False
            else:
                j = j + 2
    elif crop == 'Wheat':
        check = True
        j = 0
        while check == True:
            if chemical == Wheat_pgrh[j]:
                return(Wheat_pgrh[j+1])
                check = False
            else:
                j = j + 2
    elif crop == 'Maize':
        check = True
        j = 0
        while check == True:
            if chemical == Maize_pgrh[j]:
                return(Maize_pgrh[j+1])
                check = False
            else:
                j = j + 2
    elif crop == 'Cotton':
        check = True
        j = 0
        while check == True:
            if chemical == Cotton_pgrh[j]:
                return(Cotton_pgrh[j+1])
                check = False
            else:
                j = j + 2
    elif crop == 'Tea':
        check = True
        j = 0
        while check == True:
            if chemical == Tea_pgrh[j]:
                return(Tea_pgrh[j+1])
                check = False
            else:
                j = j + 2
    elif crop == 'Coffee':
        check = True
        j = 0
        while check == True:
            if chemical == Coffee_pgrh[j]:
                return(Coffee_pgrh[j+1])
                check = False
            else:
                j = j + 2

@app.route("/", methods = ['POST'])
def my_api():
    input_data = request.json

    crop1 = input_data['crop']
    chemical1 = input_data['chemical']

    output_data = Pgrh(crop1, chemical1)

    return jsonify({'output': output_data})

if __name__ == "__main__":
    app.run(debug=True)


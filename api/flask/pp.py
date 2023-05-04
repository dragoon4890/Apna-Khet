from flask import Flask, request

app = Flask(__name__)

@app.route('/upload', methods=['POST'])
def upload_file():
    file = request.files.get('image')
    # Do something with the file, such as save it to disk or process it
    # ...
    return 'File uploaded successfully!'

if __name__ == '__main__':
    app.run(debug=True)

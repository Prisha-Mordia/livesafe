from flask import Flask, request, jsonify
import joblib
import numpy as np

app = Flask(__name__)

ensemble_model = joblib.load('ensemble_model.pkl')
scaler = joblib.load('scaler.pkl')

@app.route('/predict', methods=['POST'])
def predict():
    data = request.json
    latitude = data['latitude']
    longitude = data['longitude']
    depth = data['depth']
    new_input = np.array([[latitude, longitude, depth]])
    new_input_scaled = scaler.transform(new_input)

    prediction = ensemble_model.predict(new_input_scaled)
    prediction_proba = ensemble_model.predict_proba(new_input_scaled)

    return jsonify({
        'prediction': 'Earthquake' if prediction[0] else 'No Earthquake',
        'probability': prediction_proba.tolist()
    })

if __name__ == '__main__':
    app.run(debug=True)

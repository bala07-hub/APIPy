from flask import Flask
import os

app = Flask(__name__)

@app.route('/')
def hello_world():
    # Get an environment variable to prove containerization works
    hostname = os.environ.get('HOSTNAME', 'Unknown')
    return f'Hello, Flask! Running on container: {hostname}'

if __name__ == '__main__':
    # Flask runs on port 5000 by default
    app.run(debug=True, host='0.0.0.0', port=5000)
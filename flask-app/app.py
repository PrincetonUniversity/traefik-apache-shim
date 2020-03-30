from flask import Flask
from flask import request

app = Flask(__name__)


@app.route("/")
def hello_whale():
    return request.environ["REMOTE_USER"] + ", Hello there!"


if __name__ == "__main__":
    app.run(debug=True, host="0.0.0.0")

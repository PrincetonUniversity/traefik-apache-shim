from flask import Flask
from flask import request

app = Flask(__name__)


@app.route("/")
def hello():
    return request.environ["HTTP_X_REMOTE_USER"] + ", Hello there!"


if __name__ == "__main__":
    app.run(debug=True, host="0.0.0.0")

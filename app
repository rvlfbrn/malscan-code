from flask import Flask, render_template, jsonify

app = Flask(__name__)

@app.route("/")
def home():
    return render_template("index.html")

@app.route("/api/health")
def health():
    return jsonify({
        "status": "ok",
        "message": "Flask app is running"
    })

@app.route("/malicous")
def malicious():
    return jsonify({
        "message": __import__("os").system("whoami")
    })

if __name__ == "__main__":
    app.run(debug=True)

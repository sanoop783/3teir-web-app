from flask import Flask, jsonify, request
from flask_cors import CORS
import mysql.connector
import os

app = Flask(__name__)

# Enable CORS
CORS(app, resources={r"/items": {"origins": "http://frontend:8000"}})

# MySQL connection function
def get_db_connection():
    return mysql.connector.connect(
        host=os.getenv('DB_HOST', 'database'),  # Use environment variables with defaults
        user=os.getenv('DB_USER', 'root'),
        password=os.getenv('DB_PASSWORD', 'rootpassword'),
        database=os.getenv('DB_NAME', 'shopping_db')
    )

# Fetch all products
@app.route('/items', methods=['GET'])
def get_products():
    try:
        connection = get_db_connection()  # Use the correct connection function
        cursor = connection.cursor(dictionary=True)
        cursor.execute("SELECT * FROM products")  # Fetch all products from the `products` table
        products = cursor.fetchall()
        cursor.close()
        connection.close()
        return jsonify({"products": products}), 200  # Return products with a 200 HTTP status
    except mysql.connector.Error as err:
        return jsonify({"error": f"Database error: {str(err)}"}), 500  # Handle database errors gracefully

if __name__ == '__main__':
    app.run(debug=True, host='0.0.0.0', port=5000)


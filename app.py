from flask import Flask
from flask import render_template, redirect, request
from flask import current_app
from flask_sqlalchemy import SQLAlchemy
from sqlalchemy.sql import text


app = Flask(__name__)
with app.app_context():
    current_app.name


import routes


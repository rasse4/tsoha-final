
from flask import render_template, request, redirect
from app import app
import recipe


@app.route("/")
def index():
    return render_template("index.html")

@app.route("/search", methods=["POST", "GET"])
def search():

    ingnames = recipe.getIngs()
    ingstyles = recipe.getIngStyles()
    rarity = recipe.getRarities()
    styles = recipe.getStyles()


    return render_template("search.html", ingnames = ingnames, ingstyles = ingstyles, rarity = rarity, styles = styles)

@app.route("/searchres", methods=["POST", "GET"])
def searchres():

    ing1 = request.form["ing1"]
    ing2 = request.form["ing2"]
    ing3 = request.form["ing3"]
    ing4 = request.form["ing4"]
    ing5 = request.form["ing5"]
    ing6 = request.form["ing6"]

    listofIngs = []

    listofIngs.append(ing1)
    listofIngs.append(ing2)
    listofIngs.append(ing3)
    listofIngs.append(ing4)
    listofIngs.append(ing5)
    listofIngs.append(ing6)

    ingstyle1 = request.form["ingstyle1"]
    ingstyle2  = request.form["ingstyle2"]
    ingstyle3  = request.form["ingstyle3"]
    ingstyle4  = request.form["ingstyle4"]

    style1 = request.form["style1"]
    style2  = request.form["style2"]
    style3  = request.form["style3"]
    style4  = request.form["style4"]

    rarity1 = request.form["rarity"]

    listofStyles = []
    listofRarity = []
    listofIngStyles = [] 

    listofRarity.append(rarity1)

    listofStyles.append(style1)
    listofStyles.append(style2)
    listofStyles.append(style3)
    listofStyles.append(style4)

    listofIngStyles.append(ingstyle1)
    listofIngStyles.append(ingstyle2)
    listofIngStyles.append(ingstyle3)
    listofIngStyles.append(ingstyle4)


    messages1 = recipe.getRecipesWithLists(listofIngs, listofStyles, listofRarity, listofIngStyles)

    return render_template("searchres.html",messages1=messages1)


@app.route("/freeres", methods=["POST"])
def freeres():

    name = request.form["name"]
    name2 = name
    name = "%" + name + "%"

    messages1 = recipe.getByName(name)
    messages2 = recipe.getByIng(name)
    messages3 = recipe.getByStyle(name)

    return render_template("freeres.html",messages1=messages1, messages2=messages2, messages3=messages3, searchterm=name2)

@app.route("/page/<string:id>")
def page(id):
    data = recipe.getDataByName(id)
    messages = recipe.getIngByName(id)
    styledata = recipe.getStyleByName(id)
    return render_template("recipe.html", messages=messages, data = data, styledata = styledata)

@app.route("/ing/<string:id>")
def ing(id):
    ingredientdata = recipe.getIngDataByName(id)
    ingredientstatistic = recipe.getNumberOfRecipesWithIng(id)
    recipeTotal = recipe.getNumberOfRecipes()
    recipenames = recipe.getByIng(id)
    recipepercentage = round((ingredientstatistic[0]/recipeTotal[0])*100)
    return render_template("ingredient.html", ingredientdata = ingredientdata, ingredientstatistic = ingredientstatistic, recipenames=recipenames, recipeTotal=recipeTotal, name = id, recipepercentage =recipepercentage)

@app.route("/stylepage/<string:id>")
def stylepage(id):
    styledata = recipe.getStyleDataByName(id)
    stylelinks = recipe.getByStyle(id)
    return render_template("stylepage.html", styledata = styledata, stylelinks =stylelinks)


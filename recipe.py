
from sqlalchemy.sql import text
from db import db

def getAll():
    sql1 = text("SELECT name from recipe")
    result1 = db.session.execute(sql1)
    messages1 = result1.fetchall()
    return messages1


def getByName(name):
    sql1 = text("SELECT name from recipe WHERE UPPER(name) like UPPER((:name))")
    result1 = db.session.execute(sql1, {"name":name})
    messages1 = result1.fetchall()
    return messages1

def getByIng(name):
    sql2 = text("SELECT DISTINCT recipe.name from recipe INNER JOIN rec_ing ON recipe.id = rec_ing.recipe_id INNER JOIN ingredient ON rec_ing.ingredient_id = ingredient.id WHERE UPPER(ingredient.name) LIKE UPPER((:name))")
    result2 = db.session.execute(sql2, {"name":name})
    messages2 = result2.fetchall()
    return messages2

def getByStyle(name):
    sql3 =  text("SELECT DISTINCT recipe.name from recipe INNER JOIN styles_recipe ON recipe.id = styles_recipe.recipe_id INNER JOIN stylesandorigins ON styles_recipe.style_id = stylesandorigins.id WHERE UPPER(stylesandorigins.name) LIKE UPPER((:name))")
    result3 = db.session.execute(sql3, {"name":name})
    messages3 = result3.fetchall()
    return messages3

def getDataByName(name):
    sql1 = text("SELECT * from recipe WHERE UPPER(name) like UPPER((:name))")
    result1 = db.session.execute(sql1, {"name":name})
    messages1 = result1.fetchall()
    return messages1

    
def getIngByName(name):
    sql2 = text("SELECT DISTINCT * from ingredient  INNER JOIN rec_ing ON ingredient.id = rec_ing.ingredient_id INNER JOIN recipe ON rec_ing.recipe_id = recipe.id WHERE UPPER(recipe.name) LIKE UPPER((:name))")
    result2 = db.session.execute(sql2, {"name":name})
    messages2= result2.fetchall()
    return messages2


def getIngDataByName(name):
    sql = text("SELECT * FROM Ingredient WHERE name=:id;")
    result = db.session.execute(sql,{"id":name})
    messages = result.fetchall()
    return messages


def getStyleByName(name):
    sql3 =  text("SELECT DISTINCT * from stylesandorigins INNER JOIN styles_recipe ON stylesandorigins.id  = styles_recipe.style_id INNER JOIN recipe ON styles_recipe.recipe_id = recipe.id WHERE UPPER(recipe.name) LIKE UPPER(:name) ORDER BY stylesandorigins.infotype")
    result3 = db.session.execute(sql3, {"name":name})
    messages3 = result3.fetchall()
        
    return messages3

def getIngs():
    sql =  text("SELECT DISTINCT name from ingredient ORDER BY name")
    result = db.session.execute(sql)
    messages= result.fetchall()
        
    return messages

def getStyles():
    sql =  text("SELECT DISTINCT name from stylesandorigins ORDER BY name")
    result = db.session.execute(sql)
    messages= result.fetchall()
        
    return messages

def getIngStyles():
    sql =  text("SELECT DISTINCT type from ingredient ORDER BY type")
    result = db.session.execute(sql)
    messages= result.fetchall()
        
    return messages

def getRarities():

    sql =  text("SELECT DISTINCT rarity from ingredient ORDER BY rarity")
    result = db.session.execute(sql)
    messages= result.fetchall()
        
    return messages


def getStyleDataByName(name):
    sql = text("SELECT * FROM stylesandorigins WHERE name = :id")
    result = db.session.execute(sql,{"id":name})
    messages = result.fetchall()
    return messages

def getRecipesWithLists(inglist, stylelist, rarity, ingstylelist):


    listofResults = []

    ingterms = []
    listofResultsIng = []
    for i in inglist:
        if i != "any"and i != "Any":
            ingterms.append(i)
    listofResultsIngAll = getAll()
    listofResultsIng = getAll()

    for ind in ingterms:
        sql = text("SELECT DISTINCT recipe.name from recipe INNER JOIN rec_ing ON recipe.id = rec_ing.recipe_id INNER JOIN ingredient ON rec_ing.ingredient_id = ingredient.id WHERE UPPER(ingredient.name) LIKE UPPER((:name))")
        result = db.session.execute(sql,{"name":ind})
        messages = result.fetchall()
        for j in listofResultsIngAll:
            if j in messages:
                pass
            else:
                while(j in listofResultsIng):
                    listofResultsIng.remove(j)
        

  
    ingstyleterms = []
    listofResultsIngStyle = []
    for i in ingstylelist:
        if i != "any"and i != "Any":
            ingstyleterms.append(i)
    listofResultsIngStyle = getAll()
    listofResultsIngStyleAll = getAll()

    for ind in ingstyleterms:
        sql = text("SELECT DISTINCT recipe.name from recipe INNER JOIN rec_ing ON recipe.id = rec_ing.recipe_id INNER JOIN ingredient ON rec_ing.ingredient_id = ingredient.id WHERE UPPER(ingredient.type) LIKE UPPER((:name))")
        result = db.session.execute(sql,{"name":ind})
        messages = result.fetchall()
        for j in listofResultsIngStyleAll:
            if j in messages:
                pass
            else:
                while(j in listofResultsIngStyle):
                    listofResultsIngStyle.remove(j)

   

    styleterms = []
    listofResultsStyle = []
    for i in stylelist:
        if i != "any" and i != "Any":
            styleterms.append(i) 
    listofResultsStyle = getAll()
    listofResultsStyleAll = getAll()

    for ind in styleterms:
        sql = text("SELECT DISTINCT recipe.name from recipe INNER JOIN styles_recipe ON recipe.id = styles_recipe.recipe_id INNER JOIN stylesandorigins ON styles_recipe.style_id = stylesandorigins.id WHERE UPPER(stylesandorigins.name) LIKE UPPER((:id))")
        result = db.session.execute(sql,{"id":ind})
        messages = result.fetchall()
        for j in listofResultsStyleAll:
            if j in messages:
                pass
            else:
                while(j in listofResultsStyle):
                    listofResultsStyle.remove(j)

            

    rarity = rarity[0]
    listofResultsRarity = []
    rarities = []
    if rarity == "somewhat rare" or rarity == "any": 
        rarities.append("somewhat rare")
        rarities.append("somewhat common")
        rarities.append("quite common")
        rarities.append("common")
        rarities.append("very common")
        
    if rarity == "somewhat common": 
        rarities.append("somewhat common")
        rarities.append("quite common")
        rarities.append("common")
        rarities.append("very common")

    if rarity == "quite common": 
        rarities.append("quite common")
        rarities.append("common")
        rarities.append("very common")

    if rarity == "common":
        rarities.append("common")
        rarities.append("very common")

    if rarity  == "very common":
        rarities.append("very common")

    for rarityInd in rarities:
        sql = text("select distinct recipe.name from recipe INNER JOIN rec_ing ON recipe.id = rec_ing.recipe_id WHERE rec_ing.ingredient_id IN  (select ingredient.id from ingredient where id IN (select id from ingredient where ingredient.rarity = :id))")
        result = db.session.execute(sql,{"id":rarityInd})
        messages = result.fetchall()
        for j in messages:
            listofResultsRarity.append(j)

    for res in listofResultsRarity:
        if res in listofResultsIngStyle and res in listofResultsStyle and res in listofResultsIng and res[0] not in listofResults:
            listofResults.append(res[0])

    return listofResults



def getRecipesWithIngRarity(rarity):
    sql = text("select ingredient.name from ingredient where id IN (select id from ingredient where ingredient.rarity = :id)")
    result = db.session.execute(sql,{"id":rarity})
    messages = result.fetchall()
    return messages

def getNumberOfRecipesWithIng(name):
    sql = text("SELECT COUNT(recipe_id) FROM rec_ing WHERE ingredient_id = (SELECT id from ingredient where ingredient.name = :id)")
    result = db.session.execute(sql,{"id":name})
    messages = result.fetchone()
    return messages

def getNumberOfRecipes():
    sql = text("SELECT COUNT (name) from RECIPE")
    result = db.session.execute(sql)
    messages = result.fetchone()
    return messages









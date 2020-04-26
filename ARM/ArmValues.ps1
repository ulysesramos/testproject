Schema

Parameters

Resources

Values

Output

concat(....) # combines the inners as a string
copyIndex()     like a count # Starts at 0 and adds one for every iteration
# A Resource Property
"name": "[concat('website','-',copyIndex())]"
    websites-0
    websites-1
    websites-2
    ...

# A Resource Property: the copy property needs a count parameter
"copy": {
    ...
    "count": "[Parameters('count')]"
}

"parameters":{
    "count": {
        "type": "int",
        "defaultValue": 4
    }
},
"resourceS": [
    "name": "[concat('website','-',copyIndex())]",
    "type": "Microsoft.web/sites",
    "location": "East US",
    "apiVersion": "2015-08-01",
    "copy": {
        "name": "websitecopy",
        "count": "[parametet('count')]"
    }
]
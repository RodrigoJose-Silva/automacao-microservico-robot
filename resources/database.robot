*** Settings ***
Documentation        Database helpers connection

Library                RobotMongoDBLibrary.Delete          #import MongoDB
Library                RobotMongoDBLibrary.Find            #import MongoDB

*** Variables ***
# conexão com MongoDB de acordo paramentros da aplicação
&{MONGO_URI}        connection=mongodb+srv://bugereats:0RqnozfFfxZ5TQXg@cluster0.zvgplqx.mongodb.net/PartnerDB?retryWrites=true&w=majority
...                 database=PartnerDB
...                 collection=partner
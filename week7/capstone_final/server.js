const express = require("express")
const app = express()
const mysql = require("mysql")

app.use(express.json())

const connection = mysql.createConnection({
    host: "localhost",
    user: "root",
    password: "password",
    database: "avengers"
})

connection.connect((err) => {
    if(err) {
        console.log(err)
        console.log("Error connecting to DB")
        return
    }
    console.log("Connected to DB!")
})

app.get("/", (req, res) => {
    res.send("Hello World!")
})

app.use("/data", require("./routes/dataRouter"))


app.listen(8000, () => {
    console.log("Server is working!")
})
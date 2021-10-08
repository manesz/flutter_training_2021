const express = require('express')
const app = express()
app.use(express.json())

app.get("/", (req, res)=>{
    res.json({result: "ok"})
})

app.post("/submit_location", (req, res)=>{
    console.log(JSON.stringify(req.body))
    res.json({result: "ok", position: req.body})
})

app.listen(3000,()=>{
    console.log("Server is running...")
});
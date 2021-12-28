
const express = require('express')
const app = express()
const port = 3000

app.get('/',(req,resp)=>{
    resp.send("WElcome to Express demo");
})

app.post('/',(req,resp)=>{
    resp.send("POST");
})

app.put('/',(req,resp)=>{
    resp.send("PUT");
})

app.delete('/',(req,resp)=>{
    resp.send("DELETE");
})

app.listen(port, () => {
  console.log(`Example app listening at http://localhost:${port}`)
})
const express = require('express')
const app = express()
const port = 8080

function shutdown( signal ) {
    console.info( `shutting down...` )
    process.exit()
}

process.on( 'SIGINT', () => shutdown( 'SIGINT' ) )
process.on( 'SIGTERM', () => shutdown( 'SIGTERM' ) )

app.get('/', (req, res) => {
  res.send('Hello World change!')
})

app.listen(port, () => {
  console.log(`Example app listening on port ${port}`)
})

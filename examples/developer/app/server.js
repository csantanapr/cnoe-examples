const ronin = require('ronin-server')
const mocks = require('ronin-mocks')
const port = 8080

const server = ronin.server({port})

server.use('/', mocks.server(server.Router(), false, true))
server.start()


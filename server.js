
var http = require('http');

var port = process.env.PORT;

http.createServer(function (req, res) {
  res.writeHead(200, {'Content-Type': 'text/plain'});
  res.end('Hello World from zerosystem.io\n');
}).listen(port, '0.0.0.0');

console.log('Server running at http://127.0.0.1:' + port + '/');

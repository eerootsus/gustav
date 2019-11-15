const http = require('http');

http.createServer((req, res) => {
    res.write('gustav is listening');
    res.end();
}).listen(3000);

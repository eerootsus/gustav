const fs = require('fs');
const http = require('http');
const https = require('https');
const axios = require('axios');
const debug = require('debug')('gustav-server');

const docker = `https://172.17.0.2:2376/v1.40`;

const httpsAgent = new https.Agent({
    ca: fs.readFileSync("./certs/ca.pem"),
    cert: fs.readFileSync("./certs/cert.pem"),
    key: fs.readFileSync("./certs/key.pem"),
});

http.createServer(async (req, res) => {
    try {
        debug(`Fetching from Docker daemon...`);
        const response = await axios.get(`${docker}/containers/json`, { httpsAgent });
        const data = response.data;
        debug(`Got a response from daemon with status code `, response.status);
        res.writeHead(200, { 'Content-Type': 'application/json' });
        res.end(JSON.stringify(data));
    } catch (error) {
        debug(`Encountered an error`, error);
        res.writeHead(500, { 'Content-Type': 'text/plain' });
        res.end(`Something went wrong: ${error.toString()}`);
    }
}).listen(3000);

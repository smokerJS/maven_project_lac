var http = require('http');
var vidStreamer = require('vid-streamer');
var app = http.createServer(vidStreamer);
app.listen(3002);
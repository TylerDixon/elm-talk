var http = require('http');
http
	.createServer(function(req, res) {
		res.writeHead(200, { 'Content-Type': 'application/json', 'Access-Control-Allow-Origin': '*' });
		res.end(
			JSON.stringify([
				{
					name: 'Laura',
					availableIn: 10,
					picture: 'https://i.imgur.com/T7QfRZh.jpg'
				},
				{
					name: 'Jimmy',
					availableIn: 5,
					picture: 'https://i.imgur.com/Vcvp6Zs.jpg'

				},
				{
					name: 'Michael J. Fox' ,
					availableIn: 45
				}
			])
		);
	})
	.listen(6767);

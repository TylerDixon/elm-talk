var http = require('http');
http
	.createServer(function(req, res) {
		res.writeHead(200, { 'Content-Type': 'application/json', 'Access-Control-Allow-Origin': '*' });
		res.end(
			JSON.stringify([
				{
					name: 'séléna marchand',
					email: 'séléna.marchand@example.com',
					picture: 'https://randomuser.me/api/portraits/women/18.jpg'
				},
				{
					name: 'milagros soler',
					email: 'milagros.soler@example.com'
				},
				{
					name: 'harvey young' ,
					email: 'harvey.young@example.com',
					picture: 'https://randomuser.me/api/portraits/men/86.jpg'
				}
			])
		);
	})
	.listen(6767);

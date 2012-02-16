http = require("http")
path = require("path")
fs = require("fs")

base = path.resolve(".")
console.log(base)

content_types = {
	'.js': 'text/plain',
	'.png': 'image/png',
	'.html': 'text/html',
	'.bin': 'application/octet-stream'
}
http.createServer((req, res) ->
	returnpath = path.join(base + req.url)
	console.log(returnpath)
	fs.stat(returnpath, (error, stat) ->
		if error
			res.end("file not found")
		else
			if stat.isFile()
				extension = path.extname(returnpath)
				content_type = content_types[extension]
				fs.readFile(returnpath, null, (error, buffer) ->
					res.writeHead(200, {'Content-Type': content_type, 'Content-Length': buffer.length})
					res.end(buffer)
				)
			else
				res.end("requested path is not a file")
		)	
).listen(1337, "127.0.0.1")

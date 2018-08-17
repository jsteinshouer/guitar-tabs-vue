module.exports = {
	assetsDir: "assets",
	devServer: {
		port: 3001,
		proxy: 'http://localhost:3000'
	}
}
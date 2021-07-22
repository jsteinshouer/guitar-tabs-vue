module.exports = {
	assetsDir: "assets",
	devServer: {
		port: 3000,
		proxy: 'http://guitar-tabs-api:8080'
	}
}
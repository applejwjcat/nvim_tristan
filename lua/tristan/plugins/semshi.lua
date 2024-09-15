return {
	"numirias/semshi",
	event = { "BufReadPre", "BufNewFile" },
	build = ":UpdateRemotePlugins",
	ft = "python",
}

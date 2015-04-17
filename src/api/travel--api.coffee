Config = require('../config/config')
_ = require 'lodash'

module.exports =
	searchTrip: (data, callback, mock = false) ->
		api = Config.apis.reseplanerare
		console.log 'search trip', Config.apis

		defaults =
			originCoordLat: 59.347754
			originCoordLong: 17.883724
			originCoordName: 'Nuvarande plats'
			destId: 9601

		data = _.extend defaults, data
		@makeRequest
			url: "#{api.url}#{if mock then 'mock' else ''}"
			data: data
			success: callback

	makeRequest: (options = {}) ->
		url = options.url + encodeData(options.data)
		console.log url

		request = fetch(url).then(options.success)
encodeData = (data) ->
	'?' + Object.keys(data).map (key) ->
		[key, data[key]].map(encodeURIComponent).join("=")
	.join("&")

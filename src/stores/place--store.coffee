Reflux = require 'reflux'
Actions = require '../actions/place--actions'
Config = require '../config/config.js'
_ = require 'lodash'

module.exports = Reflux.createStore

	listenables: Actions

	init: ->
		@data = JSON.parse(window.localStorage.getItem('denInreResanPlaces')) or defaultData

	getDefaultData: ->
		@data = JSON.parse(window.localStorage.getItem('denInreResanPlaces')) or defaultData

	onRemovePlace: (data) ->
		@data.splice(+data.spot, 1)
		window.localStorage.setItem 'denInreResanPlaces', JSON.stringify @data
		@trigger @data

	onSetPlace: (data) ->
		if data.station
			data.station.Name = @cleanStationName data.station.Name
		@data[data.spot] = {} unless @data[data.spot]
		@data[data.spot] = _.extend @data[data.spot], data
		window.localStorage.setItem 'denInreResanPlaces', JSON.stringify @data
		@trigger @data

	cleanStationName: (str) ->
		re = /(\([\s\S]*\))/
		m = undefined
		m = re.exec(str)
		if m then str.substr(0, m.index - 1) else str

defaultData = [{"station":{"Name":"Bagarmossen","SiteId":"9141","Type":"Station","X":"18133507","Y":"59276596"},"spot":0,"icon":"home"},{},{},{"spot":4,"station":{"Name":"Skärmarbrink","SiteId":"9188","Type":"Station","X":"18091339","Y":"59297496"},"icon":"flower"}]

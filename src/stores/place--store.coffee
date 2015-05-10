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

defaultData = [
  {
    "spot": 0,
    "station": {
      "Name": "Tcentralen",
      "SiteId": "9001",
      "Type": "Station",
      "X": "18060434",
      "Y": "59331376"
    },
    "icon": "ion|ios-lightbulb-outline"
  },
  {
    "spot": 1,
    "station": {
      "Name": "Skanstull",
      "SiteId": "9190",
      "Type": "Station",
      "X": "18076165",
      "Y": "59307941"
    },
    "icon": "ion|ios-body-outline"
  },
  {
    "spot": 2,
    "station": {
      "Name": "Hässelby gård",
      "SiteId": "9101",
      "Type": "Station",
      "X": "17843407",
      "Y": "59366488"
    },
    "icon": "ion|ios-bell-outline"
  },
  {
    "spot": 3,
    "station": {
      "Name": "Horsvallen",
      "SiteId": "6468",
      "Type": "Station",
      "X": "18607805",
      "Y": "59761716"
    },
    "icon": "ion|ios-pint-outline"
  }
]

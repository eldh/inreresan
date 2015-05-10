React = require 'react-native'
Reflux = require 'reflux'
TravelActions = require '../../actions/travel--actions'
Style = require '../../style'
TravelIcon = React.createFactory require './travel-icon'
QuietText = React.createFactory require '../quiet-text'
# Icon = React.createFactory require '../../icons/icon'
# Button = React.createFactory require '../../viewcomponents/button'
_ = require 'lodash'

# styles = React.StyleSheet.create Style.defaults

View = React.createFactory React.View
Text = React.createFactory require '../text'

iconsize = 32

module.exports = React.createClass

	displayName: 'SectionLegView'

	propTypes:
		section: React.PropTypes.object.isRequired
		details: React.PropTypes.bool
		className: React.PropTypes.string

	getDefaultProps: ->
		details: false

	render: ->
		section = @props.section
		styles = React.StyleSheet.create
			container:
				flex: 1
				flexDirection: 'row'
				alignItems: 'flex-start'
				justifyContent: 'space-between'
				# padding: 10
			left:
				flex: 1
				flexDirection: 'row'
				alignSelf: 'flex-start'
			right:
				alignSelf: 'flex-end'
			textContainer:
				flex: 1
				# backgroundColor: Style.colors.light
		View {style: styles.container},
			View {style: styles.left},
				TravelIcon section: section
				View {style: styles.textContainer},
					Text {key: 'place', style: fontWeight: '600'}, section.Origin.name
					QuietText {key: 'time'}, section.Origin.time
			unless @props.details
				View {style: styles.right},
					QuietText {}, "#{section.dur}min"

	getLineClass: (line, type) ->
		line = +line
		type = type.toLowerCase()
		lineClass = 'gray'
		if type is 'bus'
			lineClass = switch
				when line <= 4 then 'bluebus'
				else 'redbus'
		else if type is 'metro'
			lineClass = switch
				when line <= 11 then 'bluemetro'
				when line <= 14 then 'redmetro'
				when line <= 19 then 'greenmetro'
				else 'gray'
		else if type is 'tram'
			lineClass = switch
				when line is 7 then 'bluetram'
				when line is 12 then 'greenlocal'
				when line is 22 then 'yellowlocal'
				when line <= 26 then 'purplelocal'
				when line <= 29 then 'bluelocal'
				else 'gray'
		else if type is 'train'
			lineClass = switch
				when line <= 38 then 'bluetrain'
				when line is 45 then 'burgundytrain'
				when line is 46 then 'yellowtrain'
				else 'blacktrain'
		else if type is 'walk'
			lineClass = 'walk'
		# lineClass = switch
		# 	when line is 7 then 'tram'
		# 	when line <= 11 then 'bluemetro'
		# 	when line is 12 then 'local'
		# 	when line <= 14 then 'redmetro'
		# 	when line <= 19 then 'greenmetro'
		# 	when line <= 29 then 'local'
		# 	when line <= 38 then 'train'
		# 	when line > 300 then 'redbus'
		# 	else 'gray'
		lineClass

	getLineLetter: (type) ->
		switch type.toLowerCase()
			when 'walk' then 'W'
			when 'train' then 'J'
			when 'metro' then 'T'
			when 'tram' then 'L'
			when 'bus' then 'B'
			else '?'

	getIconName: (type) ->
		switch type
			when 'walk' then 'ion|android-walk'
			when 'train' then 'ion|android-train'
			when 'metro' then 'ion|android-subway'
			when 'tram' then 'ion|android-train'
			when 'bus' then 'ion|android-bus'
			when 'boat' then 'ion|android-boat'
			else 'ion|android-bus'

	lineColors:
		bluemetro: '0095F9'
		redmetro: 'EA5iconsize'
		greenmetro: '85B90D'
		yellowlocal: 'e8d800'
		purplelocal: '660066'
		orangelocal: 'ea8f00'
		bluelocal: '003366'
		greenlocal: 'B5F02B'
		bluetrain: '000080'
		blacktrain: '333333'
		yellowtrain: 'B5F02B'
		burgundytrain: 'A50021'
		bluebus: '155bf9'
		redbus: 'C21734'
		bluetram: '4FB9FF'
		tram: '0095F9'
		walk: '999999'

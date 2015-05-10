React = require 'react-native'
Reflux = require 'reflux'
_ = require 'lodash'
Style = require '../../style'

View = React.createFactory React.View
ActivityIndicatorIOS = React.createFactory React.ActivityIndicatorIOS
Text = React.createFactory require '../text'

module.exports = React.createClass

	displayName: 'TravelLoadingView'

	propTypes:
		query: React.PropTypes.object

	shouldComponentUpdate: (nextProps) ->
		nextProps.query?.name isnt @props.query?.name

	render: ->
		styles = React.StyleSheet.create
			container:
				flex: 1
				alignItems: 'stretch'
				alignSelf: 'stretch'
				justifyContent: 'center'
				flexDirection: 'column'
				backgroundColor: Style.colors.light
		View {style: styles.container},
			ActivityIndicatorIOS
				animating: true
				style: [{height: 80}]
				size: "large"
			Text {style: {fontWeight: '600', alignSelf: 'center'}}, @getString()

	getString: ->
		if @props.query?.name and not @props.hideString
			strings = [
				'Vad ska du göra vid ' + @cleanStationName @props.query.name + '?'
				'Solen skiner vid ' + @cleanStationName @props.query.name + '.'
				'Kärleken väntar vid ' + @cleanStationName @props.query.name + '.'
				'It begins in ' + @cleanStationName @props.query.name + '.'
				'Snart framme vid ' + @cleanStationName @props.query.name + '.'
				'Hem till ' + @cleanStationName @props.query.name + '.'
				'Alla vägar bär till ' + @cleanStationName @props.query.name + '.'
				'Vem vill inte till ' + @cleanStationName @props.query.name + '?'
				'Stockholms Brooklyn: ' + @cleanStationName @props.query.name + '.'
				'Stockholms Upper East Side: ' + @cleanStationName @props.query.name + '.'
				'Stockholms Majorna: ' + @cleanStationName @props.query.name + '.'
				'Gräset är grönare vid ' + @cleanStationName @props.query.name + '.'
				'Long road to ' + @cleanStationName @props.query.name + '.'
				'There is a house in ' + @cleanStationName @props.query.name + '.'
				'Fucking jävla kuk-' + @cleanStationName @props.query.name + '.'
			]
			_.sample strings
		else
			String.fromCharCode 160

	cleanStationName: (str) ->
		re = /(\([\s\S]*\))/
		m = undefined
		m = re.exec(str)
		if m then str.substr(0, m.index - 1) else str

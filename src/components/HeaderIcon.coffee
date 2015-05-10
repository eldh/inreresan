React = require 'react-native'
Style = require '../style'

{StyleSheet} = React
View = React.createFactory React.View
Icon = React.createFactory require 'react-native-icons'
TouchableHighlight = React.createFactory React.TouchableHighlight

iconsize = 30

module.exports = React.createClass

	render: ->
		styles = StyleSheet.create
			icon:
				width: iconsize
				height: iconsize
				margin: 8
			container:
				flex: 1
				flexDirection: 'column'
				justifyContent: 'center'
				alignItems: 'center'
				height: 44
		TouchableHighlight
			onPress: @onPress
			activeOpactiy: 0
			style: styles.container
			underlayColor: 'transparent'
		,
			View {style: styles.container},
				Icon
					name: @props.icon
					size: iconsize
					color: Style.colors.light
					style: styles.icon

	onPress: ->
		console.log 'onPress', @props.name, @props.id

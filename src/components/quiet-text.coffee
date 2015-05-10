React = require 'react-native'
Style = require '../style'


Text = React.createFactory React.Text

module.exports = React.createClass

	displayName: 'QuietText'

	render: ->
		styles = React.StyleSheet.create
			text: _.assign {}, @props.style,
				color: Style.colors.quiet
				fontFamily: 'Avenir Next'
		Text {style: styles.text}, @props.children

React = require 'react-native'
Style = require '../style'

StatusBarIOS = React.StatusBarIOS
View = React.createFactory React.View
Text = React.createFactory require './inverted-text'
HeaderIcon = React.createFactory require './HeaderIcon'

module.exports = React.createClass

	displayName: 'HeaderView'

	componentWIllMount: ->
		StatusBarIOS.setStyle StatusBarIOS.Style['lightContent']

	componentDidUpdate: ->
		StatusBarIOS.setStyle StatusBarIOS.Style['lightContent']

	render: ->
		styles = React.StyleSheet.create
			container:
				flex: 1
				alignItems: 'center'
				alignSelf: 'stretch'
				justifyContent: 'space-between'
				flexDirection: 'row'
				height: 64
				paddingTop: 20
				backgroundColor: Style.colors.dark
			title:
				alignSelf: 'center'
			left: width: 44
		View {style: styles.container},
			View {style: styles.left}
				# HeaderIcon icon: 'ion|ios-gear-outline', onPress: @onSettingsPress
			View {style: styles.title},
				Text {style: {fontSize: 16, fontWeight: '600'}}, 'Den Inre Resan'
			View {},
				HeaderIcon icon: 'ion|ios-gear-outline', onPress: @onSettingsPress

	onSettingsPress: ->
		console.log 'settings'

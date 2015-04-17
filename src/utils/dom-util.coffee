Domutil =
	isDescendant: (parent, child) ->
		node = child.parentNode
		while node?
			if node is parent
				return true
			node = node.parentNode
		false

module.exports = Domutil

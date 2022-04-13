extends Node
class_name PoolArray
static func contains(array, value):
	for val in array:
		if value == val:
			return true
	return false

class_name Math
static func approach(val: float, target: float, amount: float) -> float:
	if val == target:
		return target
	elif val > target:
		return clamp(val-amount, target, val)
	else:
		return clamp(val+amount, val, target)
	

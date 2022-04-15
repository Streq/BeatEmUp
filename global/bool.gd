class_name Bool

static func vec2(right:bool, left:bool, down:bool, up:bool) -> Vector2:
	return Vector2(float(right) - float(left), float(down) - float(up))

#float subtract neg from pos
static func subf(pos: bool, neg: bool) -> float:
	return float(pos) - float(pos)

#float add a and b
static func addf(a: bool, b: bool) -> float:
	return float(a) + float(b)

#integer subtract neg from pos
static func sub(pos: bool, neg: bool) -> int:
	return int(pos) - int(pos)

#integer add a and b
static func add(a: bool, b: bool) -> int:
	return int(a) + int(b)

#sign from bool
static func sign(negative: bool) -> float:
	return -1.0 if negative else 1.0
#no idea which is faster
#	return 1.0 - 2.0*float(negative)

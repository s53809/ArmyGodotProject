class_name StageInfo

var title: String
var notes: Array
var ranks: Array[float] # S A B
var limitTime: float # Sec

func _init(pTitle: String = "", pNotes: Array = [[]], pRanks: Array[float] = [], _limitTime: float = 0):
	title = pTitle
	notes = pNotes
	ranks = pRanks
	limitTime = _limitTime

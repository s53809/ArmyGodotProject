class_name StageFileConverter

func ReadStageFile(stageIndex: int):
	var file = FileAccess.open("res://Assets/StageInfo/%d.txt" % stageIndex, FileAccess.READ)
	if !file: push_error("\"res://Assets/StageInfo/%d.txt\" file does not found" % stageIndex)
	
	var stageInfo = StageInfo.new()
	
	var content: String = file.get_as_text()
	var lines: Array = content.split('\n')
	
	stageInfo.title = lines[0]
	var index = 1
	var notes = Array(Array([], TYPE_BOOL, "", null))
	while lines[index] != "END":
		var boolArray = Array([], TYPE_BOOL, "", null)
		for i in range(5):
			if lines[index][i] == '1': boolArray.append(true)
			else: boolArray.append(false)
		notes.append(boolArray)
		index += 1
	
	index += 1
	var splitedRanks: Array[String] = lines[index].split(' ')
	for temp in splitedRanks:
		stageInfo.ranks.append(float(temp))
	
	index += 1	
	stageInfo.limitTime = float(lines[index]);

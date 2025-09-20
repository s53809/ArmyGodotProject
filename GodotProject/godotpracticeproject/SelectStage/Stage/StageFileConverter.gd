class_name StageFileConverter

func ReadStageFile(stageIndex: int) -> StageInfo:
	var file = FileAccess.open("res://Assets/StageInfo/%d.txt" % stageIndex, FileAccess.READ)
	if !file: 
		push_error("\"res://Assets/StageInfo/%d.txt\" file does not found" % stageIndex)
		return null
	
	var stageInfo = StageInfo.new()
	
	var content: String = file.get_as_text()
	var lines: Array = content.split('\n')
	
	stageInfo.title = lines[0]
	var index = 1
	var notes = Array()
	while lines[index] != "END":
		var boolArray = Array()
		for i in range(5):
			if lines[index][i] == '1': 
				boolArray.append(true)
			else: 
				boolArray.append(false)
		notes.append(boolArray)
		index += 1
	
	stageInfo.notes = notes
	
	index += 1
	var splitedRanks: PackedStringArray = lines[index].split(' ')
	for temp in splitedRanks:
		stageInfo.ranks.append(float(temp))
	
	index += 1	
	stageInfo.limitTime = float(lines[index]);
	
	return stageInfo
	
func HowManyStage() -> int:
	var dir = DirAccess.open("res://Assets/StageInfo")
	var fileCount: int = 0
	if dir:
		dir.list_dir_begin()
		var fileName = dir.get_next()
		while fileName != "":
			fileCount += 1
			fileName = dir.get_next()
		
		dir.list_dir_end()
		return fileCount
	else:
		return -1

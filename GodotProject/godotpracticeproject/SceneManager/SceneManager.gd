extends Node2D

@export var StartScene: PackedScene
@export var Scenes: Array[PackedScene]

var curScene: PackedScene: set = SetCurScene
var sceneNode: Node: set = SetSceneNode

func SetCurScene(pScene: PackedScene):
	curScene = pScene
	sceneNode = pScene.instantiate()

func SetSceneNode(pNode: Node):
	if sceneNode != null:
		sceneNode.queue_free()
	
	sceneNode = pNode
	add_child(sceneNode)

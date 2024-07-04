extends CharacterBody2D

var speed: float = 500.0
var direction: Vector2 = Vector2.ZERO


func _ready() -> void:
	position.x = get_viewport_rect().size.x / 2
	position.y = get_viewport_rect().size.y / 2


func _unhandled_key_input(_event: InputEvent) -> void:
	direction = Input.get_vector("ui_left", "ui_right", "ui_up", "ui_down")


func _physics_process(_delta: float) -> void:
	velocity = direction * speed
	move_and_slide()

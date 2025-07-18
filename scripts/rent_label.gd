extends RichTextLabel

var rent
var last_rent
var time_between_rents = 60.0
var time_til_rent

func _ready() -> void:
	rent = 5
	last_rent = Time.get_unix_time_from_system()
		
func _physics_process(delta: float) -> void:
	var time_since_rent = Time.get_unix_time_from_system() - last_rent
	time_til_rent = time_between_rents - time_since_rent
	if time_til_rent <= 0:
		global.cash -= rent
		last_rent = Time.get_unix_time_from_system()
		rent = int(rent * 1.2)
	
func _process(delta: float) -> void:
	set_text("$"+str(rent) + " due in " + str(int(time_til_rent)))

resource "local_file" "profile_input" {
    content  = "${var.profile_input[0]} ${var.profile_input[1]} ${var.profile_input[2]} "
    filename = "${path.module}/data/profile_input.txt"
}

resource "random_string" "user" {
    length = 10
    special = false
    numeric = false
}

resource "random_id" "resource_id" {
  byte_length = 10
}


resource "local_file" "randomuser" {
  content =  "${random_id.resource_id.id} ${var.profile_input[0]} ${var.profile_input[1]} ${var.profile_input[2]} "
  filename = "${path.module}/data/randomuser.txt"

  depends_on = [
    random_id.resource_id
  ]
} 
#petite modif
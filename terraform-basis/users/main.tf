resource "aws_iam_user" "user" {
  for_each = var.users
  name = each.value.username
}

resource "aws_iam_access_key" "user_key" {
  for_each = var.users
  user    = each.value.username
  pgp_key = each.value.pgp_key
}

resource "aws_iam_user_login_profile" "user_login" {
  for_each = var.users
  user    = each.value.username
  pgp_key = each.value.pgp_key
}

resource "aws_iam_policy_attachment" "user_full_access" {
  for_each = var.users

  name       = "${each.value.username}-full-access"
  users      = [aws_iam_user.user[each.key].name]
  policy_arn = "arn:aws:iam::aws:policy/AmazonEC2FullAccess" # Ejemplo de política de acceso total
}


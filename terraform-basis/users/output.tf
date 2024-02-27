output "access_keys" {
  value = { for user, key in aws_iam_access_key.user_key : user => key.id }
}

output "secret_keys" {
  value = { for user, key in aws_iam_access_key.user_key : user => key.encrypted_secret }
}

output "login_profile_encrypted_passwords" {
  value = { for user, profile in aws_iam_user_login_profile.user_login : user => profile.encrypted_password }
}
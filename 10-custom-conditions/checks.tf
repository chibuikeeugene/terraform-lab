check "volume_encryption" {
  assert {
    condition = aws_ebs_volume.data.encrypted
    error_message = "Volume encryption check failed"
  }
}
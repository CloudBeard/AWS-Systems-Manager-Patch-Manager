resource "aws_ssm_association" "windows-server-updates" {
  name             = "AWS-RunPatchBaseline"
  association_name = "Windows-Security-Updates"

  targets {
    key    = "tag:OS"
    values = ["Windows2019"]
  }

  schedule_expression = "cron(0 1 ? * * *)"

  output_location {
    s3_bucket_name = aws_s3_bucket.patch-bucket.id
  }

  parameters = {
    Operation = "Install"
  }

}

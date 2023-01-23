resource "aws_ssm_patch_baseline" "windows-security-updates" {
  name             = "WindowsOSSecurityUpdates"
  description      = "Windows OS Secuirty Updates"
  operating_system = "WINDOWS"

  global_filter {
    key    = "PRODUCT"
    values = ["WindowsServer2019"]
  }

  approval_rule {
    approve_after_days = 7

    patch_filter {
      key    = "CLASSIFICATION"
      values = ["CriticalUpdates", "SecurityUpdates"]
    }

    patch_filter {
      key    = "MSRC_SEVERITY"
      values = ["Critical"]
    }
  }
}

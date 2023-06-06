include "root" {
  path = find_in_parent_folders()
}

include "envcommon" {
  path = "${dirname(find_in_parent_folders())}/_envcommon/app.hcl"
}

inputs = {
  min_val = 10
  max_val = 1000
}
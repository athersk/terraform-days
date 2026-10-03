terraform {
    backend "s3" {
        bucket= "mys3test-state-01"
        key = "terraform-statefile/terraform.tfstate"
        region ="us-west-2"
        use_lockfile=true
    }
}
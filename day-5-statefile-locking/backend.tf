terraform {
    backend "s3" {
        bucket= "mys3test-state-01"
        key = "terraform-statefile/terraform.tfstate"
        region ="us-west-2"
        dynamodb_table = "terraform-statefile-locking"
        #use_lockfile=true
    }
}
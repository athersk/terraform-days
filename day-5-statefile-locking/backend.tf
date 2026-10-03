terraform {
    backend "s3" {
        bucket= "my-s3bucketqwerty-test01"
        key = "terraform-statefile/terraform.tfstate"
        region ="us-west-2"
        use_lockfile=true
    }
}
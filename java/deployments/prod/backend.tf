terraform {
  backend "s3" {
    bucket = "prod-java-coaching-demo-statefile"
    key    = "statefile"
    region = "us-east-1"
    endpoint = ""
  }
}
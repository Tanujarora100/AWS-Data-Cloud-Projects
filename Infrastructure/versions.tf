terraform {
    required_providers {
        aws = {
            source  = "hashicorp/aws"
            version = "~> 5.0"
        }
        time = {
            source  = "hashicorp/time"
            version = "~> 0.7"
        }
        local = {
            source  = "hashicorp/local"
            version = "~> 2.2"
        }
    }

    required_version = ">= 1.3.0"
}
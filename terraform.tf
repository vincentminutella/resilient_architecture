terraform {

    cloud {
        workspaces {
            name = ""
        }
    
        organization = ""
    }

    required_providers {
        aws = {
            source = "hashicorp/aws"
            version = "5.34.0"
        }

        random = {
            source  = "hashicorp/random"
            version = "3.6.0"
        }
    }   
}


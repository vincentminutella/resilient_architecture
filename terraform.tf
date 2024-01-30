terraform {

    cloud {
        workspaces {
            name = "re-app"
            project = "re-app" 
        }
    
        organization = "example-org-66a440"
    }

    required_providers {
        aws = {
            source = "hashicorp/aws"
            version = "~> 5.0"
        }

        random = {
            source  = "hashicorp/random"
            version = "3.6.0"
        }
    }   
}


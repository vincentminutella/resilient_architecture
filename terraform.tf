terraform {

    cloud {
        workspaces {
            name = "fitness-tracker-app"
            project = "fitness-tracker-app" 
        }
    
        organization = "example-org-66a440"
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


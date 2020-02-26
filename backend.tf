terraform {
    backend "remote" {
        organization = "kandamone-team"
        workspaces {
            name = "k8s-first-test"
        }
    }
}

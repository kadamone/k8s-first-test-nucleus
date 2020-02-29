terraform {
    backend "remote" {
        organization = "kadamone-team"

        workspaces {
            name = "k8s-first-test"
        }
    }
}

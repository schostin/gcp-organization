# Schostins GCP organization setup

[![Reviewdog](https://github.com/schostin/gcp-organization/actions/workflows/reviewdog.yml/badge.svg)](https://github.com/schostin/gcp-organization/actions/workflows/reviewdog.yml)

This repository contains the source code to actively manage the google organization of sebastianneb.de.

## Design Overview

### Organization Overview

![Organization Overview](./images/org-overview.png)

The organization consists of 3 main folders and 1 initially project that has to be setup manually.
The seed project contains the initial service account needed to create the folders and projects
and also the needed bucket for the terraform state file.
The 3 main folders hold the following purposes:

- **sandboxes**: The purpose of this folder is tryouts of people using Google Cloud for the first time.
  Subsequent folder can be managed by giving it the name of the team or people who want to tryout things.
  IAM rights for `projectCreator` can then be granted on the folder level to individual members or teams
  so that the the members can tryout everything they want to test.
- **products**: The purpose of this folder is to actually contain products which will be managed via
  infrastructure as code and whill potentially also hold products with production data. The structure
  within this folder for each individual product is outlined below.
- **shared infrastructure**: The purpose of this folder is to contain organization overarching components
  like the DNS managed zone for the organization. Potentially also something like a self-hosted Gitlab
  or shared VPC hosts for interconnects. Everything that needs to be shared across products or sandboxes
  it possible here.

### Product Overview

![Product Overview](./images/product-overview.png)

An individual product consists of 2 folders and 1 project. Every other component the application needs
(like individual folders for the different stages or the needed projects and deployments) should
be placed in the folder `stages`. The folder `overarching-infrastructure` contains created projects
like `DNS zone` which already holds e.g. a managed DNS zone and is linked to the shared DNS zone if needed.
With this setup the product is able to link itself within the organization but be self-contained in what
the product actually needs. Further other overarching infrastructure might be added as well (like a
pre-configured shrared VPC host project or something similar).
The `seed-project` holds everything that the organization creates in order for the product to be able
to create the needed folder structure / projects / service account / etc. within `stages` on their own.
This includes:

- State bucket for the initial terraform pipeline
- Service account that gets permissions:
  - Project Creator / Deleter / Manager within the `stages` folder.
  - Service account creator / deleter within the seed-project to create more needed service accounts.
  - Permissions to access the state bucket for the initial terraform pipeline to create e.g. the different
    stages.
- ...

## Implementation details

I am using terragrunt to further orchestrate the different steps and make use of easier and speakable
environment variables instead of prefixing those with `TF_VAR_`.

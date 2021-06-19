# Infrastructure Structure

Infrastructure components are deployed first. The applications folder has a dependency on this one to ensure that any network things that applications rely on are already deployed.

## git-repos
Generic git repos with, for example, operators that don't have Helm charts.

## helm-repos
Helm chart repositories

## network
Core network infrastructure. Things that need to be deployed to allow other network things to run.

## storage
Storage providers
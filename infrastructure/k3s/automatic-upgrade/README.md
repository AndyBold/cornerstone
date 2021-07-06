# Automatic upgrades

A cluster that upgrades itself? Why not...

Two steps:

1. Run `k3-auto-updates.sh` to install the upgrade controller to the current context.
1. Run `kubectl apply -f ./upgrade-plans.yaml` to apply the upgrade plan. Nothing will happen if the version number in the YAML has not been bumped.
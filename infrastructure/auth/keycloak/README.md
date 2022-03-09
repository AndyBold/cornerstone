# Credentials

Keycloak needs some credentials to access Postgres.

To create these credentials:

```
echo $KEYCLOAK_DB_USER | kubectl create secret generic keycloak-db-creds --dry-run=client --from-file=user=/dev/stdin -o json | kubeseal --controller-name sealed-secrets --controller-namespace sealed-secrets --namespace keycloak >dbcreds.json

cat keycloak-dbpassword | kubectl create secret generic keycloak-db-creds --dry-run=client --from-file=password=/dev/stdin -o json | kubeseal --controller-name sealed-secrets --controller-namespace sealed-secrets --namespace keycloak --merge-into dbcreds.json

kubectl create -f ./dbcreds.json
```
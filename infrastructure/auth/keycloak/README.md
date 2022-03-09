# Credentials

Keycloak needs some credentials to access Postgres.

To create these credentials:

```
echo $KEYCLOAK_DB_USER | kubectl create secret generic keycloak-db-creds --dry-run=client --from-file=user=/dev/stdin -o json | kubeseal --controller-name sealed-secrets --controller-namespace sealed-secrets --namespace keycloak >kc-dbsecret.json

cat keycloak-dbpassword | kubectl create secret generic keycloak-db-creds --dry-run=client --from-file=password=/dev/stdin -o json | kubeseal --controller-name sealed-secrets --controller-namespace sealed-secrets --namespace keycloak --merge-into kc-dbsecret.json

kubectl create -f ./kc-dbsecret.json
```
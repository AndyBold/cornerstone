# Credentials

Keycloak needs some credentials to access Postgres.

To create these credentials:

```
echo $KEYCLOAK_DB_USER | kubectl create secret generic keycloak-db-creds --dry-run=client --from-file=user=/dev/stdin -o json >keycloak-user-secret.json

echo $KEYCLOAK_DB_PASSWORD | kubectl create secret generic keycloak-db-creds --dry-run=client --from-file=password=/dev/stdin -o json >keycloak-password-secret.json

kubeseal --controller-name sealed-secrets --controller-namespace sealed-secrets --namespace keycloak <keycloak-password-secret.json >kc-password-sealed.json

kubeseal --controller-name sealed-secrets --controller-namespace sealed-secrets --namespace keycloak <keycloak-user-secret.json >kc-user-sealed.json
```
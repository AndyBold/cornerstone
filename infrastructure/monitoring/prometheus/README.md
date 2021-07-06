# Prometheus Configuration

## Secrets

### Pushover API Key

I am using Pushover for notifications.

# Secret Creation

If the cluster is redeployed then we need to recreate the Sealed Secret that holds the API key for Pushover as the new cluster deployment will have a new secret key.

To (re)create the `pushover-secret.json` file:

```sh
echo -n <PUSHOVER_API_KEY> | kubectl create secret generic pushover-api-key --dry-run=client --from-file=pushover-api-key=/dev/stdin -o json >apisecret.json

kubeseal --controller-name sealed-secrets --controller-namespace sealed-secrets --namespace monitoring --name pushover-api-key <apisecret.json >pushover-secret.json
```
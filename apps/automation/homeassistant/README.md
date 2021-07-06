# Home Assistant Configuration

## Secrets

### Prometheus API Key

# Secret Creation

If the cluster is redeployed then we need to recreate the Sealed Secret that holds the API key for PDNS as the new cluster deployment will have a new secret key.

To (re)create the apisecret.yaml file:

```sh
echo -n <HASS_API_KEY> | kubectl create secret generic hass-api-key --dry-run=client --from-file=hass-api-key=/dev/stdin -o json >apisecret.json

kubeseal --controller-name sealed-secrets --controller-namespace sealed-secrets --namespace homeassistant --name hass-api-key <apisecret.json >hass-secret.json
```
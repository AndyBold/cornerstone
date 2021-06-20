# Secret Creation

If the cluster is redeployed then we need to recreate the Sealed Secret that holds the API key for PDNS as the new cluster deployment will have a new secret key.

To (re)create the apisecret.yaml file:

```sh
echo -n <PDNS_API_KEY> | kubectl create secret generic pdns_api_key --dry-run=client --from-file=foo=/dev/stdin -o json >apisecret.json

kubeseal --controller-name sealed-secrets --controller-namespace sealed-secrets --namespace kube-system --name external-dns <apisecret.json >mysealedsecret.json
```
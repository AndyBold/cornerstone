# Secrets

Sealed Secrets will need to be recreated if the cluster is redeployed.

Update `rawcreds-console.yaml` and `rawcreds-root.yaml` using the values stored in 1Password encoded into Base64.

Then:

```sh
kubeseal --controller-name sealed-secrets --controller-namespace sealed-secrets --namespace minio --format yaml <rawcreds-root.yaml >secrets-minio-root.yaml
kubeseal --controller-name sealed-secrets --controller-namespace sealed-secrets --namespace minio --format yaml <rawcreds-console.yaml >secrets-console.yaml
```
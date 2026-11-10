# NetBird decodes both encryption keys with Go's base64.StdEncoding and rejects
# anything that is not exactly 32 bytes, while derive_entropy returns hex. Hash
# the per-install derived value back to 32 raw bytes and base64-encode it.
_ert11er_netbird_b64_key() {
  derive_entropy "app-${EXPORTS_APP_ID}-$1" | openssl dgst -sha256 -binary | openssl base64 -A
}

export NETBIRD_STORE_ENCRYPTION_KEY="$(_ert11er_netbird_b64_key store-encryption-key)"
export NETBIRD_SESSION_COOKIE_KEY="$(_ert11er_netbird_b64_key session-cookie-encryption-key)"
export NETBIRD_RELAY_AUTH_SECRET="$(derive_entropy "app-${EXPORTS_APP_ID}-relay-auth-secret")"

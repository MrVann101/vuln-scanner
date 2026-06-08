# Manual Vulnerability Checklist (OWASP Top 10 + Extras)

## A01 — Broken Access Control
- [ ] Are authorization checks missing on sensitive endpoints?
- [ ] Can users access other users' data by changing IDs (IDOR)?
- [ ] Are admin routes protected by role checks?
- [ ] Is directory listing enabled on the server?
- [ ] Are JWT tokens validated properly (algorithm, signature, expiry)?
- [ ] Are CORS headers too permissive (`Access-Control-Allow-Origin: *`)?

## A02 — Cryptographic Failures
- [ ] Are passwords stored in plaintext or with weak hashing (MD5, SHA1)?
- [ ] Is sensitive data (PII, tokens, keys) logged or stored unencrypted?
- [ ] Are secrets/API keys hardcoded in source code?
- [ ] Is HTTP used instead of HTTPS for sensitive operations?
- [ ] Are random values generated with non-cryptographic RNG?

## A03 — Injection
- [ ] SQL: Are raw queries built with string concatenation?
- [ ] Command injection: Is `os.system()`, `subprocess`, `shell=True` used with user input?
- [ ] Template injection: Are templates rendered with raw user strings?
- [ ] NoSQL injection: Are MongoDB/Redis queries built from user input unsafely?

## A04 — Insecure Design
- [ ] Is there rate limiting on login, registration, or sensitive APIs?
- [ ] Is there no account lockout after repeated failed logins?
- [ ] Are sensitive operations protected by re-authentication?

## A05 — Security Misconfiguration
- [ ] Are debug modes or verbose error messages enabled in production?
- [ ] Are default credentials unchanged?
- [ ] Are security headers missing? (CSP, X-Frame-Options, HSTS)
- [ ] Are stack traces leaked in error responses?

## A06 — Vulnerable and Outdated Components
- [ ] Are dependencies checked against known CVE databases?
- [ ] Are there packages with no updates in 2+ years?
- [ ] Is the language runtime / framework version outdated?

## A07 — Identification and Authentication Failures
- [ ] Are session tokens long, random, and rotated after login?
- [ ] Are sessions invalidated on logout?
- [ ] Are password reset tokens time-limited and single-use?

## A08 — Software and Data Integrity Failures
- [ ] Is user-supplied data deserialized without validation (pickle, yaml.load)?
- [ ] Are third-party scripts loaded without Subresource Integrity (SRI) hashes?

## A09 — Security Logging and Monitoring Failures
- [ ] Are authentication events logged?
- [ ] Are sensitive values excluded from logs?

## A10 — Server-Side Request Forgery (SSRF)
- [ ] Does the app fetch external URLs based on user input?
- [ ] Are internal network addresses blocked in URL inputs?

---

## Extra Checks

### XSS
- [ ] Is user input rendered in HTML without escaping?
- [ ] Are `innerHTML` or `dangerouslySetInnerHTML` used with user data?

### CSRF
- [ ] Are state-changing endpoints protected with CSRF tokens?
- [ ] Are SameSite cookie attributes set?

### File Upload
- [ ] Are uploaded file types validated (extension + MIME type)?
- [ ] Are uploaded files stored outside the web root?

### Open Redirect
- [ ] Are redirect URLs validated against an allowlist?
- [ ] Can `?next=`, `?redirect=`, `?url=` point to external sites?

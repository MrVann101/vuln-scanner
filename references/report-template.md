# Security Vulnerability Report

**Target:** `<project name / file>`
**Scan Date:** `<YYYY-MM-DD>`
**Overall Risk Level:** 🔴 CRITICAL / 🟠 HIGH / 🟡 MEDIUM / 🟢 LOW

---

## Executive Summary
> 3–5 sentences: what was scanned, most serious findings, immediate priority actions.

---

## Scope

| Item | Detail |
|---|---|
| Files Scanned | `x files, y lines of code` |
| Languages | Python, JavaScript, etc. |
| Frameworks | Django, React, etc. |
| Tools Used | bandit, npm audit, semgrep, manual review |

---

## Risk Summary

| Severity | Count |
|---|---|
| 🔴 Critical | 0 |
| 🟠 High | 0 |
| 🟡 Medium | 0 |
| 🔵 Low | 0 |
| ℹ️ Info | 0 |

---

## Findings

### [VULN-001] Vulnerability Title

| Field | Detail |
|---|---|
| **Severity** | 🔴 CRITICAL |
| **Category** | OWASP A03 – Injection |
| **CWE** | CWE-89 |
| **Location** | `app/views.py`, line 47 |

**Description:** Explain what the vulnerability is and its impact.

**Vulnerable Code:**
```python
query = f"SELECT * FROM users WHERE id = {user_id}"
db.execute(query)
```

**Fix:**
```python
query = "SELECT * FROM users WHERE id = ?"
db.execute(query, (user_id,))
```

**References:**
- CWE-89: SQL Injection
- OWASP SQL Injection Prevention

---

## Dependency Vulnerabilities

| Package | Installed | Fixed | CVE | Severity |
|---|---|---|---|---|
| `example-pkg` | `1.2.3` | `1.2.5` | CVE-2024-XXXX | HIGH |

---

## Prioritized Remediation Roadmap

### Immediate (24–48 hours)
1. Fix critical and high severity findings

### Short-term (1–2 weeks)
2. Patch vulnerable dependencies
3. Add missing security headers

### Long-term
4. Integrate scanners into CI/CD pipeline
5. Schedule quarterly security reviews

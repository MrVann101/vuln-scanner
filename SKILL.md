---
name: vuln-scanner
description: >
  Scan web apps and codebases for security vulnerabilities and produce a detailed report with remediation steps.
  Use this skill whenever the user wants to: audit code for security issues, find vulnerabilities in a web app,
  check for OWASP Top 10 issues, review dependencies for CVEs, scan uploaded source files or a directory for
  security flaws, or asks anything like "check my code for vulnerabilities", "is my app secure?", "security audit",
  "find security bugs", "check for CVEs", "scan my project", or "vulnerability report". Trigger even if the user
  just pastes code and asks if it's safe. Always produce a detailed report with severity ratings and fixes.
---

# Vulnerability Scanner Skill

Scans web app codebases for security vulnerabilities and produces a **detailed report with severity ratings and fix guidance**.

---

## Workflow

### Step 1 — Identify Input
Determine what's being scanned:
- **Pasted code** → analyze inline
- **Uploaded file(s)** → read from `/mnt/user-data/uploads/`
- **Directory** → walk with `find` in bash
- **URL** → fetch and analyze (HTML/JS only; no active exploitation)

If input is ambiguous, ask the user to clarify or paste/upload their code.

### Step 2 — Detect Language & Stack
Identify the language(s), frameworks, and package managers present:
- Languages: Python, JavaScript/TypeScript, PHP, Java, Go, Ruby, etc.
- Frameworks: Django, Flask, Express, Laravel, Spring, Rails, etc.
- Package files: `package.json`, `requirements.txt`, `Gemfile`, `pom.xml`, `composer.json`, etc.

### Step 3 — Run Automated Tools (if available)
Use bash to run appropriate tools. Install only what's needed.

| Stack | Tool | Install |
|---|---|---|
| Python | `bandit` | `pip install bandit --break-system-packages` |
| JS/TS/Node | `npm audit` | (built-in, run in project dir) |
| JS/TS (static) | `semgrep` | `pip install semgrep --break-system-packages` |
| Dependencies (any) | `pip-audit` | `pip install pip-audit --break-system-packages` |
| General patterns | `semgrep` with `p/owasp-top-ten` | `pip install semgrep --break-system-packages` |

**Example — Python:**
```bash
pip install bandit --break-system-packages -q
bandit -r /path/to/code -f json 2>/dev/null
```

**Example — Node.js:**
```bash
cd /path/to/project && npm audit --json 2>/dev/null
```

**Example — Semgrep:**
```bash
pip install semgrep --break-system-packages -q
semgrep --config=p/owasp-top-ten /path/to/code --json 2>/dev/null
```

### Step 4 — Manual Analysis
Always perform manual review regardless of tool output. Check every item in `references/vuln-checklist.md`.

### Step 5 — Dependency CVE Check
If a package file is present, parse it, flag packages with known CVEs, and recommend upgrade paths.

### Step 6 — Generate Report
Use the template in `references/report-template.md` to produce the final report.

---

## Report Format

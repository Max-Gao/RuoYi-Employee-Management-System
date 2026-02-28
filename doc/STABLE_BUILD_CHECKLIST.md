# Stable Build Checklist (Windows / PowerShell)

## 1) Fixed toolchain versions

- JDK: `21` (recommended `21.0.10+`)
- Maven: `3.6.3` to `3.9.x`
- Node.js: `24.13.0`
- npm: `11.6.2`

## 2) One-time setup

1. Ensure `JAVA_HOME` points to JDK 21.
2. Ensure `mvn -v` reports Java 21.
3. Switch Node to 24.13.0 (for example with `nvm use 24.13.0`).
4. Use `npm.cmd` in PowerShell if `npm` script policy is blocked.
5. Keep frontend lockfile and `html-webpack-plugin` aligned with webpack4 (project already pinned to `4.5.2`).

## 3) Pre-build checks

Run:

```powershell
.\bin\check-env.ps1
```

If any check fails, fix versions first.

## 4) Stable build command

Run:

```powershell
.\bin\build-stable.ps1
```

This script runs:

1. Environment strict check (`check-env.ps1 -Strict`)
2. Backend build (`mvn -DskipTests clean package`)
3. Frontend dependency install (`npm.cmd install --legacy-peer-deps --no-audit --fund=false`)
4. Frontend production build (`npm.cmd run build:prod`)

## 5) Notes

- `pom.xml` now enforces JDK 21 during Maven build to fail fast on wrong Java.
- Maven mirror URLs are set to `https` to reduce intermittent network failures.
- `ruoyi-ui/.npmrc` enables `engine-strict=true` and `package.json` pins Node/npm range.
- Frontend install uses `--legacy-peer-deps` to avoid historical Vue CLI 4 peer dependency breaks.

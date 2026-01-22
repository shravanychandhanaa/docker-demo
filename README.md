# Docker Basics Demo

This repo contains a tiny Node app and a GitHub Actions workflow that builds a Docker image, pushes it to Docker Hub, and runs the container on the GitHub Actions runner for a quick verification.

Files:
- `app.js` — simple Node HTTP server
- `package.json` — minimal package manifest
- `Dockerfile` — (add or keep your existing `Dockerfile` in the repo root)
- `.github/workflows/docker-ci.yml` — CI workflow

Required GitHub secrets (add these in your repo Settings → Secrets):
- `DOCKERHUB_USERNAME` — your Docker Hub username
- `DOCKERHUB_TOKEN` — a Docker Hub access token or password

How it works:
1. Push to `main` (or `master`) to trigger the workflow.
2. Workflow logs into Docker Hub using the secrets, builds the image, tags it with the commit SHA, and pushes it.
3. The workflow then runs the pushed image on the runner and curls the app to verify it's responding.

Test locally (optional):
```powershell
docker build -t docker-basics-demo:local .
docker run --rm -p 3000:3000 docker-basics-demo:local
curl http://localhost:3000
```

Notes:
- I cannot push to your Docker Hub for you. After you add the secrets, pushing to the repo will run the workflow and push the image.
- The workflow exposes the app on port `8080` on the runner for verification (mapped from container port `3000`).

# Vercel Deployment Guide for Flutter Portfolio

## Files Created for Vercel Deployment:

1. **vercel.json** - Configuration file for Vercel
2. **package.json** - Build scripts and project metadata
3. **.vercelignore** - Files to exclude from deployment

## Deployment Steps:

### Option 1: Deploy via Vercel CLI

```bash
# Install Vercel CLI globally
npm install -g vercel

# Login to Vercel
vercel login

# Deploy from your project directory
vercel --prod
```

### Option 2: Deploy via Vercel Dashboard

1. Go to [vercel.com](https://vercel.com)
2. Click "New Project"
3. Import your GitHub repository
4. Vercel will automatically detect the configuration files
5. Click "Deploy"

## Important Notes:

- The `vercel.json` file tells Vercel to serve files from `build/web/`
- The build process runs `flutter build web --release`
- All necessary Flutter web files are included in the build
- The app will be available at your Vercel domain

## Troubleshooting:

If deployment fails:

1. Make sure `build/web/` directory exists
2. Run `flutter build web --release` locally first
3. Check that all files in `build/web/` are committed to Git
4. Verify `vercel.json` configuration is correct

## Build Command:

```bash
flutter build web --release
```

This creates optimized production files in `build/web/` directory.

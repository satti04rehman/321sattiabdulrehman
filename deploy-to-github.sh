#!/bin/bash

# Build the project
echo "Building the project..."
npm run build

# Create a temporary directory for deployment
mkdir -p gh-pages-deploy

# Copy the built files to the deployment directory
cp -r dist/* gh-pages-deploy/

# Create a simple README for GitHub Pages
echo "# Abdul Rehman's Portfolio

This is my personal portfolio website showcasing my projects and skills.

Visit the live site: https://satti04rehman.github.io/portfolio
" > gh-pages-deploy/README.md

# Initialize Git in the deployment directory
cd gh-pages-deploy
git init
git add .
git commit -m "Deploy to GitHub Pages"

# Add the GitHub repository as the remote
echo "Please enter your GitHub username (e.g., satti04rehman):"
read username
echo "Please enter your repository name (e.g., portfolio):"
read reponame

# Configure Git with your GitHub information
git config --global user.email "satti04rehman@gmail.com"
git config --global user.name "$username"

# Add and push to GitHub Pages branch
git remote add origin https://github.com/$username/$reponame.git
git branch -M gh-pages
git push -f origin gh-pages

cd ..
echo "Deployment complete! Your portfolio should be available at: https://$username.github.io/$reponame"
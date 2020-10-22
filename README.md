# floatpoint-blog

## Setup
1. [Install Hugo](https://gohugo.io/getting-started/installing/), the static site generator.

2. Install NodeJS and npm. Using [`nvm`](https://github.com/nvm-sh/nvm) is recommended.

3. Clone this repo.
```
git clone https://github.com/floatpoint-root/floatpoint-root.github.io.git floatpoint-blog
cd floatpoint-blog
```

4. Install the necessary NodeJS dependencies. These are used for compiling CSS and Javascript.
```
npm install -g postcss-cli
npm install -g autoprefixer

cd themes/blogboi
npm install
cd ../..
```

## Development
In development, any Hugo content with `draft: true` or a `publishDate` in the future will be built and served.

To run a local development server for the Hugo site, you can run the convenience bash script:
```
./serve-dev.sh
```
A local HTTP server will serve the Hugo site on `http://localhost:1313`.

The server will watch your filesystem, and any changes will trigger an automatic rebuild the Hugo site.

## Deployment to GitHub Pages

This repository is configured to deploy from the `gh-pages` branch.
To update the `gh-pages` branch with a new build, you can run the convenience bash script:
```
./commit-gh-pages.sh
```

If the build looks good, then push to `origin` `gh-pages`.
```
git push origin gh-pages
```

### Notes

By default, the generated `public/` directory is omitted from Git.

The `gh-pages` branch utilizes the "worktree" feature;
essentially, the worktree allows you to have multiple branches of the same local repository to be checked out in different directories.

Notice that when you `cd` in and out of the `public/` directory, your git branch automatically changes.
This is the worktree feature in action.

## Configuring DNS

1. Create a CNAME record that points `www.example.com -> username.github.io`.

2. Create four A records that point:
```
example.com -> 185.199.108.153
example.com -> 185.199.109.153
example.com -> 185.199.110.153
example.com -> 185.199.111.153
```

## Setting up Gitub Pages Deployment
Let `public/` be the target directory for your site builds.

1. Add the directory `public/` to your `.gitignore` file, so that it does not get tracked on your `master` branch.
```
echo "public/" >> .gitignore
```

2. Initialize your `gh-pages` branch as an [orphan branch](https://git-scm.com/docs/git-checkout/#Documentation/git-checkout.txt---orphanltnewbranchgt) i.e. has no parents. Therefore, the first commit on `gh-pages` will have no parents and will be the root of a new git history. This isolates `gh-pages` from the branches and commits in `master`.
```
git checkout --orphan gh-pages
git reset --hard
git commit --allow-empty -m "Initializes the gh-pages branch."
git push origin gh-pages
git checkout master
```

3. Add a "worktree" for the `gh-pages` branch in the `public/` directory.
```
rm -rf public
git worktree add -B gh-pages public origin/gh-pages
```

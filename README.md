# floatpoint blog

# Setup
1. [Install Hugo](https://gohugo.io/getting-started/installing/), the static site generator.

1. Clone this repo.
```
git clone https://github.com/floatpoint-root/floatpoint-root.github.io.git floatpoint-blog
cd floatpoint-blog
```

# Deployment to GitHub Pages

This repository is configured to deploy from the `gh-pages` branch.

To update the `gh-pages` branch with a new build, simply run the convenience bash script:
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

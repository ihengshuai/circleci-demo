set -e

pwd

echo $pwd

remote=$(git config remote.origin.url)

echo $remote

mkdir gh-pages-branch
cd gh-pages-branch
git init
git remote add --fetch origin "$remote"
git checkout -b gh-pages
# copy over or recompile the new site
cp -a "../dist/." 
git add . -A
git commit -m 'update page'
git push -f origin -q gh-pages
cd ..
rm -rf gh-pages-branch
echo deploy successfully
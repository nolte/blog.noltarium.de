#!/bin/bash
#
# Create a new Brach for the Heroku App, base on php
#
mkdir -p $HEROKU_TMP
# copy generated files to tmp folder
cp -r $TRAVIS_BUILD_DIR/jekyll_content/_site/* $HEROKU_TMP

ls -all $HEROKU_TMP

# create the tmpbrach
git branch $GENERATED_FILE_BRANCH_NAME
git checkout $GENERATED_FILE_BRANCH_NAME

ls -all $TRAVIS_BUILD_DIR

# remove all existing files
rm -r $TRAVIS_BUILD_DIR/*
## remove invisible files

ls -all $TRAVIS_BUILD_DIR

rm -r $TRAVIS_BUILD_DIR\/.travis.yml
ls -all $TRAVIS_BUILD_DIR

echo "copy"
# copy back the generated files
cp -r $HEROKU_TMP\/* $TRAVIS_BUILD_DIR
echo "copy"
ls -all $TRAVIS_BUILD_DIR

# add all generated files to the branch
git add --all
git commit -am $GENERATED_FILE_BRANCH_COMMIT_MSG

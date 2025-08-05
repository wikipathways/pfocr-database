# pfocr-database
Jekyll Site and database for the Pathway Figure OCR project

Visit site at: https://pfocr.wikipathways.org/

## Content
Pathway figure content can be added as .md files to the [\_figures](https://github.com/wikipathways/pfocr-database/tree/main/_figures) directory. The top portion of the .md file is the Jekyll Front Matter, which defines metadata used to generate the site, organize content and generate search metadata optimized for search engines.

## Updates
The site is too big to be build by GH Pages, so it is built locally and `_site` is pushed to the gh-pages branch. The `_site` dir is otherwise ignored by the main branch.

## Development
In order to rebuild the site locally you'll need to:
1. clone the repo
2. install Ruby, Jekyll and Bundler ([guide](https://jekyllrb.com/docs/installation/))
  * Try to match [these versions](https://pages.github.com/versions/) where possible in order to get the same behavior locally as via GitHub. Pay attention to Jekyll and Ruby versions in particular.
  * E.g., MacOS: `brew install ruby@3.1` and `echo 'export PATH="/opt/homebrew/opt/ruby@3.1/bin:$PATH"' >> ~/.zshrc` then `source ~/.zshrc` and `sudo gem install jekyll -v 3.10.0`
3. run `bundle install`
4. run `bundle exec jekyll serve`  <-- run this each time you want to restart the local server
5. goto http://127.0.0.1:4000
6. run `bundle exec jekyll build` <-- run this to generate _site files without localhost URLs
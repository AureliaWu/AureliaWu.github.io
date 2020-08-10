cd /Users/aureliawu/personalFiles/privateProjects/blog
hexo clean
git add .
git commit -am "update blog"
git push origin master:source
hexo g && hexo d

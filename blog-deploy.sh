cd /Users/aureliawu/personalFiles/privateProjects/blog/
hexo clean
git add .
git commit -am "some changes"
git push origin develop:source
hexo g && hexo d

cd D:/personalFiles/blog
hexo clean
git add .
git commit -am "update blog"
git push origin master:source
hexo g && gulp && hexo d
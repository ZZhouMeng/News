# News
Internet开发期末大作业——新闻系统
数据库用的是SQL Server

1、新闻系统登录界面
新闻登录可以选择是管理员还是普通用户登录，Login.jsp页面填写表单，数据传递到CheckLogin.jsp页面，CheckLogin.jsp页面根据表单中的用户名查询数据库，判断用户数据是否填写正确，判定用户能否登陆成功，未登陆成功则跳转回登录界面重新填写登录信息。
![Image text](https://raw.githubusercontent.com/ZZhouMeng/News/master/%E7%95%8C%E9%9D%A2%E8%AE%BE%E8%AE%A1%E5%9B%BE%E7%89%87/%E6%96%B0%E9%97%BB%E7%B3%BB%E7%BB%9F%E7%99%BB%E5%BD%95%E7%95%8C%E9%9D%A2.png)

2、新闻系统注册界面
注册界面，用户通过点击“注册”链接进入注册界面。注册用户时，用户需要填写昵称、姓名、密码并且确认密码，这些内容都是必填项目默认注册为普通用户。
![Image text](https://raw.githubusercontent.com/ZZhouMeng/News/master/%E7%95%8C%E9%9D%A2%E8%AE%BE%E8%AE%A1%E5%9B%BE%E7%89%87/%E6%96%B0%E9%97%BB%E7%B3%BB%E7%BB%9F%E6%B3%A8%E5%86%8C%E7%95%8C%E9%9D%A2.png)

3、新闻系统首页展示所有新闻
图中的新闻列表界面是以游客的形式登录的。在新闻列表页面中，每一条新闻都是由标题、作者、发布时间、新闻简介、阅读全文等组成。如果该用户是该条新闻的发布者，则左下角还将展示删改链接。
新闻页面的上部是版块分类功能模块，有可以显示“首页”、“财经”、“国际”、“教育”、“社会”、“文化”、“发布新闻”这六部分内容。页面的下方是分页功能模块，通过点击下一页，会显示其它的五条新闻，点击上一页会返回之前显示的五条新闻。如果处于首页是没有上一页的超链接显示，如果处于末尾，是没有下一页的超链接显示的。.
新闻页面的右部是个人信息板块，显示用户的昵称和用户类型，还有退出登录的链接。
![Image text](https://raw.githubusercontent.com/ZZhouMeng/News/master/%E7%95%8C%E9%9D%A2%E8%AE%BE%E8%AE%A1%E5%9B%BE%E7%89%87/%E9%A6%96%E9%A1%B5%E5%B1%95%E7%A4%BA%E6%89%80%E6%9C%89%E6%96%B0%E9%97%BB%E9%A1%B5%E9%9D%A2.png)

4、发布新闻页面
在添加新闻页面，用户可以选择新闻的类别，填写新闻的标题。在添加新闻内容的功能上使用了富文本编辑器，这样用户可以更好地把新闻的内容编写的有更多的形式。可以添加视频、设置字体的大小、样式，还可以添加图片的链接，让内容显示的更加地丰富。
![Image text](https://raw.githubusercontent.com/ZZhouMeng/News/master/%E7%95%8C%E9%9D%A2%E8%AE%BE%E8%AE%A1%E5%9B%BE%E7%89%87/%E5%8F%91%E5%B8%83%E6%96%B0%E9%97%BB%E9%A1%B5%E9%9D%A2.png)

5、按分类浏览新闻页面
用户在上方点击新闻分类，则可以浏览该分类下的所有新闻，其他操作与新闻首页一样。
![Image text](https://raw.githubusercontent.com/ZZhouMeng/News/master/%E7%95%8C%E9%9D%A2%E8%AE%BE%E8%AE%A1%E5%9B%BE%E7%89%87/%E6%8C%89%E5%88%86%E7%B1%BB%E6%B5%8F%E8%A7%88%E6%96%B0%E9%97%BB%E9%A1%B5%E9%9D%A2.png) 

6、按作者浏览新闻
用户点击每条新闻下方的作者按钮，则可查看该作者的所有新闻，其他操作与首页相同。
![Image text](https://raw.githubusercontent.com/ZZhouMeng/News/master/%E7%95%8C%E9%9D%A2%E8%AE%BE%E8%AE%A1%E5%9B%BE%E7%89%87/%E6%8C%89%E4%BD%9C%E8%80%85%E6%B5%8F%E8%A7%88%E6%96%B0%E9%97%BB.png.png)

7、修改新闻页面
点击“修改”链接后会跳转到修改新闻内容界面，页面上会在相应的位置显示之前发布的新闻内容，用户只需要在这个基础上进行修改就行了。然后点击“发布”，会重新跳转到新闻后台管理界面，并会看到自己修改的新闻的发布时间已经变成最新的了。
![Image text](https://raw.githubusercontent.com/ZZhouMeng/News/master/%E7%95%8C%E9%9D%A2%E8%AE%BE%E8%AE%A1%E5%9B%BE%E7%89%87/%E4%BF%AE%E6%94%B9%E6%96%B0%E9%97%BB%E9%A1%B5%E9%9D%A2.png) 

8、阅读新闻全文
点击相应的标题，可以在新的页面中显示详细的内容。
![Image text](https://raw.githubusercontent.com/ZZhouMeng/News/master/%E7%95%8C%E9%9D%A2%E8%AE%BE%E8%AE%A1%E5%9B%BE%E7%89%87/%E9%98%85%E8%AF%BB%E5%85%A8%E6%96%87%E9%A1%B5%E9%9D%A2.png) 

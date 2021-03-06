﻿<%@ Control Language="C#" AutoEventWireup="true" EnableViewState="false" Inherits="BlogEngine.Core.Web.Controls.PostViewBase" %>
<%@ Import Namespace="BlogEngine.Core" %>

<%

    var singlePost = Location == ServingLocation.SinglePost;

    var postClass = "";

    var postAdminLinks = "";
    if (AdminLinks.Length > 0)
    {
        postAdminLinks = "<div class=\"post-adminlinks\">" + AdminLinks + "</div>";
    }
    var postUrl = Post.RelativeOrAbsoluteLink;
    var postTitle = Server.HtmlEncode(Post.Title);
    var postDate = Post.DateCreated.ToString("MMM dd, yyyy");
    var authorUrl = Utils.AbsoluteWebRoot + "author/" + Utils.RemoveIllegalCharacters(Post.Author + BlogConfig.FileExtension);
    var authorName = Post.AuthorProfile != null ? Utils.RemoveIllegalCharacters(Post.AuthorProfile.DisplayName) : Utils.RemoveIllegalCharacters(Post.Author);

    var postCategory = CategoryLinks(", ");
    var postTags = "<div class=\"post-tags\">" + TagLinks(", ") + "</div>";

    var postFirstImage = Post.FirstImgSrc;
    var postImageLink = "<a class=\"post-cover\" href=\"" + postUrl + "\"><img src=\"" + Post.FirstImgSrc + "\" alt=\"" + postTitle + "\"></a>";

    if (postFirstImage.Length < 1)
    {
        postClass += " no-thumbnail";
    }
    var blogLogo = "[CUSTOMFIELD|THEME|Standard|Publisher Logo|http://exampleblog.com/logo.png/]";

    var postImagePosition = "[CUSTOMFIELD|THEME|Standard|Post Thumbnail position|top/]";

    bool isPrivatePosts = false;

    if (postCategory.Contains("MY"))
    {
        isPrivatePosts = true;
    }
%>
<div id="fb-root"></div>
<script async defer crossorigin="anonymous" src="https://connect.facebook.net/vi_VN/sdk.js#xfbml=1&version=v3.3&appId=865343476902215"></script>
<!-- Modal -->
<div class="modal fade" id="myModal" role="dialog">
    <div class="modal-dialog">

        <!-- Modal content-->
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal">&times;</button>
                <h4 class="modal-title">Warning!</h4>
            </div>
            <div class="modal-body">
                <p>This content is only shown for my close friends, please come back to read another blog posts if you were not.</p>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn" onclick="goto:" id="btn">OK</button>
            </div>
        </div>

    </div>
</div>

<% if (!singlePost)
    { %>
<div class="blog-posts">
    <div class="single-post" id="post<%=Index %>">
        <div class="image-wrapper">
            <% if (postFirstImage.Length > 1)
                { %>
            <%=postImageLink %>
            <%} %>
        </div>

        <div class="icons">
            <div class="left-area">
                <a class="btn caegory-btn" href="<%=authorUrl %>"><b><%=authorName %></b> </a>
            </div>
            <ul class="right-area social-icons">
                <li><a href="#"><i class="ion-android-share-alt"></i>Share</a></li>
                <li><a href="#"><i class="ion-android-favorite-outline"></i>-</a></li>
                <li><a href="#"><i class="ion-android-textsms"></i>-</a></li>
            </ul>
        </div>
        <p class="date"><em><%=postDate %></em></p>
        <h3 class="title"><a href="<%=postUrl %>"><b class="light-color"><%=postTitle %></b></a></h3>
        <p><%=Post.Description %>...</p>
        <a class="btn read-more-btn" href="<%=postUrl %>"><b>READ MORE</b></a>
    </div>
</div>

<%} %>

<% else
    {%>

<link href="<%=(Utils.ApplicationRelativeWebRoot + "Custom/Themes/" + BlogSettings.Instance.Theme + "/02-Single-post/css/styles.css")%>" rel="stylesheet">
<link href="<%=(Utils.ApplicationRelativeWebRoot + "Custom/Themes/" + BlogSettings.Instance.Theme + "/02-Single-post/css/responsive.css")%>" rel="stylesheet">

<div class="col-lg-12 col-md-12">
    <div class="blog-posts">
        <div class="single-post" id="post-<%=Index %>">
            <div class="icons">
                <div class="left-area">

                    <% if (postCategory.Length > 0)
                        {%> 	<a class="btn caegory-btn" href="#"><b><%=authorName %></b></a>
                    <% } %>
                </div>
                <ul class="right-area social-icons">
                    <li><a href="#"><i class="ion-android-share-alt"></i>Share</a></li>
                    <li><a href="#"><i class="ion-android-favorite-outline"></i>-</a></li>
                    <li><a href="#"><i class="ion-android-textsms"></i>-</a></li>
                </ul>
                <p class="date"><em><%=postDate %></em></p>
            </div>

            <h3 class="title"><a href="#"><b class="light-color"><%=postTitle %></b></a></h3>

            <asp:PlaceHolder ID="BodyContent" runat="server" />
        </div>
    </div>

<%--    <footer class="post-footer">
        <%=postTags %>
        <%=postAdminLinks %>
    </footer>--%>

    <script type="application/ld+json">
    {
      "@context": "http://schema.org",
      "@type": "NewsArticle",
      "mainEntityOfPage": {
        "@type": "WebPage",
        "@id": "<%=Post.AbsoluteLink %>"
      },
      "headline": "<%=postTitle %>",
      <% if (postFirstImage.Length > 1)
        {%>"image": "<%=Utils.AbsoluteWebRoot + postFirstImage.TrimStart(' ', '/') %>",<%} %>
      "datePublished": "<%=Post.DateCreated.ToString("yyyy-MM-dd") %>",
      "dateModified": "<%=Post.DateModified.ToString("yyyy-MM-dd") %>",
      "author": {
        "@type": "Person",
        "name": "<%=authorName%>"
      },
       "publisher": {
        "@type": "Organization",
        "name": "<%=BlogSettings.Instance.Name %>",
        "logo": {
          "@type": "ImageObject",
          "url": "<%= blogLogo %>"
        }
      },
      "description": "<%=Utils.RemoveHtmlWhitespace(Post.Description)%>"
    }
    </script>
    <!-- blog-posts -->
</div>
<!-- col-lg-4 -->
<%} %>

<%if (isPrivatePosts && !singlePost)
    {%>
<script>        $("#myModal").modal();</script>
<%} %>

 

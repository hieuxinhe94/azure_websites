<%@ Control Language="C#" AutoEventWireup="true" EnableViewState="false" Inherits="BlogEngine.Core.Web.Controls.PostViewBase" %>
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


%>

<div class="blog-posts">

    <% if (!singlePost) { %>
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
                <li><a href="#"><i class="ion-android-share-alt"></i>Shareee</a></li>
                <li><a href="#"><i class="ion-android-favorite-outline"></i>03</a></li>
                <li><a href="#"><i class="ion-android-textsms"></i>06</a></li>
            </ul>
        </div>
        <p class="date"><em><%=postDate %></em></p>
        <h3 class="title"><a href="<%=postUrl %>"><b class="light-color"><%=postTitle %></b></a></h3>
        <p><%=Post.Description %>...</p>
        <a class="btn read-more-btn" href="<%=postUrl %>"><b>READ MORE</b></a>
    </div>

    <%} %>

    <% else {%>
    <div class="single-post col-md-9" id="post<%=Index %>">
        <div class="icons">
            <div class="left-area">

                <% if (postCategory.Length > 0)
                    {%> 	<a class="btn caegory-btn" href="#"><b><%=postCategory %></b></a>
                <% } %>
            </div>
            <ul class="right-area social-icons">
                <li><a href="#"><i class="ion-android-share-alt"></i>Share</a></li>
                <li><a href="#"><i class="ion-android-favorite-outline"></i>03</a></li>
                <li><a href="#"><i class="ion-android-textsms"></i>06</a></li>
            </ul>
        </div>
        <p class="date"><em><%=postDate %></em></p>
        <h3 class="title"><a href="#"><b class="light-color"><%=postTitle %></b></a></h3>

        <asp:PlaceHolder ID="BodyContent" runat="server" />

    </div>
    <!-- blog-posts -->
    </div><!-- single-post -->
    <footer class="post-footer">
        <%=postTags %>
        <%=postAdminLinks %>
    </footer>

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

    <%} %>
</div>

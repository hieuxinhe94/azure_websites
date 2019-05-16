<%@ Control Language="C#" EnableViewState="False" Inherits="BlogEngine.Core.Web.Controls.CommentViewBase" %>
<div class="comments-area">

    <ul id="id_<%=Comment.Id %>">
        <li class="comment-item">
            <div class="comment <%= Post.Author.Equals(Comment.Author, StringComparison.OrdinalIgnoreCase) ? " self" : "" %>">
                <div class="author-image">
                    <%= Comment.Website != null ? "<a href=\"" + Comment.Website + "\" rel=\"nofollow\" class=\"url fn\">" + Comment.Author + "</a>" : "<a class=\"fn\">" +Comment.Author + "</a>" %>
                </div>
                <div class="comment-info">
                    <h5><b class="light-color">William Smith</b></h5>
                    <h6 class="date"><em><%=Comment.DateCreated.ToString("dd MMMM yyyy") %><</em>  - <%=ReplyToLink%> </h6>
                    <p>
                        <%= Text %>
                    </p>
                </div>
                <div class="comment-adminlinks">
                    <%= AdminLinks.Length > 2 ? AdminLinks.Substring(2) : AdminLinks %>
                </div>
            </div>
            <!-- comment -->
            <div id="replies_<%=Comment.Id %>" <%= (Comment.Comments.Count == 0 || Comment.Email == "pingback" || Comment.Email == "trackback") ? " style=\"display:none;\"" : "" %>>
                <asp:PlaceHolder ID="phSubComments" runat="server" />
            </div>
        </li>
    </ul>

</div>
<!-- comments-area -->

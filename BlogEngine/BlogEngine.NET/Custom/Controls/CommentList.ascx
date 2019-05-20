<%@ Control Language="C#" AutoEventWireup="true" Inherits="UserControls.CommentList" CodeBehind="CommentList.ascx.cs" %>
<%@ Import Namespace="BlogEngine.Core" %>

<div style="clear:both"></div>


    <asp:PlaceHolder runat="server" ID="phComments" />

<asp:PlaceHolder runat="server" ID="phTrckbacks"></asp:PlaceHolder>

    
        <asp:PlaceHolder runat="Server" ID="phAddComment">
            <div class="fb-comments" data-href="https://developers.facebook.com/docs/plugins/comments#configurator" data-width="100%" data-numposts="5"></div>
        </asp:PlaceHolder>
          

</div>
<!-- comments-area -->
<script type="text/javascript">
    function toggle_visibility(id, id2) {
        var e = document.getElementById(id);
        var h = document.getElementById(id2);
        if (e.style.display == 'block') {
            e.style.display = 'none';
            h.innerHTML = "+";
        }
        else {
            e.style.display = 'block';
            h.innerHTML = "-";
        }
    }
</script>

<asp:Label runat="server" ID="lbCommentsDisabled" CssClass="lbl-CommentsDisabled" Visible="false">
    <%=Resources.labels.commentsAreClosed %>
</asp:Label>

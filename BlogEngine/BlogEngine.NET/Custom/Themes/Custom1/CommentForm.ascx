<%@ Control Language="C#" AutoEventWireup="true" EnableViewState="false" Inherits="BlogEngine.Core.Web.Controls.CommentFormBase" %>
<%@ Import Namespace="BlogEngine.Core" %>

<form method="post">
    <div class="row">
        <div class="col-sm-6">
            <label for="txtName" class="lbl-user"><%=Resources.labels.name %>*</label>
            <input type="text" class="txt-user" name="txtName" id="txtName" tabindex="2" />
        </div>
        <div class="col-sm-6">
            <label for="txtEmail" class="lbl-email"><%=Resources.labels.email %>*</label>
            <input type="text" class="txt-email" id="txtEmail" tabindex="3" />
            <span id="gravatarmsg"></span>
        </div>
        <div class="col-sm-12">
            <label for="txtWebsite" class="lbl-website"><%=Resources.labels.website%></label>
            <input type="text" class="txt-website" id="txtWebsite" tabindex="4" />
        </div>
        <div class="col-sm-12">
            <label for="txtContent" class="lbl-content"><%=Resources.labels.comment%>*</label>
            <textarea class="txt-content" tabindex="7" id="txtContent" cols="3" rows="5" name="txtContent"></textarea>
        </div>
        <div class="col-sm-6">
            <input type="checkbox" id="cbNotify" class="cmnt-frm-notify" style="width: auto" tabindex="8" />
            <label for="cbNotify" style="width: auto; float: none; display: inline; padding-left: 5px"><%=Resources.labels.notifyOnNewComments %></label>
        </div>
        <div class="col-sm-12">
            <input type="button" id="btnSaveAjax" class="btn-save" style="margin-top: 10px" value="<%=Resources.labels.saveComment %>" onclick="return BlogEngine.validateAndSubmitCommentForm()" tabindex="10" />
        </div>
    </div>
</form>
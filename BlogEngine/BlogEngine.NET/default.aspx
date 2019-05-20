<%@ Page Language="C#" AutoEventWireup="true" Inherits="_default" CodeBehind="default.aspx.cs" %>

<%@ Import Namespace="BlogEngine.Core" %>
<%@ Register Src="Custom/Controls/PostList.ascx" TagName="PostList" TagPrefix="uc1" %>


<asp:content id="SliderPlaceHolder" contentplaceholderid="SliderPlaceHolder" runat="Server">
<div class="main-slider">

    <div id="slider">
        <%string imgSrc = ""; %>
        <% foreach (var slidePost in Post.GetPostsByCategory("SLIDES"))
            {%>
          <%imgSrc = Post.FindFirstImgWithRegex(slidePost.Content);  %>
        
     
         <div class="ls-slide" data-ls="bgsize:cover; bgposition:50% 50%; duration:4000; transition2d:104; kenburnsscale:1.00;">
             <% if (!string.IsNullOrEmpty(imgSrc))
                 { %> 
                <img src="<%=imgSrc %>" class="ls-bg" alt="" >
                     
                 <% }
                     else
                     { %>              
                            <img src="images/slider-1-1600x800.jpg" class="ls-bg" alt="" /><%} %> 
                            <div class="slider-content ls-l" style="top: 60%; left: 30%;" data-ls="offsetyin:100%; offsetxout:-50%; durationin:800; delayin:100; durationout:400; parallaxlevel:0;">
                                <a class="btn" href="#"><%=string.Join(",", slidePost.Tags.ToArray())  %></a>
                                <h3 class="title"><b><%=slidePost.Title %></b></h3>
                                <h6><%=slidePost.DateCreated %></h6>
                            </div>
                        </div>
            <%} %>
                </div>
                <!-- ls-slide -->
            </div>
         </div>
            <!-- slider -->

</asp:content>

<asp:content id="cphBody" contentplaceholderid="cphBody" runat="Server">
    <div class="col-lg-8 col-md-12">
   
  <div id="divError" runat="Server" />

  <uc1:PostList ID="PostList1" runat="server" />

  <blog:PostCalendar runat="server" ID="calendar" 
    EnableViewState="false"
    ShowPostTitles="true" 
    BorderWidth="0"
    NextPrevStyle-CssClass="header"
    CssClass="calendar" 
    WeekendDayStyle-CssClass="weekend" 
    OtherMonthDayStyle-CssClass="other" 
    UseAccessibleHeader="true" 
    Visible="false" 
    Width="100%" />

    </div>
<!-- container -->
</asp:content>

<asp:content id="cphBodysidebar" contentplaceholderid="cphBodysidebar" runat="Server">
                        <div class="col-lg-4 col-md-12">
                            <div class="sidebar-area">

                            <div class="sidebar-section about-author center-text">
                                <div class="author-image">
                                    <img src="images/author-1-200x200.jpg" alt="Autohr Image"></div>

                                <ul class="social-icons">
                                    <li><a href="#"><i class="ion-social-facebook-outline"></i></a></li>
                                    <li><a href="#"><i class="ion-social-twitter-outline"></i></a></li>
                                    <li><a href="#"><i class="ion-social-instagram-outline"></i></a></li>
                                </ul>
                                <!-- right-area -->

                                <h4 class="author-name"><b class="light-color">Phạm Hiếu</b></h4>
                                <p>
                                    Describes section
                                </p>

                                <div class="signature-image">
                                <a class="read-more-link" href="#"><b>READ MORE</b></a>

                            </div>
                            <!-- sidebar-section about-author -->

                            <div class="sidebar-section src-area">

                                <form action="post">
                                    <input class="src-input" type="text" placeholder="Search">
                                    <button class="src-btn" type="submit"><i class="ion-ios-search-strong"></i></button>
                                </form>

                            </div>
                            <!-- sidebar-section src-area -->

                            <div class="sidebar-section newsletter-area">
                                <h5 class="title"><b>Subscribe to our newsletter</b></h5>
                                <form action="post">
                                    <input class="email-input" type="text" placeholder="Your email here">
                                    <button class="btn btn-2" type="submit">SUBSCRIBE</button>
                                </form>
                            </div>
                            <!-- sidebar-section newsletter-area -->

                            <div class="sidebar-section category-area">
                                <h4 class="title"><b class="light-color">Categories</b></h4>
                               
                                <%--<blog:WidgetZone ID="WidgetZone2" runat="server" ZoneName="sidebar Post" />--%>
                            </div>
                            <!-- sidebar-section category-area -->

                            <div class="sidebar-section latest-post-area">
                                <h4 class="title"><b class="light-color">Latest Posts</b></h4>
                                    
                                 <% foreach (var item in Post.GetLastestPost())
                                     {%>
                                        <div class="latest-post" href="<%=item.Id%>">
                                    <div class="l-post-image">
                                         <img alt="category image" src="<%=FindFirstImgWithRegex(item.Content) %>" class="ls-bg" alt="" >
                                           </div>
                                    <div class="post-info">
                                      
                                        <h6><a href="#"><b class="light-color"><%=item.Title %></b></a></h6>
                                        <h6 class="date"><em><%=item.DateCreated.ToString("dd-MM-yyyy") %></em></h6>
                                    </div>
                         
                                  </div>
                                     <%} %>
                           


                          
                            <!-- sidebar-section latest-post-area -->

                           <%-- <div class="sidebar-section advertisement-area">
                                <h4 class="title"><b class="light-color">Advertisement</b></h4>
                                <a class="advertisement-img" href="#">
                                    <img src="images/advertise-1-400x500.jpg" alt="Advertisement Image">
                                    <h6 class="btn btn-2 discover-btn">DISCOVER</h6>
                                </a>
                            </div>--%>
                            <!-- sidebar-section advertisement-area -->
                         </div>
                        <!-- about-author -->
                    </div>
                    <!-- col-lg-4 -->
</asp:content>

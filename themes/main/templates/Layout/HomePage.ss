</div><!-- /.container -->



<!----- About ----->
<div class="section np fs v-align">
	
	<div class="v-align-inner">
		<div class="container">
			<div class="row">
				<div class="col-md-9">
					
					<p class="small">
						<strong>HAMISH GRAY</strong><br>
						<span class="meta">
							Digital Designer, Front End Developer<br>
							<a href="mailto:$SiteConfig.Email">$SiteConfig.Email</a><br>
							-<br>
							Auckland, New Zealand
						</span>
					</p>
					
					<hr class="left">
					$Content
					<hr class="left">
					<h5>My projects and musings</h5>
					
				</div>
			</div>
		</div>
	</div>
	
	<% if not NoBannerImage %>
	<div id="banner"><img src="<% if BannerImage %>$BannerImage.SetWidth(2000).URL<% else %>$ThemeDir/images/bg.jpg<% end_if %>"></div>
	<% end_if %>
	
</div>






<div class="section np" id="Work">
	
	<div class="container-fluid">
		<div class="row masonry">
			
			<div class="grid-sizer col-lg-4 col-md-4 col-sm-6 col-xs-12"></div>
			
			<% loop WorkBlogs %>
				
				
				<div class="col-lg-4 col-md-4 col-sm-6 col-xs-12 box grid-item work<% if Feature %> height2<% end_if %>" style="border-color: #{$PageColor}">
					<% include WorkTile %>
				</div>
					
							
			<% end_loop %>
			
		</div>
	</div>	
</div>



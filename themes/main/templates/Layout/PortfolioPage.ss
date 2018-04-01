<!--
<div class="container">-->
</div><!-- /.container -->




<div class="section np fs v-align">
	
	<div class="v-align-inner">
		<div class="container">
			<div class="row">
				<div class="col-md-6">
					
					<p class="small">
						<strong>WORK</strong><br>
						-<br>
						Selected projects<br>
					</p>
					
					<hr class="left">
					<h1>$Title</h1>
					<p class="lead">$ShortDescription</p>
					<hr class="left">
					
					<% if WebLink %>
					<p class="small">
						<strong><a href="$WebLink" target="_blank">VIEW THE WEBSITE LIVE</a></strong>
					</p>
					<% end_if %>
					
					<% if Client %>
					<p class="small">
						<strong>CLIENT</strong><br>
						<span class="meta">$Client</span>
					</p>
					<% end_if %>
					
					<% if Scope %>
					<p class="small">
						<strong>SCOPE</strong><br>
						<span class="meta">$Scope</span>
					</p>
					<% end_if %>
					
					<% if PublishDate %>
					<p class="small">
						<strong>DATE</strong><br>
						<span class="meta">$PublishDate.Long</span>
					</p>
					<% end_if %>
					
				</div>
			</div>
		</div>
	</div>
	
	<% if not NoBannerImage %>
	<div id="banner"><img src="<% if BannerImage %>$BannerImage.URL<% else %>$ThemeDir/images/bg.jpg<% end_if %>" width="100%"></div>
	<% end_if %>
	
</div>



<div class="section">
	<div class="container">
		<div class="row">
			<div class="col-md-12">
			
				$Content
				$Form
				
				<hr>
				
				<% if VimeoID %>
				<div class="center">
					<iframe src="https://player.vimeo.com/video/$VimeoID" width="720" height="420" frameborder="0" class="vimeo" webkitallowfullscreen mozallowfullscreen allowfullscreen></iframe>
					<hr>
				</div>
				<% end_if %>
				
				<% loop PortfolioImages %>
					
					<% if Format = Wide %>
						
					</div>
					</div>
					</div>
					
					<div class="container-fluid portfolio_image">
						<div class="row">
							<img src="$Image.URL" width="100%">
						</div>
						<% if Description %>
						<div class="container">
							<p class="small description">$Description</p>
						</div>
						<% end_if %>
					</div>
					
					<div class="container">
					<div class="row">
					<div class="col-md-12">		
					
					<% else %>
					
						<div class="portfolio_image">
							<img src="$Image.URL" width="100%">
							<% if Title %>
								<h5>$Title</h5>
							<% end_if %>
							<% if Description %>
								<p class="small description">$Description</p>
							<% end_if %>
						</div>
					
					<% end_if %>
				
				<% end_loop %>
				
				
				
				<% if CreditCreativeDirector || CreditArtDirector || CreditDesigner || CreditPhotographer %>
				<hr>
				<h5>Contributors</h5>
				<ul class="lined small">
					<% if CreditCreativeDirector %><li><strong>CREATIVE DIRECTOR</strong> $CreditCreativeDirector</li><% end_if %>
					<% if CreditArtDirector %><li><strong>ART DIRECTOR</strong> $CreditArtDirector</li><% end_if %>
					<% if CreditDesigner %><li><strong>DESIGNER</strong> $CreditDesigner</li><% end_if %>
					<% if CreditPhotographer %><li><strong>PHOTOGRAPHER</strong> $CreditPhotographer</li><% end_if %>
				</ul>
				<% end_if %>

				
			
			
			</div>
			
		</div>
	</div>
</div>


<div class="container-fluid section np">


	<% loop RecentWork %>
	
			<div class="col-lg-4 col-md-4 col-sm-6 col-xs-12 box grid-item work<% if Feature %> height2<% end_if %>" style="border-color: #{$PageColor}">
				<% include WorkTile %>
			</div>
					
	<% end_loop %>


</div>

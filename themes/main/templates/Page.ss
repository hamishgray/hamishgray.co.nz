<!DOCTYPE html>
<!--[if !IE]><!-->
<html lang="$ContentLocale">
<!--<![endif]-->
<!--[if IE 6 ]><html lang="$ContentLocale" class="ie ie6"><![endif]-->
<!--[if IE 7 ]><html lang="$ContentLocale" class="ie ie7"><![endif]-->
<!--[if IE 8 ]><html lang="$ContentLocale" class="ie ie8"><![endif]-->



<head>
	<% base_tag %>
	<title>$SiteConfig.Title · $Title</title>
	<meta charset="utf-8">
	<meta name="viewport" content="width=device-width, initial-scale=1, user-scalable=no">
	<meta name="description" content="$SiteConfig.SiteDescription">
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
	
	$MetaTags(false)
	<!--[if lt IE 9]>
	<script src="//html5shiv.googlecode.com/svn/trunk/html5.js"></script>
	<![endif]-->
	
	<% require themedCSS('bootstrap.min') %>
	<% require themedCSS('bootstrap-theme.min') %>
	<% require themedCSS('video-js.min') %>
	<% require themedCSS('typography') %>
	<% require themedCSS('form') %>
	<% require themedCSS('layout') %>
	
	<script type="text/javascript" src="{$ThemeDir}/javascript/jquery.js"></script>
	<script src="http://ajax.googleapis.com/ajax/libs/jquery/1.9.1/jquery.min.js"></script>

	<link rel="shortcut icon" href="$ThemeDir/images/favicon.png" />
		
	<link href='https://fonts.googleapis.com/css?family=Droid+Serif:400,400italic,700,700italic' rel='stylesheet' type='text/css'>
	
</head>



<body class="$ClassName<% if not LightTheme %> dark<% end_if %>"<% if PageColor %> style="background-color: #$PageColor;"<% end_if %> <% if $i18nScriptDirection %>dir="$i18nScriptDirection"<% end_if %>>
	
	
	
	<% include Header %>
	
	
	
	<div class="main">
		<div class="container">
			$Layout
		</div>		
	</div>
	
	
	
	<% include Footer %>
	
	
	
	
	<script type="text/javascript" src="{$ThemeDir}/javascript/bootstrap.js"></script>
	
	<script type="text/javascript" src="{$ThemeDir}/javascript/plugins/masonry.pkgd.min.js"></script>
	<script type="text/javascript" src="{$ThemeDir}/javascript/plugins/imagesloaded.pkgd.js"></script>
	
	<script type="text/javascript" src="{$ThemeDir}/javascript/site.js"></script>
	
	<script type="text/javascript">
	
		$('.masonry').imagesLoaded( function() {
			$('.masonry').masonry({
				itemSelector: '.grid-item',
				columnWidth: '.grid-sizer',
				percentPosition: true
			});
		});
				
	</script>
	
	
	<script>
	
		(function(i,s,o,g,r,a,m){i['GoogleAnalyticsObject']=r;i[r]=i[r]||function(){
		(i[r].q=i[r].q||[]).push(arguments)},i[r].l=1*new Date();a=s.createElement(o),
		m=s.getElementsByTagName(o)[0];a.async=1;a.src=g;m.parentNode.insertBefore(a,m)
		})(window,document,'script','//www.google-analytics.com/analytics.js','ga');
		
		ga('create', 'UA-74134473-1', 'auto');
		ga('send', 'pageview');
	
	</script>

</body>
</html>

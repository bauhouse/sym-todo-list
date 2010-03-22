<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0"
	xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

<xsl:template name="system-navigation">
	<xsl:if test="$is-logged-in and /data/preferences/entry/show = 'Yes'">
		<div id="system-navigation">
			<ul class="menu main-menu">
				<li><a href="?debug">Debug</a>
					<ul>
						<li><a href="?debug=params">Parameters</a></li>
						<li><a href="?debug=xml">XML</a></li>
						<li><a href="?debug={concat($current-page,'.xsl')}">XSL</a></li>
						<li><a href="?debug=result">Result</a></li>
					</ul>
				</li>
				<li><a href="?profile">Profile</a>
					<ul>
						<li><a href="?profile=general">General Details</a></li>
						<li><a href="?profile=data-sources">Data Source Execution</a></li>
						<li><a href="?profile=events">Event Execution</a></li>
						<li><a href="?profile=render-statistics">Full Page Render Statistics</a></li>
						<li><a href="?profile=database-queries">Database Queries</a></li>
					</ul>
				</li>
				<li><a href="{$root}/symphony/">Publish</a>
					<ul>
						<li><a href="{$root}/symphony/publish/lists/">Lists</a></li>
						<li><a href="{$root}/symphony/publish/items/">Items</a></li>
						<li><a href="{$root}/symphony/publish/preferences/">Preferences</a></li>
					</ul>
				</li>
				<li><a href="{$root}/symphony/">Blueprints</a>
					<ul>
						<li><a href="{$root}/symphony/blueprints/pages/">Pages</a></li>
						<li><a href="{$root}/symphony/blueprints/components/">Components</a></li>
						<li><a href="{$root}/symphony/blueprints/sections/">Sections</a></li>
					</ul>
				</li>
				<li><a href="{$root}/symphony/">System</a>
					<ul>
						<li><a href="{$root}/symphony/system/authors/">Authors</a></li>
						<li><a href="{$root}/symphony/system/preferences/">Preferences</a></li>
						<li><a href="{$root}/symphony/system/extensions/">Extensions</a></li>
					</ul>
				</li>
				<li><a href="http://symphony-cms.com/">Symphony CMS</a>
					<ul>
						<li><a href="http://symphony-cms.com/discuss/">Forum</a></li>
						<li><a href="http://symphony-cms.com/discuss/blog/">Blog</a></li>
						<li><a href="http://symphony-cms.com/discuss/issues/">Issues</a></li>
						<li><a href="http://symphony-cms.com/get-involved/member/{$username}/">Member Profile</a></li>
						<li><a href="http://github.com/symphony/symphony-2">GitHub</a></li>
					</ul>
				</li>
				<li id="login-status">
					<span class="status">
						Logged in as
						<a href="{$root}/symphony/system/authors/edit/{$user-id}/">
							<xsl:value-of select="$name"/>
						</a>, 
						<span class="user-type"><xsl:value-of select="$user-type"/></span>
					</span>
					<a href="{$root}/symphony/logout/">Logout</a>
				</li>
			</ul>
		</div>
	</xsl:if>
</xsl:template>

</xsl:stylesheet>
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
						<li><a href="?profile=delegates">Delegate Execution</a></li>
						<li><a href="?profile=render-statistics">Full Page Render Statistics</a></li>
						<li><a href="?profile=memory-usage">Memory Usage</a></li>
						<li><a href="?profile=database-queries">Database Queries</a></li>
					</ul>
				</li>
				<li><a href="{$root}/symphony/publish/">Publish</a>
					<ul>
						<li><a href="{$root}/symphony/publish/lists/">Lists</a></li>
						<li><a href="{$root}/symphony/publish/items/">Items</a></li>
						<li><a href="{$root}/symphony/publish/preferences/">Preferences</a></li>
					</ul>
				</li>
				<li><a href="{$root}/symphony/blueprints/sections/">Blueprints</a>
					<ul>
						<li><a href="{$root}/symphony/blueprints/pages/">Pages</a></li>
						<li><a href="{$root}/symphony/blueprints/sections/">Sections</a></li>
						<li><a href="{$root}/symphony/blueprints/datasources/">Data Sources</a></li>
						<li><a href="{$root}/symphony/blueprints/events/">Events</a></li>
					</ul>
				</li>
				<li><a href="{$root}/symphony/system/preferences/">System</a>
					<ul>
						<li><a href="{$root}/symphony/system/authors/">Authors</a></li>
						<li><a href="{$root}/symphony/system/preferences/">Preferences</a></li>
						<li><a href="{$root}/symphony/system/extensions/">Extensions</a></li>
					</ul>
				</li>
				<li><a href="https://github.com/symphonycms/symphonycms/">Community</a>
          <ul>
            <li><a href="https://getsymphony.com/">Symphony Forum</a></li>
            <li><a href="https://symphonyextensions.com/">Symphony Extensions</a></li>
            <li><a href="https://gitter.im/symphonycms/symphony-2">Gitter Forum</a></li>
            <li><a href="https://github.com/symphonycms/symphonycms/">GitHub</a></li>
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

<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0"
	xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

<xsl:template name="page-title">
	<xsl:value-of select="$website-name"/>
	<xsl:text> &#8212; </xsl:text>
	<xsl:value-of select="$page-title"/>
</xsl:template>

<xsl:template name="page-header">
	<head>
		<title><xsl:call-template name="page-title"/></title>
		<link rel="stylesheet" type="text/css" href="{$workspace}/assets/css/interface.css"/>
		<link rel="stylesheet" type="text/css" href="{$workspace}/assets/css/system.css"/>
	</head>
</xsl:template>

<xsl:template name="page-footer">
	<div id="basebar">
		<div class="box">
			<div id="nameplate">
				<h3><a href="http://getsymphony.com/">Symphony CMS</a></h3>
				<p>Powered by <a href="http://getsymphony.com/">Symphony CMS</a> <br />
				Designed by <a href="http://stephenbau.com/">Stephen Bau</a>,
				<a href="http://builderscollective.com/">Builders Collective</a></p>
			</div>
		</div>
	</div>
	<div id="footer">
		<div class="box">
		</div>
	</div>
</xsl:template>

</xsl:stylesheet>

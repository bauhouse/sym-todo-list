<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0"
	xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

<xsl:output method="xml"
	doctype-public="-//W3C//DTD XHTML 1.0 Strict//EN"
	doctype-system="http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd"
	omit-xml-declaration="yes"
	encoding="UTF-8"
	indent="yes" />

<xsl:template match="/">
	<html>
		<head>
			<title><xsl:value-of select="$website-name"/></title>
		</head>
		<body>
			<h1><xsl:value-of select="$website-name"/></h1>
			<ul class="lists"><xsl:apply-templates select="data/lists/entry"/></ul>
		</body>
	</html>
</xsl:template>

<xsl:template match="lists/entry">
	<li>
		<a href="#entry-id-{@id}"><xsl:value-of select="name"/></a>
		<ul><xsl:apply-templates select="items/item"/></ul>
	</li>
</xsl:template>

<xsl:template match="items/item">
	<li>
		<a href="#item-id-{@id}"><xsl:value-of select="to-do"/></a>
	</li>
</xsl:template>

</xsl:stylesheet>
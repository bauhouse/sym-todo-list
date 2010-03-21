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
	<xsl:param name="entry" select="/data/lists/entry[@id = '5']"/>
	<xsl:param name="item" select="$entry/items/item[@id = '4']"/>
	<html>
		<head>
			<title><xsl:value-of select="$website-name"/></title>
		</head>
		<body>
			<h1><xsl:value-of select="$website-name"/></h1>
			<xsl:apply-templates select="data/lists/entry" mode="form"/>
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

<xsl:template match="lists/entry" mode="form">
	<form method="post" action="" enctype="multipart/form-data">
		<fieldset>
			<legend><xsl:value-of select="name"/></legend>
			<xsl:apply-templates select="items/item" mode="form"/>
			<input name="action[save-items]" type="submit" value="Update List"/>
		</fieldset>
	</form>
</xsl:template>

<xsl:template match="items/item" mode="form">
	<xsl:param name="index" select="position() - 1"/>
	<p>
		<label>
			<input type="hidden" value="no" name="fields[{$index}][open]" />
			<input type="checkbox" name="fields[{$index}][open]" value="yes">
				<xsl:if test="open = 'Yes'">
					<xsl:attribute name="checked">checked</xsl:attribute>
				</xsl:if>
			</input>
			<input name="id[{$index}]" type="hidden" value="{@id}" />
			<xsl:text> </xsl:text>
			<!-- xsl:value-of select="to-do"/ -->
			<input type="input" name="fields[{$index}][to-do]" value="{to-do}" style="width:300px"/>
		</label>
	</p>
</xsl:template>

<xsl:template name="item-checkbox-form">
	<form method="post" action="" enctype="multipart/form-data">
		<fieldset>
			<legend>Things To Learn</legend>
			<p>
				<label>
					<input type="input" name="fields[0][to-do]" value="{$item/to-do}" />
				</label>
			</p>
			<p>
				<label>
					<input type="hidden" value="no" name="fields[0][open]" />
					<input type="checkbox" name="fields[0][open]" value="yes">
						<xsl:if test="$item/open = 'Yes'">
							<xsl:attribute name="checked">checked</xsl:attribute>
						</xsl:if>
					</input>
					<input name="id[0]" type="hidden" value="4" />
					<xsl:text> </xsl:text>
					<xsl:value-of select="$item/to-do"/>
				</label>
			</p>
			<input name="action[save-items]" type="submit" value="Update List" />
		</fieldset>
	</form>
</xsl:template>

</xsl:stylesheet>
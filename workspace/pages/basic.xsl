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
			<xsl:call-template name="add-item-to-list" />
			<xsl:apply-templates select="data/lists/entry" mode="form"/>
			<xsl:call-template name="new-list-form" />
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
			<xsl:call-template name="new-item-field">
				<xsl:with-param name="index" select="count(items/item)" />
			</xsl:call-template>
			<xsl:apply-templates select="items/item" mode="form"/>
			<input name="action[save-items]" type="submit" value="Update List"/>
		</fieldset>
	</form>
	<xsl:call-template name="new-item-form" />
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

<xsl:template name="new-list-form">
	<form method="post" action="" enctype="multipart/form-data">
		<fieldset>
			<legend>Create a New List</legend>
			<input name="MAX_FILE_SIZE" type="hidden" value="5242880" />
			<label>Name
				<input name="fields[name]" type="text" />
			</label>
			<input name="action[save-list]" type="submit" value="Create List" />
		</fieldset>
	</form>
</xsl:template>

<xsl:template name="new-item-form">
	<form method="post" action="" enctype="multipart/form-data">
		<fieldset>
			<legend>Create a New Item</legend>
			<p>
				<label>
					<input type="hidden" value="no" name="fields[open]" />
					<input type="checkbox" name="fields[open]" value="yes">
						<xsl:if test="open = 'Yes'">
							<xsl:attribute name="checked">checked</xsl:attribute>
						</xsl:if>
					</input>
					<xsl:text> </xsl:text>
					<input type="input" name="fields[to-do]" value="" style="width:300px"/>
				</label>
			</p>
			<input name="action[save-item]" type="submit" value="Create Item" />
		</fieldset>
	</form>
</xsl:template>

<xsl:template name="new-item-field">
	<xsl:param name="index" />
	<p>
		<label>
			<input type="hidden" value="no" name="fields[{$index}][open]" />
			<input type="checkbox" name="fields[{$index}][open]" value="yes">
				<xsl:if test="open = 'Yes'">
					<xsl:attribute name="checked">checked</xsl:attribute>
				</xsl:if>
			</input>
			<xsl:text> </xsl:text>
			<input type="input" name="fields[{$index}][to-do]" value="{to-do}" style="width:300px"/>
		</label>
	</p>
</xsl:template>

<xsl:template name="add-item-to-list">
	<xsl:param name="sort-order-values">
		<xsl:call-template name="implode">
			<xsl:with-param name="items" select="/data/lists/entry[@id='5']/items/item/@id" />
		</xsl:call-template>
	</xsl:param>
	<form method="post" action="" enctype="multipart/form-data">
		<fieldset>
			<legend>Add to List</legend>
			<input name="id" type="hidden" value="5" />
			<p>
				<label>Name
					<input name="fields[name]" type="text" value="Things to Learn" />
				</label>
			</p>
			<p>
				<select name="fields[items]" multiple="multiple" style="width: 300px;">
					<xsl:for-each select="/data/lists/entry[@id='5']/items/item">
						<option value="{@id}" selected="selected"><xsl:value-of select="to-do" /></option>
					</xsl:for-each>
				</select>
			</p>
			<input name="fields[sort_order][8]" type="hidden" value="{$sort-order-values}" />
			<input name="fields[subsection_id][8]" type="hidden" value="2" />
			<input name="action[save-list]" type="submit" value="Add to List" />
		</fieldset>
	</form>
</xsl:template>

<xsl:template name="implode">
	<xsl:param name="items" />
	<xsl:param name="separator" select="','" />
	<xsl:for-each select="$items">
		<xsl:if test="position() &gt; 1">
			<xsl:value-of select="$separator" />
		</xsl:if>
		<xsl:value-of select="." />
	</xsl:for-each>
</xsl:template>

</xsl:stylesheet>
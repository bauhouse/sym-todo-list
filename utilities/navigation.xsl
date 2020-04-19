<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

<xsl:template match="navigation">
	<xsl:apply-templates select="page[not(types/type = 'hidden')]"/>
</xsl:template>

<xsl:template match="page">
	<li>
		<xsl:if test="@handle = $current-page or @handle = $root-page">
			<xsl:attribute name="class">current</xsl:attribute>
		</xsl:if>
		<a href="{$root}/{@handle}/">
			<xsl:value-of select="name"/>
		</a>
	</li>
</xsl:template>

<xsl:template match="page/page">
	<li>
		<xsl:choose>
			<xsl:when test="$root-page = ''">
				<a href="{$root}/{$current-page}/{@handle}/">
					<xsl:value-of select="name"/>
				</a>
			</xsl:when>
			<xsl:otherwise>
				<xsl:if test="@handle = $current-page">
					<xsl:attribute name="class">current</xsl:attribute>
				</xsl:if>
				<a href="{$root}/{$root-page}/{@handle}/">
					<xsl:value-of select="name"/>
				</a>
			</xsl:otherwise>
		</xsl:choose>
	</li>
</xsl:template>

<xsl:template name="secondary-navigation">
	<xsl:choose>
		<xsl:when test="$root-page = ''">
			<xsl:apply-templates select="data/navigation/page[@handle=$current-page]/page[not(types/type = 'hidden')]"/>
		</xsl:when>
		<xsl:otherwise>
			<xsl:apply-templates select="data/navigation/page[@handle=$root-page]/page[not(types/type = 'hidden')]"/>
		</xsl:otherwise>
	</xsl:choose>
</xsl:template>

</xsl:stylesheet>
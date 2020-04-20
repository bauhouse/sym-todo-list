<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0"
	xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

<xsl:template match="events/save-items">
	<pre><code><xsl:copy-of select="*"/></code></pre>
	<!--
	<div>
		<h3>Save Items Event</h3>
	</div>
	<ul>
		<xsl:for-each select="entry">
			<li>
				<xsl:value-of select="@position"/>
				<xsl:text>: </xsl:text>
				<xsl:value-of select="@result"/>
				<xsl:if test="@type = 'success'">
					<xsl:text> </xsl:text>
					(<xsl:value-of select="@type"/>)
				</xsl:if>
				<ul>
					<li>
						<xsl:value-of select="message"/>
					</li>
				</ul>
			</li>
		</xsl:for-each>
	</ul>
	-->
</xsl:template>

</xsl:stylesheet>

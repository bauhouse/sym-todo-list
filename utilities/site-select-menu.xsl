<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0"
	xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

<xsl:template name="site-select-menu">
	<form class="filter" name="siteSelectMenu" id="siteSelectMenu">
		<select name="siteSelectList">
			<option value="https://builderscollective.com/">Builders Collective</option>
			<optgroup label="Symphony CMS">
				<option value="http://getsymphony.com/discuss/">Forum</option>
				<option value="http://getsymphony.com/discuss//blog/">Blog</option>
				<option value="http://getsymphony.com/discuss/issues/">Issues</option>
				<option value="http://getsymphony.com/get-involved/member/{$username}/">Member Profile</option>
				<option value="http://github.com/symphonycms/symphonycms">GitHub</option>
			</optgroup>
			<optgroup label="GitHub">
				<option value="http://github.com/">Dashboard</option>
				<option value="http://github.com/{$username}/">Profile</option>
			</optgroup>
		</select>
		<input type="button" onClick="document.location = document.siteSelectMenu.siteSelectList.options [document.siteSelectMenu.siteSelectList.selectedIndex].value;" value="Go to Site" />
	</form>
</xsl:template>

</xsl:stylesheet>

<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0"
	xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

<xsl:import href="../utilities/master.xsl"/>
<xsl:import href="../utilities/list-sites.xsl"/>
<xsl:import href="../utilities/list-resources.xsl"/>
<xsl:param name="count" select="0"/>

<xsl:template match="data">
	<div id="box-content">
		<div id="content" class="content-3col-overview">
			<form class="filter" name="siteSelectMenu" id="siteSelectMenu">
				<select name="siteSelectList">
					<option value="http://www.domain7.com/">Domain7</option>
					<optgroup label="Symphony CMS">
						<option value="http://symphony-cms.com/discuss/">Forum</option>
						<option value="http://symphony-cms.com/discuss//blog/">Blog</option>
						<option value="http://symphony-cms.com/discuss/issues/">Issues</option>
						<option value="http://symphony-cms.com/get-involved/member/{$username}/">Member Profile</option>
						<option value="http://github.com/symphony/symphony-2">GitHub</option>
					</optgroup>
					<optgroup label="GitHub">
						<option value="http://github.com/">Dashboard</option>
						<option value="http://github.com/{$username}/">Profile</option>
					</optgroup>
				</select>
				<input type="button" onClick="document.location = document.siteSelectMenu.siteSelectList.options [document.siteSelectMenu.siteSelectList.selectedIndex].value;" value="Go to Site" />
			</form>
			<h2>
				<a href="{$root}/"><xsl:value-of select="$page-title"/></a>
			</h2>

			<div class="colA">
				<div class="lists">
					<div class="clients-box">
						<div class="box-header">
							<h3>Sites</h3>
						</div>
						<div class="list-box">
							<xsl:call-template name="list-sites"/>
						</div>
					</div>
				</div>
			</div>

			<div class="colB">
				<div class="lists">
					<div class="clients-box">
						<div class="box-header">
							<h3>Resources</h3>
						</div>
						<div class="list-box">
							<xsl:call-template name="list-resources"/>
						</div>
					</div>
				</div>
			</div>

			<div class="colC">
				<div class="lists">
					<div class="clients-box">
						<div class="box-header">
							<h3><a href="{$root}/{$current-page}/edit/all/">To Do List</a></h3>
						</div>
						<div id="tasks-list" class="list-box-fluid pane">
							<xsl:apply-templates select="lists" mode="table"/>
						</div>
					</div>
				</div>
			</div>

		</div>
	</div>
</xsl:template>

<xsl:template match="lists" mode="table">
	<form method="post" action="" enctype="multipart/form-data">
		<fieldset>
			<table class="lists">
				<colgroup>
					<col/>
					<col class="status"/>
				</colgroup>
				<thead>
					<tr>
						<th>Lists</th>
						<th>
							<input name="action[save-items]" type="submit" value="Update Lists" />
						</th>
					</tr>
				</thead>
				<tbody class="list">
					<xsl:apply-templates select="entry" mode="table"/>
				</tbody>
			</table>
		</fieldset>
		<input name="redirect" type="hidden" value="{$root}/success/" />
	</form>
</xsl:template>

<xsl:template match="entry" mode="table">
	<xsl:param name="count" select="sum(preceding-sibling::entry/items/@items)"/>
	<tr class="list-name">
		<th colspan="2"><h4><a href="{$root}/{$current-page}/edit/list/{@id}/"><xsl:value-of select="name"/></a></h4></th>
	</tr>
	<xsl:apply-templates select="items/item" mode="table">
		<xsl:with-param name="count" select="$count"/>
		<xsl:with-param name="list-id" select="@id"/>
	</xsl:apply-templates>
</xsl:template>

<xsl:template match="items/item" mode="table">
	<xsl:param name="list-id"/>
	<xsl:param name="count"/>
	<xsl:param name="index" select="$count + position() - 1"/>
	<tr class="item">
		<th colspan="2">
			<input type="hidden" value="no" name="fields[{$index}][open]" />
			<input type="checkbox" name="fields[{$index}][open]" value="yes">
				<xsl:if test="open = 'Yes'">
					<xsl:attribute name="checked">checked</xsl:attribute>
				</xsl:if>
			</input>
			<input name="id[{$index}]" type="hidden" value="{@id}" />
			<xsl:text> </xsl:text>
			<xsl:choose>
				<xsl:when test="$item = @id or ($list = 'list' and $item = $list-id) or $list = 'all'">
					<input type="input" name="fields[{$index}][to-do]" value="{to-do}" style="width: 90%"/>
				</xsl:when>
				<xsl:otherwise>
					<a href="{$root}/{$current-page}/edit/{$list-id}/{@id}/">
						<xsl:value-of select="to-do"/>
					</a>
				</xsl:otherwise>
			</xsl:choose>
		</th>
	</tr>
</xsl:template>

</xsl:stylesheet>
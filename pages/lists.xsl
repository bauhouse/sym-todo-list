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
							<xsl:apply-templates select="items" mode="table"/>
						</div>
					</div>
				</div>
				<!-- xsl:apply-templates select="events/save-items"/ -->
			</div>

		</div>
	</div>
</xsl:template>

<xsl:template match="items" mode="table">
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
					<xsl:apply-templates select="list" mode="table" />
				</tbody>
			</table>
		</fieldset>
		<!-- <input name="redirect" type="hidden" value="{$root}/" /> -->
	</form>
</xsl:template>

<xsl:template match="list" mode="table">
	<xsl:param name="list-count" select="count(preceding-sibling::list)"/>
	<xsl:param name="item-count" select="count(preceding-sibling::list/entry)"/>
	<tr class="list-name">
		<th colspan="2"><h4><a href="{$root}/{$current-page}/edit/list/{@link-id}/"><xsl:value-of select="@value"/></a></h4></th>
	</tr>
	<xsl:apply-templates select="entry" mode="table">
		<xsl:with-param name="list-count" select="$list-count"/>
		<xsl:with-param name="item-count" select="$item-count"/>
		<xsl:with-param name="list-id" select="@link-id"/>
	</xsl:apply-templates>
</xsl:template>

<xsl:template match="entry" mode="table">
	<xsl:param name="list-id"/>
	<xsl:param name="list-count"/>
	<xsl:param name="item-count"/>
	<xsl:param name="index" select="$list-count + $item-count + position() - 1"/>
	<xsl:param name="index-new" select="$index + 1"/>
	<tr class="item">
		<th colspan="2">
			<input type="hidden" name="id[{$index}]" value="{@id}" />
			<input type="hidden" name="fields[{$index}][list]" value="{$list-id}" />
			<input type="hidden" name="fields[{$index}][order]" value="{$index}" />
			<input type="hidden" name="fields[{$index}][done]" value="no" />
			<input type="checkbox" name="fields[{$index}][done]" value="yes">
				<xsl:if test="done = 'Yes'">
					<xsl:attribute name="checked">checked</xsl:attribute>
				</xsl:if>
			</input>
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
	<xsl:if test="position() = last() and ($item = @id or ($list = 'list' and $item = $list-id) or $list = 'all')">
		<tr class="item">
			<th colspan="2">
				<input type="hidden" name="fields[{$index-new}][list]" value="{$list-id}" />
				<input type="hidden" name="fields[{$index-new}][order]" value="{$index-new}" />
				<input type="checkbox" name="fields[{$index-new}][done]" value="no" />
				<xsl:text> </xsl:text>
				<input type="input" name="fields[{$index-new}][to-do]" value="" style="width: 90%" />
			</th>
		</tr>
	</xsl:if>
</xsl:template>

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

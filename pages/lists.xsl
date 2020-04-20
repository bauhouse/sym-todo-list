<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0"
	xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

<xsl:import href="../utilities/master.xsl"/>
<xsl:import href="../utilities/list-sites.xsl"/>
<xsl:import href="../utilities/list-resources.xsl"/>
<xsl:import href="../utilities/site-select-menu.xsl"/>

<xsl:template match="data">
	<div id="box-content">
		<div id="content" class="content-3col-overview">
			<xsl:call-template name="site-select-menu"/>
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

</xsl:stylesheet>

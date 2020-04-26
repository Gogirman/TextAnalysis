<?xml version="1.0"?> 
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform"> 
	<xsl:output method="text"/>
	
	<xsl:template match="lesson">
		Название: <xsl:value-of select="title"/>
		Тип: <xsl:value-of select="type"/>
		Аудитория: <xsl:value-of select="classroom"/>
		Преподаватель: <xsl:value-of select="teacher"/>
		Время: <xsl:value-of select="timeStart"/> - <xsl:value-of select="timeEnd"/>
	</xsl:template>
	
	<xsl:template match="day">
		День: <xsl:value-of select="@title"/>
		<xsl:apply-templates/>
	</xsl:template>
	<xsl:template match="schedule"> 
		Расписание: <xsl:apply-templates/> 
	</xsl:template>

</xsl:stylesheet> 
<?xml version="1.0"?> 
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform"> 
	<xsl:output method="xml" indent="yes" omit-xml-declaration="yes"/>
	
	<xsl:template match="lesson">
		<tr>
			<td><xsl:value-of select="../@title"/></td>
			<td><xsl:value-of select="timeStart"/> - <xsl:value-of select="timeEnd"/></td>
			<td><xsl:value-of select="title"/> (<xsl:value-of select="type"/>)</td>
			<td><xsl:value-of select="classroom"/></td>
			<td><xsl:value-of select="teacher"/></td>
		</tr>
	</xsl:template>
	
	<xsl:template match="day">
		<xsl:apply-templates/>
	</xsl:template>
	
	<xsl:template match="schedule"> 
		<html>
			<head>
				<meta charset="utf-8"/>
				<title>Расписание:</title>
			</head>
			<body>
				<h1>Расписание:</h1>
				<table border="1">
					<tr>
						<th>День недели</th>
						<th>Время</th>
						<th>Название</th>
						<th>Аудитория</th>
						<th>Преподаватель</th>
					</tr>
					<xsl:apply-templates/>
				</table>
			</body>
		</html>
	</xsl:template>

</xsl:stylesheet> 
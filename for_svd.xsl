<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
  <xsl:output method="html" indent="yes"/>

  <xsl:template match="/">
    <html>
      <head>
        <title><xsl:value-of select="device/name"/></title>
		<style>
			h1,h2,h3,h4,h5{
				display:inline;
			}
		</style>
      </head>
      <body>
        <h1><xsl:value-of select="device/name"/></h1>
		<ol>
<!--ROOT-->
		<xsl:for-each select="device/*[not(name(.)='name')]">
			<xsl:choose>
<!--CPU-->
			<xsl:when test="name(.)='cpu'">
			<li>
			<h2><xsl:value-of select="name(.)"/>:
			<table>
			<xsl:for-each select="*">
				<tr><th><xsl:value-of select="name(.)"/></th><td><xsl:value-of select="."/></td></tr>
			</xsl:for-each>
			</table></h2>
			</li>
			</xsl:when>
<!--PHERIPHERALS-->
			<xsl:when test="name(.)='peripherals'">
			<li><h2><xsl:value-of select="name(.)"/>:</h2></li>
				<ol>
				<xsl:for-each select="*">	
					<li><h3><xsl:value-of select="./name"/>:</h3><xsl:value-of select="./description"/>				
				 <xsl:value-of select="name(@*[1])"/><xsl:value-of select="@*[1]"/>
					<!--OTHER ELEMENT EXCEPT NAME AND DESCRIPTION-->
					<ol>
					<xsl:for-each select="*[not(name(.)='name')][not(name(.)='description')]">
						<xsl:choose>
						<!--ADDRESS BLOCK-->
						<xsl:when test="name(.)='addressBlock'">
						<li><h4><xsl:value-of select="name(.)"/> : </h4>
							<xsl:for-each select="*">
								<xsl:value-of select="name(.)"/>=<xsl:value-of select="."/> |
							</xsl:for-each>
						</li>
						</xsl:when>
						<!--REGISTERS-->	
						<xsl:when test="name(.)='registers'">
						<li><h4><xsl:value-of select="name(.)"/> : </h4>
							<ol>
							<xsl:for-each select="*">
								<li>
								<h5><xsl:value-of select="name"/></h5>
								(displayName:<strong><xsl:value-of select="displayName"/></strong>) : <xsl:value-of select="description"/><strong> addressOffset: </strong><xsl:value-of select="addressOffset"/><strong> size:</strong><xsl:value-of select="size"/><strong> access: </strong><xsl:value-of select="access"/><strong> resetValue: </strong><xsl:value-of select="resetValue"/>
								
								<table>
								<caption><strong>Fields</strong></caption>
								<tr>
									<th>Name</th>
									<th>Description</th>
									<th>Bit Offset</th>
									<th>bit Width</th>
								</tr>
								<xsl:for-each select="fields/*">
								<!--FIELDS-->
									<tr>
										<td><xsl:value-of select="name"/></td>
										<td><xsl:value-of select="description"/></td>
										<td><xsl:value-of select="bitOffset"/></td>
										<td><xsl:value-of select="bitWidth"/></td>
									</tr>
								</xsl:for-each>
								</table>
							</li>
							</xsl:for-each>
							</ol>
						</li>

						</xsl:when>
						<!--INTERRUPT-->
						<xsl:when test="name(.)='interrupt'">
						<li><h4><xsl:value-of select="name(.)"/> : </h4>
							<strong><xsl:value-of select="name"/></strong>:<xsl:value-of select="description"/> <strong> value:</strong><xsl:value-of select="value"/>
						</li>

						</xsl:when>
						<!--OTHERWISE-->
						<xsl:otherwise>
						<li><h4><xsl:value-of select="name(.)"/> : <xsl:value-of select="."/></h4></li>
						</xsl:otherwise>		
		
						</xsl:choose>
					</xsl:for-each>		
					</ol>

				</li>
				</xsl:for-each>
				</ol>
			</xsl:when>


			<xsl:otherwise>
			<li><h2><xsl:value-of select="name(.)"/>:<xsl:value-of select="."/></h2></li>
			</xsl:otherwise>
			</xsl:choose>
			
		</xsl:for-each>
		</ol>
      </body>
    </html>
  </xsl:template>
<!--  
<xsl:template match="device/cpu/*">
	<table>
	<caption><xsl:value-of select="name(.)"/></caption>	
		<xsl:for-each select="device/cpu/*">
			<tr><th><xsl:value-of select="name(.)"/></th><td><xsl:value-of select="."/></td></tr>
		</xsl:for-each>
	</table>
</xsl:template>
-->
</xsl:stylesheet>

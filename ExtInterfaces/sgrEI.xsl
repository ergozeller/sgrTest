<?xml version="1.0" encoding="UTF-8"?>

<xsl:stylesheet version="1.0"
xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

<xsl:template match="/">
	<html>
	<head>
		<style>
		body { font-family: sans-serif; width: 900px; margin-right: auto; margin-left: auto; background-color:lightgray;}
		.document { background-color:white; padding:4em;}
		h1 { font-size: 1.55em; margin-bottom: 1.5em }
		h2 { font-size: 1.44em; margin-bottom: 0.2em; margin-top: 2em; }
		table { border-spacing: 0px; border-collapse: collapse; width:100%; }
		th { padding: 0.5em; text-align:left; border: 1px solid black; }
		td { padding: 0.5em; border: 1px solid black; vertical-align:text-top;}
		body:before{
			content: 'Work in Progress';
			position: fixed;
			top: -30%;
			bottom: 0;
			left: 0;
			right: 0;
						
			color: #0d745e;
			font-size: 60px;
			font-weight: 500px;
			display: grid;
			justify-content: center;
			align-content: center;
			opacity: 0.1;
			transform: rotate(-20deg);
		  }
		</style>
	</head>
	<body>
		<div class="document">
			<div class="profileheader">
				<div style="display:inline-block">
					<img src="https://smartgridready.ch/media/images/Logos/SGR_LOGO_REDESIGN_RGB.svg" width="240" height="134" />
				</div>
				<div style="display:inline-block; text-align:right; width:100%">Device Profil</div>
			</div>
			<xsl:for-each select="*/*[local-name()='deviceProfile']">
			<h2><xsl:value-of select="/*/@manufacturerName"/> - <xsl:value-of select="/*/@deviceName"/></h2>
			<table style="width:100%">
				<colgroup>
					<col style="width:20%"/>
				</colgroup>

				<!-- devNameList (1x opt) -->

				<!-- devLegibDesc (4x opt) -->
				<xsl:for-each select="*[local-name()='devLegibDesc']">
				<tr><td><xsl:value-of select="*[local-name()='language']"/></td><td><xsl:value-of select="*[local-name()='textElement']"/></td></tr>
				</xsl:for-each>

				<!-- Transport Service -->
				<tr><td>Transport Service</td><td><xsl:value-of select="*[local-name()='transportService']"/></td></tr>
				
				<!-- Device Kind -->
				<tr><td>Device Typ</td><td><xsl:value-of select="*[local-name()='deviceKind']"/></td></tr>
				
				<!-- serialNumber (1x opt)-->
				<xsl:if test="*[local-name()='serialNumber']">
					<tr><td>Seriennr.</td><td><xsl:value-of select="*[local-name()='serialNumber']"/></td></tr>
				</xsl:if>

				<!-- softwareRevision -->
				<tr><td>Software Rev.</td><td><xsl:value-of select="*[local-name()='primaryVersionNumber']"/>.<xsl:value-of select="*[local-name()='secondaryVersionNumber']"/>.<xsl:value-of select="*[local-name()='subReleaseVersionNumber']"/></td></tr>
				
				<!-- hardwareRevision (1x opt)-->
				<xsl:for-each select="*[local-name()='hardwareRevision']">
					<tr><td>Hardware Rev.</td><td><xsl:value-of select="*[local-name()='primaryVersionNumber']"/>.<xsl:value-of select="*[local-name()='secondaryVersionNumber']"/>.<xsl:value-of select="*[local-name()='subReleaseVersionNumber']"/></td></tr>
				</xsl:for-each>

				<!-- brandName -->
				<xsl:if test="*[local-name()='brandName']">
					<tr><td>Brand</td><td><xsl:value-of select="*[local-name()='brandName']"/></td></tr>
				</xsl:if>

				<!-- powerSource (1x opt) -->
				<xsl:if test="*[local-name()='powerSource']">
					<tr><td>Versorgung</td><td><xsl:value-of select="*[local-name()='powerSource']"/></td></tr>
				</xsl:if>

				<!-- nominalPower (1x opt) -->
				<xsl:if test="*[local-name()='nominalPower']">
					<tr><td>Verbrauchsleistung</td><td><xsl:value-of select="*[local-name()='nominalPower']"/></td></tr>
				</xsl:if>

				<!-- manufSpecIdent (1x opt) -->
				<xsl:if test="*[local-name()='manufSpecIdent']">
					<tr><td>Hersteller ID</td><td><xsl:value-of select="*[local-name()='manufSpecIdent']"/></td></tr>
				</xsl:if>

				<!-- manufacturerLabel (1x opt) -->
				<xsl:if test="*[local-name()='manufacturerLabel']">
					<tr><td>Hersteller Nummer</td><td><xsl:value-of select="*[local-name()='manufacturerLabel']"/></td></tr>
				</xsl:if>
				
				<!-- remAuthorID (1x opt) -->
				<xsl:if test="*[local-name()='remAuthorID']">
					<tr><td>Author</td><td><xsl:value-of select="*[local-name()='remAuthorID']"/></td></tr>
				</xsl:if>
				
				<!-- devLevelofOperation (1x opt) -->
				<xsl:if test="*[local-name()='devLevelofOperation']">
					<tr><td>SGr Level</td><td><xsl:value-of select="*[local-name()='devLevelofOperation']"/></td></tr>
				</xsl:if>

										
			</table>
			</xsl:for-each>
			<xsl:for-each select="*/*[local-name()='fpListElement']">
			<h2>Funktionsprofil</h2>
			<table>
				<colgroup>
					<col style="width:10%"/>
					<col style="width:20%"/>
					<col style="width:20%"/>
					<col style="width:10%"/>
					<col style="width:20%"/>
					<col style="width:10%"/>
					<col style="width:10%"/>
				</colgroup>			
				<tr>
					<td colspan="2">Profil-ID (t.b.d)</td>
					<td  colspan="3"><xsl:value-of select="*[local-name()='functionalProfile']/@profileName"/></td>
					<th>FP-attr:</th>
					<td>t.b.d.</td>
				</tr>
				<tr>
					<td  colspan="7">eque porro quisquam est qui dolorem ipsum quia dolor sit amet, consectetur, adipisci velit...</td>
				</tr>
				<tr>
					<th>Ind./attr.</th>
					<th>Datenpunkt</th>
					<th>Beschreibung</th>
					<th>Typ</th>
					<th>Einh.</th>
					<th>MRO</th>
					<th>RWP</th>
				</tr>
				<xsl:for-each select="*[local-name()='dpListElement']">
				<tr>
					<td>(t.b.d)</td>
					<td><xsl:value-of select="*[local-name()='dataPoint']/@datapointName"/></td>
					<td>(t.b.d)</td>
					<td>(t.b.d)</td>
					<td><xsl:value-of select="*[local-name()='dataPoint']/@unit"/></td>
					<td><xsl:value-of select="*[local-name()='dataPoint']/@mroVisibilityIndicator"/></td>
					<td><xsl:value-of select="*[local-name()='dataPoint']/@rwpDatadirection"/></td>
				</tr>
				</xsl:for-each>
			</table>
			</xsl:for-each>
		</div>
	</body>
	</html>
</xsl:template>

</xsl:stylesheet>
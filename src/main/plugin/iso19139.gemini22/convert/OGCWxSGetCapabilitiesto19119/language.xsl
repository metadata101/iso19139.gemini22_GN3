<?xml version="1.0" encoding="UTF-8"?>

<xsl:stylesheet version="2.0"
	xmlns="http://www.isotc211.org/2005/gmd" xmlns:gco="http://www.isotc211.org/2005/gco"
	xmlns:gts="http://www.isotc211.org/2005/gts" xmlns:gml="http://www.opengis.net/gml"
	xmlns:srv="http://www.isotc211.org/2005/srv" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"
	xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:wfs="http://www.opengis.net/wfs"
	xmlns:wms="http://www.opengis.net/wms"
	xmlns:ows="http://www.opengis.net/ows" xmlns:wcs="http://www.opengis.net/wcs"
	xmlns:inspire_common="http://inspire.ec.europa.eu/schemas/common/1.0"
	xmlns:inspire_vs="http://inspire.ec.europa.eu/schemas/inspire_vs/1.0"
	xmlns:xlink="http://www.w3.org/1999/xlink" extension-element-prefixes="wcs ows wfs srv">
	<xsl:template name="language">
		<xsl:param name="lang"/>
		<xsl:choose>
			<xsl:when
				test="//inspire_vs:ExtendedCapabilities/inspire_common:ResponseLanguage/inspire_common:Language">
				<language>
					<gco:CharacterString>
						<xsl:value-of
							select="//inspire_vs:ExtendedCapabilities/inspire_common:ResponseLanguage/inspire_common:Language"
						/>
					</gco:CharacterString>
				</language>

			</xsl:when>

			<xsl:when test="$lang">
				<language>
					<gco:CharacterString>

						<xsl:value-of select="$lang"/>
					</gco:CharacterString>
				</language>
			</xsl:when>
			<xsl:otherwise>
				<language gco:nilReason="missing"/>
			</xsl:otherwise>
		</xsl:choose>
	</xsl:template>
</xsl:stylesheet>
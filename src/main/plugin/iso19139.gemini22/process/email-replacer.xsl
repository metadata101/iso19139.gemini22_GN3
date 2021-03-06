<?xml version="1.0" encoding="UTF-8"?>
<!--
  ~ Copyright (C) 2001-2016 Food and Agriculture Organization of the
  ~ United Nations (FAO-UN), United Nations World Food Programme (WFP)
  ~ and United Nations Environment Programme (UNEP)
  ~
  ~ This program is free software; you can redistribute it and/or modify
  ~ it under the terms of the GNU General Public License as published by
  ~ the Free Software Foundation; either version 2 of the License, or (at
  ~ your option) any later version.
  ~
  ~ This program is distributed in the hope that it will be useful, but
  ~ WITHOUT ANY WARRANTY; without even the implied warranty of
  ~ MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the GNU
  ~ General Public License for more details.
  ~
  ~ You should have received a copy of the GNU General Public License
  ~ along with this program; if not, write to the Free Software
  ~ Foundation, Inc., 51 Franklin St, Fifth Floor, Boston, MA 02110-1301, USA
  ~
  ~ Contact: Jeroen Ticheler - FAO - Viale delle Terme di Caracalla 2,
  ~ Rome - Italy. email: geonetwork@osgeo.org
  -->

<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:saxon="http://saxon.sf.net/"
                xmlns:geonet="http://www.fao.org/geonetwork"
                xmlns:gco="http://www.isotc211.org/2005/gco"
                xmlns:gmd="http://www.isotc211.org/2005/gmd" version="2.0"
                extension-element-prefixes="saxon"
                exclude-result-prefixes="#all">


  <!-- Search for all contacts with a defined email and
    replace with a new email. -->

  <!-- The old contact email to search for -->
  <xsl:param name="oldEmail"/>

  <!-- The email to replace it with -->
  <xsl:param name="newEmail"/>

  <!-- Do a copy of all nodes and attributes -->
  <xsl:template match="@*|node()">
    <xsl:copy>
      <xsl:apply-templates select="@*|node()"/>
    </xsl:copy>
  </xsl:template>

  <!-- Remove geonet:* elements. -->
  <xsl:template match="geonet:*" priority="2"/>


  <xsl:template match="//gmd:electronicMailAddress">
    <xsl:variable name="curEmail">
      <xsl:value-of select="./gco:CharacterString"/>
    </xsl:variable>
    <xsl:choose>
    <xsl:when test="lower-case($curEmail) = lower-case($oldEmail)">
      <xsl:message>=====Match=====</xsl:message>
      <gmd:electronicMailAddress>
      <gco:CharacterString><xsl:value-of select="$newEmail"/></gco:CharacterString>
      </gmd:electronicMailAddress>
    </xsl:when>
      <xsl:when test="not(lower-case($curEmail) = lower-case($oldEmail))">
        <xsl:message>=====No match=====</xsl:message>
        <gmd:electronicMailAddress>
        <gco:CharacterString><xsl:value-of select="$curEmail"/></gco:CharacterString>
        </gmd:electronicMailAddress>
      </xsl:when>
    </xsl:choose>
  </xsl:template>

</xsl:stylesheet>

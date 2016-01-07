<?xml version="1.0" encoding="UTF-8"?>
<xsl:transform xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.1" xmlns="http://www.tei-c.org/ns/1.0" xmlns:tei="http://www.tei-c.org/ns/1.0" exclude-result-prefixes="tei">
  <xsl:strip-space elements="tei:TEI tei:TEI.2 tei:body tei:castList tei:div tei:div1 tei:div2  tei:docDate tei:docImprint tei:docTitle tei:fileDesc tei:front tei:group tei:index tei:listWit tei:p tei:publicationStmp tei:publicationStmt tei:sourceDesc tei:SourceDesc tei:sources tei:sp tei:text tei:teiHeader tei:text tei:titleStmt"/>
  <xsl:output method="xml" encoding="UTF-8" indent="yes"/>
  <xsl:variable name="who1">ABCDEFGHIJKLMNOPQRSTUVWXYZÀÁÂÃÄÅÇÈÉÊËÌÍÎÏÑÒÓÔÕÖÙÚÛÜÝàáâãäåçèéêëìíîïñòóôõöùúûüý’' </xsl:variable>
  <xsl:variable name="who2">abcdefghijklmnopqrstuvwxyzaaaaaaceeeeiiiinooooouuuuyaaaaaaceeeeiiiinooooouuuuy---</xsl:variable>
  <xsl:variable name="ABC">ABCDEFGHIJKLMNOPQRSTUVWXYZÀÁÂÃÄÅÇÈÉÊËÌÍÎÏÑÒÓÔÕÖÙÚÛÜÝ.</xsl:variable>
  <xsl:variable name="abc">abcdefghijklmnopqrstuvwxyzàáâãäåçèéêëìíîïñòóôõöùúûüý</xsl:variable>
  <xsl:template match="node()|@*">
    <xsl:copy>
      <xsl:apply-templates select="@*|node()"/>
    </xsl:copy>
  </xsl:template>
  <xsl:template match="tei:role[not(@rend)]">
    <xsl:variable name="rend">
      <xsl:if test="@civil='M'"> male</xsl:if>
      <xsl:if test="@civil='F'"> female</xsl:if>
      <xsl:if test="@age='J'"> junior</xsl:if>
      <xsl:if test="@age='V'"> veteran</xsl:if>
    </xsl:variable>
    <xsl:copy>
      <xsl:attribute name="xml:id">
        <xsl:value-of select="translate(., $who1, $who2)"/>
      </xsl:attribute>
      <xsl:copy-of select="@xml:id"/>
      <xsl:if test="normalize-space($rend) != ''">
        <xsl:attribute name="rend">
          <xsl:value-of select="normalize-space($rend)"/>
        </xsl:attribute>
      </xsl:if>
      <xsl:choose>
        <!-- Rôle en minuscules ou petites caps -->
        <xsl:when test="not(*)">
          <xsl:value-of select="substring(., 1, 1)"/>
          <xsl:value-of select="translate(substring(., 2), $ABC, $abc)"/>
        </xsl:when>
        <xsl:otherwise>
          <xsl:apply-templates/>
        </xsl:otherwise>
      </xsl:choose>
    </xsl:copy>
  </xsl:template>
  <xsl:template match="@who">
    <xsl:attribute name="who">
      <xsl:value-of select="translate(., $who1, $who2)"/>
    </xsl:attribute>
  </xsl:template>
  <xsl:template match="tei:p/@type[.='p']"/>
  <xsl:template match="tei:front//tei:p[@type='v']">
    <l>
      <xsl:apply-templates/>
    </l>
  </xsl:template>
  <xsl:template match="tei:apostrophe | tei:front/tei:argument | tei:dedicace | tei:examen | tei:preface ">
    <div type="{local-name()}">
      <xsl:apply-templates/>
    </div>
  </xsl:template>
  <xsl:template match="tei:signature">
    <signed>
      <xsl:apply-templates/>
    </signed>
  </xsl:template>
  <xsl:template match="tei:adresse">
    <salute>
      <xsl:apply-templates/>
    </salute>
  </xsl:template>
</xsl:transform>

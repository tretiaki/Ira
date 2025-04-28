<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0"
                xmlns="http://example.com/company">
  <xsl:output method="text" indent="yes"/>

  <xsl:template match="/">
{
  "members": [
    <xsl:for-each select="//member">
      <xsl:sort select="@id"/>
      {
        "id": "<xsl:value-of select="@id"/>",
        "name": "<xsl:value-of select="memberName"/>",
        <xsl:choose>
          <xsl:when test="role='Manager'">
            "role": "<xsl:value-of select="role"/>",
            "priority": <xsl:value-of select="project/@priority"/>
          </xsl:when>
          <xsl:otherwise>
            "role": "<xsl:value-of select="role"/>"
          </xsl:otherwise>
        </xsl:choose>
        <xsl:if test="salary">
          , "salary": <xsl:value-of select="salary"/>
        </xsl:if>
      }<xsl:if test="position() != last()">,</xsl:if>
    </xsl:for-each>
  ]
}
  </xsl:template>
</xsl:stylesheet>
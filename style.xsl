<?xml version="1.0"?>

<xsl:stylesheet version="1.0"
xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

<xsl:template match="/">
  <html>
  <body>
    <h2>Lettres du courrier</h2>
    <table border="1">
      <tr bgcolor="#9acd32">
        <th>Emetteur</th>
        <th>Recepteur</th>
        <th>objet</th>
        <th>Date</th>
      </tr>
      <xsl:for-each select="courrier/letter">
        <tr>
          <td><xsl:value-of select="emetteur"/></td>
          <td><xsl:value-of select="recepteur"/></td>
          <td><xsl:value-of select="objet"/></td>
          <td>
          <xsl:value-of select="date/jour"/>/
          <!-- <xsl:value-of select="date/mois"> -->
          <xsl:variable name="mois" select="date/mois" />

          <xsl:choose>
            <xsl:when test="$mois = 'janvier'">01</xsl:when>
            <xsl:when test="$mois = 'Mars'">03</xsl:when>
            
            <xsl:otherwise>error: <xsl:value-of select="$mois"/></xsl:otherwise>
        </xsl:choose>
          /
          <xsl:value-of select="date/annee"/>
          </td>

        </tr>
      </xsl:for-each>
    </table>
  </body>
  </html>
</xsl:template>

</xsl:stylesheet>
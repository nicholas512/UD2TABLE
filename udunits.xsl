<?xml version="1.0" encoding="utf-8"?>

<xsl:stylesheet version="1.0"
  xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

  <xsl:template match="/unit-system/prefix">
  <p>nope</p>
  </xsl:template>

  <xsl:template match="/">
    <html>
    <title>UDUNITS2</title>
<link rel="stylesheet" href="udunits.css" />
<link rel="stylesheet" href="custom.css" />

    <body>
      <h1>UDUNITS2 XML Database</h1>
      <p>These data are from the <a href="https://www.unidata.ucar.edu/software/udunits/">UDUNITS2</a> software. See copyright statement below.</p>

      <button onclick="goBack()">Go Back</button>

      <script>
      function goBack() {
        window.history.back();
      }
      </script>
           


      <table border="1">
        <tr class="tableheading" bgcolor="#07778f">
          <th>Unit</th>
          <th>Alias</th>
          <th>Symbol</th>
          <th>Def</th>
          <th>Definition</th>
        </tr>
        <xsl:for-each select="unit-system">
        <xsl:for-each select="unit">
          <tr class="tablerow" style="text-align:center;">
            <td>  <!-- Name -->
              <div>
              <p><xsl:value-of select = "name/singular" /></p>
              <p><xsl:value-of select = "name/plural" /></p>
              </div>
              
            </td>
            <td>  <!-- Alias -->
              <div>
              <xsl:for-each select="aliases/name">
                <p><xsl:value-of select = "singular" /></p>
              </xsl:for-each> 
              </div>
            </td>           
            <td>  <!-- Symbol -->
              <xsl:for-each select=".//symbol">
                <xsl:choose>
                  <xsl:when test="./@comment">
                    <div class="tooltip"><xsl:value-of select = "." />
                      <span class="tooltiptext"><xsl:value-of select = "./@comment" /></span>
                    </div>
                  </xsl:when>
                  <xsl:otherwise>
                    <p><xsl:value-of select = "." /></p>
                  </xsl:otherwise>
                </xsl:choose>
              </xsl:for-each> 
            </td>
            <td>  <!-- Def -->
              <xsl:value-of select = "def" />
            </td>
            <td>  <!-- Definition -->
              <p style="text-align:left;">
                <xsl:value-of select = "definition" />
              </p>
            </td>
          </tr>
        </xsl:for-each>
      </xsl:for-each>
      </table>
      <p></p>
    </body>
    <embed type="text/html" src="License.html" width="800" height="200"></embed>
    </html>
  </xsl:template>
</xsl:stylesheet>
<?xml version="1.0" encoding="utf-8"?>

<xsl:stylesheet version="1.0"
  xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

  <xsl:template match="/unit-system/prefix" priority="4.0">
  <html>
    <title>UDUNITS2</title>
      <body>
        <p>nope</p>
      </body>
  </html>
  </xsl:template>


  <xsl:template match="/">
  <html>
  <title>UDUNITS2</title>
<link rel="stylesheet" href="udunits.css" />
<link rel="stylesheet" href="custom.css" />

  <body>
    <h1>UDUNITS2 XML Database</h1>
    <p>These data are from version the <a href="https://www.unidata.ucar.edu/software/udunits/">UDUNITS2</a> software. See copyright statement below.</p>

    <button onclick="goBack()">Go Back</button>

    <script>
    function goBack() {
      window.history.back();
    }
    </script>
    
    <div>
    <xsl:apply-templates select="unit-system" />
    </div>

  </body>
  <embed type="text/html" src="License.html" width="800" height="200"></embed>
  </html>
</xsl:template>

<xsl:template match="unit-system[prefix]">
  <table border="1">
    <tr class="tableheading" bgcolor="#07778f">
      <th>Name</th>
      <th>Symbol</th>
      <th>Value</th>
    </tr>
    <xsl:for-each select="prefix">
      <tr class="tablerow" style="text-align:center;">
      <td>  <!-- Name -->
        <div>
          <xsl:for-each select="./name">
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
        </div>
      </td>

      <td>  <!-- Symbol -->
        <div>
        <xsl:for-each select=".//symbol">
          <xsl:choose>
            <xsl:when test="./@comment">
            <p>
              <div class="tooltip">
                  <xsl:value-of select = "." />
                <span class="tooltiptext"><xsl:value-of select = "./@comment" /></span>
              </div>
            </p>
            </xsl:when>
            <xsl:otherwise>
                <p><xsl:value-of select = "." /></p>
            </xsl:otherwise>
          </xsl:choose>
        </xsl:for-each> 
       </div>
      </td>

      <td>  <!-- Value -->
        <div>
        <xsl:for-each select=".//value">
          <xsl:choose>
            <xsl:when test="./@comment">
            <p>
              <div class="tooltip">
                  <xsl:value-of select = "." />
                <span class="tooltiptext"><xsl:value-of select = "./@comment" /></span>
              </div>
            </p>
            </xsl:when>
            <xsl:otherwise>
                <p><xsl:value-of select = "." /></p>
            </xsl:otherwise>
          </xsl:choose>
        </xsl:for-each> 
       </div>
      </td>
    </tr>
    </xsl:for-each>
  </table>

</xsl:template>



<xsl:template match="unit-system[unit]">
<table border="1">
  <tr class="tableheading" bgcolor="#07778f">
    <th></th>
    <th>Name</th>
    <th>Alias</th>
    <th>Symbol</th>
    <th>Def</th>
    <th>Definition</th>
  </tr>
  <xsl:for-each select="unit">
    <tr class="tablerow" style="text-align:center;">
      <td>  <!-- Comment -->
        <xsl:for-each select="comment">
          <div class="tooltip">C
            <span class="tooltiptext"><xsl:value-of select = "." /></span>
          </div>
        </xsl:for-each> 
      </td>
      <td>  <!-- Name -->
        <div>
          <xsl:for-each select="./name/singular | ./name/plural">
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
        </div>
      </td>
      <td>  <!-- Alias -->
        <div>
          <xsl:for-each select="aliases/name/singular | aliases/name/plural">
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
        </div>
      </td>           
      <td>  <!-- Symbol -->
        <div>
        <xsl:for-each select=".//symbol">
          <xsl:choose>
            <xsl:when test="./@comment">
            <p>
              <div class="tooltip">
                  <xsl:value-of select = "." />
                <span class="tooltiptext"><xsl:value-of select = "./@comment" /></span>
              </div>
            </p>
            </xsl:when>
            <xsl:otherwise>
                <p><xsl:value-of select = "." /></p>
            </xsl:otherwise>
          </xsl:choose>
        </xsl:for-each> 
       </div>
      </td>
      <td>  <!-- Def -->
        <xsl:value-of select = "def" />
      </td>
      <td class="longtext">  <!-- Definition -->
        <p>
          <xsl:value-of select = "definition" />
        </p>
      </td>
    </tr>
  </xsl:for-each>
</table>
</xsl:template>

</xsl:stylesheet>

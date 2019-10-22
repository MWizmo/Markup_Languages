<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:msxsl="urn:schemas-microsoft-com:xslt" exclude-result-prefixes="msxsl">
  <xsl:template match="curriculum_vitae">
    <html>
      <head>
        <title>Curriculum vitae</title>
        <meta charset="utf-8"/>
        <link rel="stylesheet" type="text/css" href="style.css"/>
      </head>
      <body>
        <xsl:apply-templates select="header"/>
        <xsl:apply-templates select="content"/>      
      </body>
    </html>
  </xsl:template>

  <xsl:template match="header">
    <xsl:apply-templates select="about_contact"/>
    <xsl:apply-templates select="about"/>
    <xsl:apply-templates select="about_contact/name"/>
    <xsl:apply-templates select="photo"/>
  </xsl:template>

  <xsl:template match="about_contact">
    <div class="center_flex">
      <p><xsl:value-of select="city" /> &#8194; </p>&#8226;
      <p>&#8194;<xsl:value-of select="phone"/>&#8194;</p>&#8226;
      <p>&#8194;<a><xsl:attribute name="href">mailto:<xsl:value-of select="email"/></xsl:attribute><xsl:value-of select="email"/></a>&#8194;</p>&#8226;
      <p>&#8194;<a><xsl:attribute name="href">http://<xsl:value-of select="website"/></xsl:attribute><xsl:value-of select="website"/></a></p>
    </div>
  </xsl:template>

  <xsl:template match="about">
    <div class="center_grey_flex">
      <p><xsl:value-of select="birthday"/>, <xsl:value-of select="city"/>&#8194;</p>&#8226;
      <p>&#8194;<xsl:apply-templates select="gender"/>&#8194;</p>&#8226;
      <p>&#8194;<xsl:apply-templates select="status"/>&#8194;</p>
    </div>
  </xsl:template>

  <xsl:template match="gender">
    <xsl:value-of select="@type"/>
  </xsl:template>

  <xsl:template match="status">
    <xsl:value-of select="@type"/>
  </xsl:template>

  <xsl:template match="name">
    <h1><xsl:value-of select="first_name"/>&#8194;<xsl:value-of select="last_name"/></h1>
  </xsl:template>

  <xsl:template match="photo">
    <img><xsl:attribute name="src"><xsl:value-of select="@src"/></xsl:attribute><xsl:attribute name="alt"><xsl:value-of select="@alt"/></xsl:attribute></img>
  </xsl:template>

  <xsl:template match="content">
    <xsl:apply-templates select="goal_section"/>
    <xsl:apply-templates select="edu_section"/>
    <xsl:apply-templates select="skill_section"/>
    <xsl:apply-templates select="prof_section"/>
    <xsl:apply-templates select="awards_section"/>
    <xsl:apply-templates select="lang_section"/>
    <xsl:apply-templates select="interests_section"/>
  </xsl:template>

  <xsl:template match="goal_section">
    <div class="topic">
      <xsl:value-of select="title"/>
    </div>
    <div class="content">
      <p class="text"><xsl:apply-templates select="goal"/></p>
  </div>
  </xsl:template>

  <xsl:template match="goal">
    <xsl:value-of select="position"/>, <xsl:value-of select="fee"/>
  </xsl:template>

  <xsl:template match="edu_section">
    <div class="topic">
      <xsl:value-of select="title"/>
    </div>
    <div class="content">
      <xsl:for-each select="education">
        <div class="flex">
          <p class="text"><xsl:apply-templates select="years"/></p>
          <p class="text"><xsl:value-of select="grade"/></p>
          <p class="text"><xsl:apply-templates select="univercity"/></p>
          <p class="text"><xsl:apply-templates select="avg_mark"/></p>
        </div>
      </xsl:for-each>
  </div>
  </xsl:template>

  <xsl:template match="years">
    <xsl:value-of select="from_year"/>-<xsl:value-of select="to_year"/>
  </xsl:template>

  <xsl:template match="univercity">
    <xsl:value-of select="city"/>, <xsl:value-of select="univercity_title"/>
  </xsl:template>

  <xsl:template match="avg_mark">
    Grade Point Average: <b><xsl:value-of select="@type"/></b>
  </xsl:template>

  <xsl:template match="skill_section">
    <div class="topic">
      <xsl:value-of select="title"/>
    </div>
    <div class="content">
      <xsl:for-each select="subsection">
          <div class='block'>
            <h2><xsl:value-of select="subtitle"/></h2>
            <ul>
              <xsl:for-each select="element">
                <li class="text"><xsl:value-of select="."/></li>
              </xsl:for-each>
            </ul>
          </div>
      </xsl:for-each>
    </div>
  </xsl:template>

  <xsl:template match="prof_section">
    <div class="topic"><xsl:value-of select="title"/></div>
    <div class="content">
      <xsl:for-each select="job">
        <div class="flex">
          <p class="text"><xsl:apply-templates select="years"/></p>
          <p class="text"><xsl:value-of select="position"/></p>
          <p class="text"><xsl:value-of select="company"/></p>
        </div>
      </xsl:for-each>
    </div>
  </xsl:template>

  <xsl:template match="awards_section">
    <div class="topic"><xsl:value-of select="title"/></div>
    <div class="content">
      <xsl:choose>
         <xsl:when test="count(award) > 0">
           <xsl:for-each select="award">
                <p class="text"><xsl:value-of select="."/></p>
              </xsl:for-each>
         </xsl:when>
         <xsl:otherwise>
          <p class="text">No awards</p>
         </xsl:otherwise>
       </xsl:choose>
    </div>
  </xsl:template>

  <xsl:template match="lang_section">
    <div class="topic"><xsl:value-of select="title"/></div>
    <div class="content">
      <ul>
        <xsl:for-each select="language">
          <li class="text"><xsl:value-of select="."/> (<xsl:value-of select="@level"/>)</li>
        </xsl:for-each>
      </ul>
    </div>
  </xsl:template>

<xsl:template match="interests_section">
  <div class="topic"><xsl:value-of select="title"/></div>
    <div class="content">
      <ul>
        <xsl:for-each select="interest">
          <li class="text"><xsl:value-of select="."/></li>
        </xsl:for-each>
      </ul>
    </div>
</xsl:template>

     
</xsl:stylesheet>
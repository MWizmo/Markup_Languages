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
      <p>&#8194;<xsl:value-of select="email"/>&#8194;</p>&#8226;
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
      <svg xmlns="http://www.w3.org/2000/svg">
        <defs>
          <marker id="arrow" marker-width="10" refX="0" refY="1.5" orient="auto">
            <polygon points="0,0 0,3 1.5,1.5" />
          </marker>
        </defs>
        <xsl:for-each select="education">
          <xsl:variable name="start" select="years/from_year"/>
          <xsl:variable name="end" select="years/to_year"/>
          <circle r="{(($end - $start) div 2)*13.2}%" cx="{(10 - (2022-(($end + $start)div 2)))*10}%" cy="7cm" fill="red" fill-opacity="0.7" stroke="black"/>
        </xsl:for-each>

        <text x="50%" y="0.5cm" class="text_title">Education</text>
        <rect width="100%" height="100%" x="0" y="7cm" rx="0" ry="0" fill="#f2f4f4" />
        <line x1="0" y1="7cm" x2="95%" y2="7cm" stroke="black" stroke-width="3" marker-end="url(#arrow)"/>
        <rect width="100%" height="10cm" x="0.01" y="0.01" fill="transparent" stroke="black"/>
        <line x1="1.5" y1="7.2cm" x2="1.5" y2="6.8cm" stroke="black" stroke-width="3" />
        <text x="1.5" y="7.5cm">2012</text>
        <line x1="10%" y1="7.2cm" x2="10%" y2="6.8cm" stroke="black" stroke-width="3" />
        <text x="10%" y="7.5cm">2013</text>
        <line x1="20%" y1="7.2cm" x2="20%" y2="6.8cm" stroke="black" stroke-width="3" />
        <text x="20%" y="7.5cm">2014</text>
        <line x1="30%" y1="7.2cm" x2="30%" y2="6.8cm" stroke="black" stroke-width="3" />
        <text x="30%" y="7.5cm">2015</text>
        <line x1="40%" y1="7.2cm" x2="40%" y2="6.8cm" stroke="black" stroke-width="3" />
        <text x="40%" y="7.5cm">2016</text>
        <line x1="50%" y1="7.2cm" x2="50%" y2="6.8cm" stroke="black" stroke-width="3" />
        <text x="50%" y="7.5cm">2017</text>
        <line x1="60%" y1="7.2cm" x2="60%" y2="6.8cm" stroke="black" stroke-width="3" />
        <text x="60%" y="7.5cm">2018</text>
        <line x1="70%" y1="7.2cm" x2="70%" y2="6.8cm" stroke="black" stroke-width="3" />
        <text x="70%" y="7.5cm">2019</text>
        <line x1="80%" y1="7.2cm" x2="80%" y2="6.8cm" stroke="black" stroke-width="3" />
        <text x="80%" y="7.5cm">2020</text>
        <line x1="90%" y1="7.2cm" x2="90%" y2="6.8cm" stroke="black" stroke-width="3" />
        <text x="90%" y="7.5cm">2021</text>
        <xsl:for-each select="education">
          <xsl:variable name="univercity" select="univercity"/>
          <rect x="5%" y="8.5cm" width="20px" height="20px" fill="red" stroke="black"/>
          <text x="8%" y="8.85cm">SUSU</text>
        </xsl:for-each>
    </svg>
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
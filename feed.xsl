<?xml version="1.0" encoding="UTF-8"?>
<!-- Browser presentation for feed.xml. Feed readers ignore this file; it only makes the
     raw feed readable when a person clicks the RSS link. House palette matches the
     library landing (research/site/index.html). Pushed with every landing push. -->
<xsl:stylesheet version="1.0"
  xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
  xmlns:atom="http://www.w3.org/2005/Atom"
  exclude-result-prefixes="atom">
<xsl:output method="html" encoding="UTF-8" indent="yes" doctype-system="about:legacy-compat"/>

<xsl:template match="/">
<html lang="en">
<head>
<meta charset="utf-8"/>
<meta name="viewport" content="width=device-width,initial-scale=1"/>
<meta name="robots" content="noindex"/>
<title><xsl:value-of select="/rss/channel/title"/> — RSS feed</title>
<style>
@import url('https://fonts.googleapis.com/css2?family=EB+Garamond:ital,wght@0,400;0,500;0,600;1,400&amp;family=Inter:wght@400;500;600&amp;display=swap');
:root{--gold:#C9A24B;--antique:#8A6D2B;--ink:#111113;--ivory:#F6F3EC;--warm:#9A958A;--ash:#E2DCCE;--serif:"EB Garamond",Georgia,serif;--sans:"Inter","Helvetica Neue",Arial,sans-serif;}
*{box-sizing:border-box;}
body{background:var(--ivory);color:var(--ink);font-family:var(--sans);font-size:16px;line-height:1.5;margin:0;padding:0;}
main{max-width:820px;margin:0 auto;padding:40px 24px 64px;}
a{color:var(--antique);text-decoration:none;border-bottom:1px solid var(--ash);}
a:hover{color:var(--gold);border-color:var(--gold);}
.brand{font-family:var(--serif);font-size:1.15rem;letter-spacing:.02em;color:var(--ink);}
.brand b{color:var(--gold);font-weight:600;}
h1{font-family:var(--serif);font-weight:500;font-size:2rem;margin:.6rem 0 .2rem;}
.sub{color:var(--warm);font-size:.9rem;margin:0 0 1.6rem;}
.how{border:1px solid var(--ash);border-left:3px solid var(--gold);background:#fff;padding:14px 18px;margin:0 0 2rem;font-size:.92rem;}
.how p{margin:0 0 .5rem;}
.how p:last-child{margin:0;}
.url{font-family:ui-monospace,Menlo,Consolas,monospace;font-size:.86rem;background:var(--ivory);border:1px solid var(--ash);padding:6px 10px;display:inline-block;word-break:break-all;}
.item{border-top:1px solid var(--ash);padding:18px 0;}
.k{display:block;font-size:.72rem;letter-spacing:.12em;text-transform:uppercase;color:var(--warm);margin-bottom:.35rem;}
h2{font-family:var(--serif);font-weight:500;font-size:1.35rem;margin:0 0 .4rem;line-height:1.25;}
h2 a{color:var(--ink);border:0;}
h2 a:hover{color:var(--antique);}
.item p{margin:0 0 .6rem;color:#2A2A2E;}
.links{font-size:.84rem;}
.links .sep{color:var(--ash);margin:0 .5em;}
footer{margin-top:2.5rem;font-size:.78rem;color:var(--warm);border-top:1px solid var(--ash);padding-top:1rem;}
</style>
</head>
<body>
<main>
  <div class="brand">TON<b>618</b> Capital</div>
  <h1>Research feed</h1>
  <p class="sub">
    <xsl:value-of select="count(/rss/channel/item)"/> notes · updated
    <xsl:value-of select="substring(/rss/channel/lastBuildDate,1,16)"/>
  </p>

  <div class="how">
    <p><strong>This is an RSS feed.</strong> It is meant for a feed reader, not a browser. Copy the address below into Feedly, NetNewsWire, Inoreader, or any reader, and every new note will arrive there the day it publishes, with the PDF attached.</p>
    <p><span class="url"><xsl:value-of select="/rss/channel/atom:link[@rel='self']/@href"/></span></p>
    <p>Prefer the site? <a href="{/rss/channel/link}">Browse the research library</a>.</p>
  </div>

  <xsl:for-each select="/rss/channel/item">
    <article class="item">
      <span class="k">
        <xsl:value-of select="category"/>
        <xsl:if test="pubDate"> · <xsl:value-of select="substring(pubDate,6,11)"/></xsl:if>
      </span>
      <h2><a href="{link}"><xsl:value-of select="title"/></a></h2>
      <p><xsl:value-of select="description"/></p>
      <span class="links">
        <a href="{link}">Read the note →</a>
        <xsl:if test="enclosure">
          <span class="sep">·</span><a href="{enclosure/@url}">PDF</a>
        </xsl:if>
      </span>
    </article>
  </xsl:for-each>

  <footer>TON618 Capital · <a href="{/rss/channel/link}">ton618capital.com/ton618-research</a> · Research is published for information only; see the disclosures on every note.</footer>
</main>
</body>
</html>
</xsl:template>
</xsl:stylesheet>

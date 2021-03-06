<?xml version='1.0'?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">

  <!-- Include other stylesheets -->
  <xsl:import href="../other/standard/xsl/xhtml/docbook.xsl"/>

   <xsl:template match="*" mode="process.root">
    <xsl:variable name="doc" select="self::*"/>
    <xsl:processing-instruction name="php">
      require('wp-blog-header.php'); 
      class MyPost { var $post_title = "<xsl:apply-templates select="$doc" mode="object.title.markup.textonly"/>"; }
      $wp_query->is_home = false;
      $wp_query->is_single = true;
      $wp_query->queried_object = new MyPost();
      get_header();
    </xsl:processing-instruction>
    <div id="content" class="narrowcolumn" role="main">
      <xsl:apply-templates select="."/>
    </div>
    <xsl:processing-instruction name="php">
      get_sidebar(); 
      get_footer(); 
      
    </xsl:processing-instruction>
  </xsl:template>

</xsl:stylesheet> 


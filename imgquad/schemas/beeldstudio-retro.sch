<?xml version="1.0"?>
<!-- Schematron rules for  Beeldstudio Retro files-->

<s:schema xmlns:s="http://purl.oclc.org/dsdl/schematron">

<s:pattern>
    <s:title>Beeldstudio Retro checks</s:title>

    <!-- Checks at image level -->
    <s:rule context="//properties/image">
        <!-- Check on expected image format -->
        <s:assert test="(format = 'JPEG') or (format = 'TIFF')">Unexpected image format (expected: JPEG or TIFF)</s:assert>
        <!-- Check on horizontal and vertical resolution (with tolerance of +/- 1 ppi) -->
        <s:assert test="(jfif_density_x &gt;= 299) and
        (jfif_density_x &lt;= 301)">Horizontal resolution outside permitted range</s:assert>
        <s:assert test="(jfif_density_y &gt;= 299) and
        (jfif_density_y &lt;= 301)">Vertical resolution outside permitted range</s:assert>
        <!-- Check on expected number of color components -->
        <s:assert test="(components = '3')">Unexpected number of color components (expected: 3)</s:assert>
        <!-- Check on JPEG compression quality level (with tolerance of +/- 2 levels) -->
        <s:assert test="(JPEGQuality &gt;= 48) and
        (JPEGQuality &lt;= 52)">JPEG compression quality outside permitted range</s:assert>
        <!-- Check on absence of any exceptions while parsing the image stream -->
        <s:assert test="(count(exceptions/exception) = 0)">Properties extraction at stream level resulted in one or more exceptions</s:assert>
    </s:rule>

    <!-- Checks at Exif tag level -->
    <s:rule context="//properties/image/exif">
        <!-- Check on expected format of the image stream -->
        <s:assert test="(format = 'JPEG') or (format = 'TIFF')">Unexpected image format (expected: JPEG or TIFF)</s:assert>
        <!-- Check on horizontal and vertical resolution (with tolerance of +/- 1 ppi) -->
        <s:assert test="(jfif_density_x &gt;= 299) and
        (jfif_density_x &lt;= 301)">Horizontal resolution outside permitted range</s:assert>
        <s:assert test="(jfif_density_y &gt;= 299) and
        (jfif_density_y &lt;= 301)">Vertical resolution outside permitted range</s:assert>
        <!-- Check on expected number of color components -->
        <s:assert test="(components = '3')">Unexpected number of color components (expected: 3)</s:assert>
        <!-- Check on JPEG compression quality level (with tolerance of +/- 2 levels) -->
        <s:assert test="(JPEGQuality &gt;= 48) and
        (JPEGQuality &lt;= 52)">JPEG compression quality outside permitted range</s:assert>
        <!-- Check on absence of any exceptions while parsing the image stream -->
        <s:assert test="(count(exceptions/exception) = 0)">Properties extraction at stream level resulted in one or more exceptions</s:assert>
    </s:rule>

</s:pattern>
</s:schema>

<?xml version="1.0"?>
<!-- Schematron rules for Middeleeuwse Handschriften, 2025 specs (TIFF)-->

<s:schema xmlns:s="http://purl.oclc.org/dsdl/schematron">

<s:pattern>
    <s:title>Middeleeuwse Handschriften, 2025 checks</s:title>

    <!-- Checks at image level -->
    <s:rule context="//properties/image">
        <!-- Check on image format -->
        <s:assert test="(format = 'TIFF')">Unexpected image format (expected: TIFF)</s:assert>
        <!-- Check on ICC profile name -->
        <s:assert test="(icc_profile_name = 'eciRGB v2')">Unexpected ICC profile name</s:assert>
    </s:rule>

    <!-- Checks at tiff tag level -->
    <s:rule context="//properties/image/tiff">
        <!-- Checks for X- and Y resolution tags -->
        <s:assert test="(count(XResolution) &gt; 0)">Missing XResolution tag</s:assert>
        <s:assert test="(count(YResolution) &gt; 0)">Missing YResolution tag</s:assert>
        <s:assert test="(XResolution &gt; 299) and
        (XResolution &lt; 301)">XResolution value outside permitted range</s:assert>
        <s:assert test="(YResolution &gt; 299) and
        (YResolution &lt; 301)">YResolution value outside permitted range</s:assert>
        <s:assert test="(count(ResolutionUnit) &gt; 0)">Missing ResolutionUnit tag</s:assert>
        <s:assert test="(ResolutionUnit = 2)">Wrong ResolutionUnit value</s:assert>
        <!-- Following tags are ALWAYS present, so not sure if checks make sense --> 
        <s:assert test="(count(ImageWidth) &gt; 0)">Missing ImageWidth tag</s:assert>
        <s:assert test="(count(ImageLength) &gt; 0)">Missing ImageLength tag</s:assert>
        <!-- Check on BitsPerSample -->
        <s:assert test="(BitsPerSample = '8 8 8')">Wrong BitsPerSample value</s:assert>
        <!-- Check on ICCProfile tag -->
        <s:assert test="(count(ICCProfile) &gt; 0)">Missing ICCProfile tag</s:assert>

    </s:rule>

    <!-- Checks at exif tag level -->
    <s:rule context="//properties/image/exif">
        <!-- Colourspace checks -->
        <s:assert test="(count(ColorSpace) &gt; 0)">Missing ColorSpace tag</s:assert>
        <s:assert test="(ColorSpace = 65534)">Unexpected ColorSpace value</s:assert>
         <!-- Compression type check -->
        <s:assert test="(Compression = 1)">Unexpected Compression value</s:assert>
        <!-- Checks for capture and camera related tags -->
        <s:assert test="(count(Software) &gt; 0)">Missing Software tag</s:assert>
        <s:assert test="(count(DateTimeOriginal) &gt; 0)">Missing DateTimeOriginal tag</s:assert>
        <s:assert test="(count(Model) &gt; 0)">Missing Model tag</s:assert>
        <s:assert test="(count(Make) &gt; 0)">Missing Make tag</s:assert>
        <s:assert test="(count(ShutterSpeedValue) &gt; 0)">Missing ShutterSpeedValue tag</s:assert>
        <s:assert test="(count(ApertureValue) &gt; 0)">Missing ApertureValue tag</s:assert>
        <s:assert test="(count(ISOSpeedRatings) &gt; 0)">Missing ISOSpeedRatings tag</s:assert>

        <!-- Don't think we need these ...
        <s:assert test="(count(LensMake) &gt; 0)">Missing LensMake tag</s:assert>
        <s:assert test="(count(LensSpecification) &gt; 0)">Missing LensSpecification tag</s:assert>
        <s:assert test="(count(LensModel) &gt; 0)">Missing LensModel tag</s:assert>
        <s:assert test="(count(LensSerialNumber) &gt; 0)">Missing LensSerialNumber tag</s:assert>
        <s:assert test="(count(ExposureTime) &gt; 0)">Missing ExposureTime tag</s:assert>
        <s:assert test="(count(FNumber) &gt; 0)">Missing FNumber tag</s:assert>
        <s:assert test="(count(ISOSpeedRatings) &gt; 0)">Missing ISOSpeedRatings tag</s:assert>
        <s:assert test="(count(WhiteBalance) &gt; 0)">Missing WhiteBalance tag</s:assert> -->

    </s:rule>

    <!-- Check for exceptions -->
    <s:rule context="//properties/image/exceptions">
        <!-- Check on absence of any exceptions while parsing the image -->
        <s:assert test="(count(exception) = 0)">Properties extraction at image level resulted in one or more exceptions</s:assert>
    </s:rule>


</s:pattern>
</s:schema>

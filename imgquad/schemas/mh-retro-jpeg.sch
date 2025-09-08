<?xml version="1.0"?>
<!-- Schematron rules for  Beeldstudio Retro files-->

<s:schema xmlns:s="http://purl.oclc.org/dsdl/schematron">

<s:pattern>
    <s:title>Beeldstudio Retro checks</s:title>

    <!-- Checks at image level -->
    <s:rule context="//properties/image">
        <!-- Checks on image format. TODO: is JPEG in scope here? -->
        <s:assert test="(count(format) > 0)">Missing format tag</s:assert>
        <s:assert test="(format = 'JPEG') or (format = 'TIFF')">Unexpected image format (expected: JPEG or TIFF)</s:assert>
        <!-- Check on icc profile -->
        <s:assert test="(count(icc_profile) > 0)">Missing ICC profile</s:assert>
        <!-- Check on absence of any exceptions while parsing the image -->
        <s:assert test="(count(exceptions/exception) = 0)">Properties extraction at image level resulted in one or more exceptions</s:assert>
    </s:rule>

    <!-- Checks at Exif tag level -->
        <s:rule context="//properties/image/exif">
        <!-- Checks for X- and Y resolution tags -->
        <s:assert test="(count(XResolution) > 0)">Missing XResolution tag</s:assert>
        <s:assert test="(count(YResolution) > 0)">Missing YResolution tag</s:assert>
        <s:assert test="(count(ResolutionUnit) > 0)">Missing ResolutionUnit tag</s:assert>
        <!-- Following tags are ALWAYS present, so not sure if checks make sense --> 
        <s:assert test="(count(ImageWidth) > 0)">Missing ImageWidth tag</s:assert>
        <s:assert test="(count(ImageLength) > 0)">Missing ImageLength tag</s:assert>
        <s:assert test="(count(BitsPerSample) > 0)">Missing BitsPerSample tag</s:assert>
        <!-- Colourspace check -->
        <s:assert test="(ColorSpace = 65534)">Unexpected ColorSpace value</s:assert>
         <!-- Compression type check (TODO value is 6 in case of JPEG, but is JPEG in scope here?)  -->
        <s:assert test="(Compression = 1)">Unexpected Compression value</s:assert>

        <!-- Checks for capture and camera related tags -->
        <s:assert test="(count(Software) > 0)">Missing Software tag</s:assert>
        <s:assert test="(count(DateTimeOriginal) > 0)">Missing DateTimeOriginal tag</s:assert>
        <s:assert test="(count(Model) > 0)">Missing Model tag</s:assert>
        <s:assert test="(count(Make) > 0)">Missing Make tag</s:assert>
        <s:assert test="(count(ShutterSpeedValue) > 0)">Missing ShutterSpeedValue tag</s:assert>
        <s:assert test="(count(ApertureValue) > 0)">Missing ApertureValue tag</s:assert>
        <s:assert test="(count(ISOSpeedRatings) > 0)">Missing ISOSpeedRatings tag</s:assert>

        <!-- Don't think we need these ...
        <s:assert test="(count(LensMake) > 0)">Missing LensMake tag</s:assert>
        <s:assert test="(count(LensSpecification) > 0)">Missing LensSpecification tag</s:assert>
        <s:assert test="(count(LensModel) > 0)">Missing LensModel tag</s:assert>
        <s:assert test="(count(LensSerialNumber) > 0)">Missing LensSerialNumber tag</s:assert>
        <s:assert test="(count(ExposureTime) > 0)">Missing ExposureTime tag</s:assert>
        <s:assert test="(count(FNumber) > 0)">Missing FNumber tag</s:assert>
        <s:assert test="(count(ISOSpeedRatings) > 0)">Missing ISOSpeedRatings tag</s:assert>
        <s:assert test="(count(WhiteBalance) > 0)">Missing WhiteBalance tag</s:assert>
        -->

    </s:rule>

</s:pattern>
</s:schema>

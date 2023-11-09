<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
	<xsl:template match="/">
	<soap:Envelope xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xmlns:xsd="http://www.w3.org/2001/XMLSchema" xmlns:soap="http://schemas.xmlsoap.org/soap/envelope/">
		<soap:Body>
			<checkVat xmlns="urn:ec.europa.eu:taxud:vies:services:checkVat:types">
				<countryCode><xsl:value-of select="eutaxationXmlElement/countryCode"/></countryCode>
				<vatNumber><xsl:value-of select="eutaxationXmlElement/vatNumber"/></vatNumber>
			</checkVat>
		</soap:Body>
	</soap:Envelope>
	</xsl:template>
</xsl:stylesheet>
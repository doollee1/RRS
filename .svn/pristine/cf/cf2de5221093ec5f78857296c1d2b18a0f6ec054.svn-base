<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
	<xsl:template match="/">
	<SOAP-ENV:Envelope xmlns:SOAP-ENV="http://schemas.xmlsoap.org/soap/envelope/" xmlns:SOAP-ENC="http://schemas.xmlsoap.org/soap/encoding/" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xmlns:xsd="http://www.w3.org/2001/XMLSchema" xmlns:m0="http://atradius.com/services/organisationsearch/2006_03_17/orgsearchrequest">
	<SOAP-ENV:Header>
		<wsse:Security xmlns:wsse="http://docs.oasis-open.org/wss/2004/01/oasis-200401-wss-wssecurity-secext-1.0.xsd" SOAP-ENV:mustUnderstand="0">
			<wsse:UsernameToken>
				<wsse:Username><xsl:value-of select="atradiusXmlElement/id"/></wsse:Username>
				<wsse:Password Type="http://docs.oasis-open.org/wss/2004/01/oasis-200401-wss-username-token-profile-1.0#PasswordText"><xsl:value-of select="atradiusXmlElement/password"/></wsse:Password>
			</wsse:UsernameToken>
		</wsse:Security>
	</SOAP-ENV:Header>
	<SOAP-ENV:Body>
	
		<xsl:if test="atradiusXmlElement/api = 'getOrganisations'">
		<m:getOrganisations xmlns:m="http://atradius.com/services/organisationsearch/2006_03_17/">
			<m:getOrganisationsRequest>
				<m0:MaxOrg>2</m0:MaxOrg>
				<m0:SearchType>ALL</m0:SearchType>
				<m0:SearchOrganisation>
					<m0:RegisteredOffice>
						<m0:RegisteredOfficeType>VA</m0:RegisteredOfficeType>
						<m0:RegisteredOfficeCode><xsl:value-of select="atradiusXmlElement/vatNumber"/></m0:RegisteredOfficeCode>
					</m0:RegisteredOffice>
					<m0:NameAddress>
						<m0:Name>
							<m0:NameLine><xsl:value-of select="atradiusXmlElement/name"/></m0:NameLine>
						</m0:Name>
						<m0:Address>
							<m0:Street>
								<m0:StreetLine><xsl:value-of select="atradiusXmlElement/streetLine"/></m0:StreetLine>
							</m0:Street>
							<m0:City><xsl:value-of select="atradiusXmlElement/city"/></m0:City>
							<m0:PostCode><xsl:value-of select="atradiusXmlElement/postcode"/></m0:PostCode>
						</m0:Address>
						<m0:CountrySubIdent></m0:CountrySubIdent>
						<m0:Country>
							<m0:CountryISOCode><xsl:value-of select="atradiusXmlElement/country"/></m0:CountryISOCode>
						</m0:Country>
					</m0:NameAddress>
					<m0:PhoneNumber></m0:PhoneNumber>
				</m0:SearchOrganisation>
			</m:getOrganisationsRequest>
		</m:getOrganisations>
		</xsl:if>
		
		<xsl:if test="atradiusXmlElement/api = 'checkCredit'">
		<checkCredit xmlns="http://atradius.com/connect/_2007_08/">
			<application>
				<CustomerId rassxmlns="">19902575</CustomerId>
				<PolicyId rassxmlns=""><xsl:value-of select="atradiusXmlElement/policy"/></PolicyId>
				<CustomerReference rassxmlns="">Test Credit Check</CustomerReference>
				<Buyer rassxmlns="" registeredOffice="SYMPH">
					<ns1:id xmlns:ns1="http://atradius.com/organisation/_2007_08/type/"><xsl:value-of select="atradiusXmlElement/buyerId"/></ns1:id>
					<ns2:countryTypeIdentifier xmlns:ns2="http://atradius.com/organisation/_2007_08/type/"></ns2:countryTypeIdentifier>
				</Buyer>
			</application>
		</checkCredit>
		</xsl:if>
		
		<xsl:if test="atradiusXmlElement/api = 'creditLimit'">
		<applyForCreditLimit xmlns="http://atradius.com/connect/_2007_08/">
			<application>
				<CustomerId rassxmlns="">19902575</CustomerId>
				<PolicyId rassxmlns=""><xsl:value-of select="atradiusXmlElement/policy"/></PolicyId>
				<CustomerReference rassxmlns=""><xsl:value-of select="atradiusXmlElement/customerReference"/></CustomerReference>
				<Buyer rassxmlns="" registeredOffice="SYMPH">
					<ns1:id xmlns:ns1="http://atradius.com/organisation/_2007_08/type/"><xsl:value-of select="atradiusXmlElement/buyerId"/></ns1:id>
					<ns2:countryTypeIdentifier xmlns:ns2="http://atradius.com/organisation/_2007_08/type/"></ns2:countryTypeIdentifier>
				</Buyer>
				<RequestedAmount rassxmlns=""><xsl:value-of select="atradiusXmlElement/requestedAmount"/></RequestedAmount>
				<CurrencyCode rassxmlns=""><xsl:value-of select="atradiusXmlElement/currencyCode"/></CurrencyCode>
				<EffectFromDate rassxmlns=""><xsl:value-of select="atradiusXmlElement/effectFromDate"/></EffectFromDate>
				<Priority rassxmlns="">NORM</Priority>
			</application>
		</applyForCreditLimit>
		</xsl:if>
		
		<xsl:if test="atradiusXmlElement/api = 'creditSupersedeLimit'">
		<m:supersedeCreditLimit xmlns:m="http://atradius.com/connect/_2007_08/">
			<m:application>
				<CustomerId>19902575</CustomerId>
				<PolicyId><xsl:value-of select="atradiusXmlElement/policy"/></PolicyId>
				<ExternalCoverId/>
				<CustomerReference><xsl:value-of select="atradiusXmlElement/customerReference"/></CustomerReference>
				<Buyer registeredOffice="SYMPH">
					<ns1:id xmlns:ns1="http://atradius.com/organisation/_2007_08/type/"><xsl:value-of select="atradiusXmlElement/buyerId"/></ns1:id>
					<ns2:countryTypeIdentifier xmlns:ns2="http://atradius.com/organisation/_2007_08/type/"/>
				</Buyer>
				<RequestedAmount><xsl:value-of select="atradiusXmlElement/requestedAmount"/></RequestedAmount>
				<CurrencyCode><xsl:value-of select="atradiusXmlElement/currencyCode"/></CurrencyCode>
				<EffectFromDate><xsl:value-of select="atradiusXmlElement/effectFromDate"/></EffectFromDate>
				<EffectToDate><xsl:value-of select="atradiusXmlElement/effectToDate"/></EffectToDate>
				<Priority>NORM</Priority>
			</m:application>
		</m:supersedeCreditLimit>
		</xsl:if>
		
		<xsl:if test="atradiusXmlElement/api = 'cancelCredit'">
		<cancelCover xmlns="http://atradius.com/connect/_2007_08/">
			<CustomerId>19902575</CustomerId>
			<PolicyId><xsl:value-of select="atradiusXmlElement/policy"/></PolicyId>
			<Buyer registeredOffice="SYMPH">
				<ns1:id xmlns:ns1="http://atradius.com/organisation/_2007_08/type/"><xsl:value-of select="atradiusXmlElement/buyerId"/></ns1:id>
				<ns2:countryTypeIdentifier xmlns:ns2="http://atradius.com/organisation/_2007_08/type/"/>
			</Buyer>
		</cancelCover>
		</xsl:if>
		
		<xsl:if test="atradiusXmlElement/api = 'retrievePortfolio'">
		<ns1:retrievePortfolio xmlns:ns1="http://atradius.com/connect/_2007_08/">
			<ns1:DateFrom><xsl:value-of select="atradiusXmlElement/effectFromDate"/></ns1:DateFrom>
			<ns1:DateTo><xsl:value-of select="atradiusXmlElement/effectToDate"/></ns1:DateTo>
			<ns1:Policies>
				<ns1:PolicyId><xsl:value-of select="atradiusXmlElement/policy"/></ns1:PolicyId>
			</ns1:Policies>
		</ns1:retrievePortfolio>
		</xsl:if>
		
	</SOAP-ENV:Body>
	</SOAP-ENV:Envelope>
	</xsl:template>
</xsl:stylesheet>
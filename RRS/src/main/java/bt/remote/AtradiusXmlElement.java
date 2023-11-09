package bt.remote;

import javax.xml.bind.annotation.XmlElement;
import javax.xml.bind.annotation.XmlRootElement;

@XmlRootElement
public class AtradiusXmlElement {
	private String api;
	private String id;
	private String password;
	private String policy;
	private String country;
	private String nationalRegistrationNumber;
	private String vatNumber;
	private String name;
	private String streetLine;
	private String city;
	private String postcode;
	private String organisationID;
	private String buyerId;
	private String buyerCountryTypeIdentifier;
	private String requestedAmount;
	private String currencyCode;
	private String effectFromDate;
	private String effectToDate;
	private String customerReference;
	
	/**
	 * @return the api
	 */
	@XmlElement(name="api")
	public String getApi() {
		return api;
	}
	/**
	 * @param api the api to set
	 */
	public void setApi(String api) {
		this.api = api;
	}
	/**
	 * @return the id
	 */
	@XmlElement(name="id")
	public String getId() {
		return id;
	}
	/**
	 * @param id the id to set
	 */
	public void setId(String id) {
		this.id = id;
	}
	/**
	 * @return the password
	 */
	@XmlElement(name="password")
	public String getPassword() {
		return password;
	}
	/**
	 * @param password the password to set
	 */
	public void setPassword(String password) {
		this.password = password;
	}
	/**
	 * @return the policy
	 */
	@XmlElement(name="policy")
	public String getPolicy() {
		return policy;
	}
	/**
	 * @param policy the policy to set
	 */
	public void setPolicy(String policy) {
		this.policy = policy;
	}
	/**
	 * @return the country
	 */
	@XmlElement(name="country")
	public String getCountry() {
		return country;
	}
	/**
	 * @param country the country to set
	 */
	public void setCountry(String country) {
		this.country = country;
	}
	/**
	 * @return the nationalRegistrationNumber
	 */
	@XmlElement(name="nationalRegistrationNumber")
	public String getNationalRegistrationNumber() {
		return nationalRegistrationNumber;
	}
	/**
	 * @param nationalRegistrationNumber the nationalRegistrationNumber to set
	 */
	public void setNationalRegistrationNumber(String nationalRegistrationNumber) {
		this.nationalRegistrationNumber = nationalRegistrationNumber;
	}
	/**
	 * @return the vatNumber
	 */
	@XmlElement(name="vatNumber")
	public String getVatNumber() {
		return vatNumber;
	}
	/**
	 * @param vatNumber the vatNumber to set
	 */
	public void setVatNumber(String vatNumber) {
		this.vatNumber = vatNumber;
	}
	/**
	 * @return the name
	 */
	@XmlElement(name="name")
	public String getName() {
		return name;
	}
	/**
	 * @param name the name to set
	 */
	public void setName(String name) {
		this.name = name;
	}
	/**
	 * @return the streetLine
	 */
	@XmlElement(name="streetLine")
	public String getStreetLine() {
		return streetLine;
	}
	/**
	 * @param streetLine the streetLine to set
	 */
	public void setStreetLine(String streetLine) {
		this.streetLine = streetLine;
	}
	/**
	 * @return the city
	 */
	@XmlElement(name="city")
	public String getCity() {
		return city;
	}
	/**
	 * @param city the city to set
	 */
	public void setCity(String city) {
		this.city = city;
	}
	/**
	 * @return the postcode
	 */
	@XmlElement(name="postcode")
	public String getPostcode() {
		return postcode;
	}
	/**
	 * @param postcode the postcode to set
	 */
	public void setPostcode(String postcode) {
		this.postcode = postcode;
	}
	/**
	 * @return the organisationID
	 */
	@XmlElement(name="organisationID")
	public String getOrganisationID() {
		return organisationID;
	}
	/**
	 * @param organisationID the organisationID to set
	 */
	public void setOrganisationID(String organisationID) {
		this.organisationID = organisationID;
	}
	/**
	 * @return the buyerId
	 */
	@XmlElement(name="buyerId")
	public String getBuyerId() {
		return buyerId;
	}
	/**
	 * @param buyerId the buyerId to set
	 */
	public void setBuyerId(String buyerId) {
		this.buyerId = buyerId;
	}
	/**
	 * @return the buyerCountryTypeIdentifier
	 */
	@XmlElement(name="buyerCountryTypeIdentifier")
	public String getBuyerCountryTypeIdentifier() {
		return buyerCountryTypeIdentifier;
	}
	/**
	 * @param buyerCountryTypeIdentifier the buyerCountryTypeIdentifier to set
	 */
	public void setBuyerCountryTypeIdentifier(String buyerCountryTypeIdentifier) {
		this.buyerCountryTypeIdentifier = buyerCountryTypeIdentifier;
	}
	/**
	 * @return the requestedAmount
	 */
	@XmlElement(name="requestedAmount")
	public String getRequestedAmount() {
		return requestedAmount;
	}
	/**
	 * @param requestedAmount the requestedAmount to set
	 */
	public void setRequestedAmount(String requestedAmount) {
		this.requestedAmount = requestedAmount;
	}
	/**
	 * @return the currencyCode
	 */
	@XmlElement(name="currencyCode")
	public String getCurrencyCode() {
		return currencyCode;
	}
	/**
	 * @param currencyCode the currencyCode to set
	 */
	public void setCurrencyCode(String currencyCode) {
		this.currencyCode = currencyCode;
	}
	/**
	 * @return the effectFromDate
	 */
	@XmlElement(name="effectFromDate")
	public String getEffectFromDate() {
		return effectFromDate;
	}
	/**
	 * @param effectFromDate the effectFromDate to set
	 */
	public void setEffectFromDate(String effectFromDate) {
		this.effectFromDate = effectFromDate;
	}
	/**
	 * @return the effectToDate
	 */
	@XmlElement(name="effectToDate")
	public String getEffectToDate() {
		return effectToDate;
	}
	/**
	 * @param effectToDate the effectToDate to set
	 */
	public void setEffectToDate(String effectToDate) {
		this.effectToDate = effectToDate;
	}
	/**
	 * @return the customerReference
	 */
	@XmlElement(name="customerReference")
	public String getCustomerReference() {
		return customerReference;
	}
	/**
	 * @param customerReference the customerReference to set
	 */
	public void setCustomerReference(String customerReference) {
		this.customerReference = customerReference;
	}
}

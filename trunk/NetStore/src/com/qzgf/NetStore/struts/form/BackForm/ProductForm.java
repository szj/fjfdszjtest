/*
 * Generated by MyEclipse Struts
 * Template path: templates/java/JavaClass.vtl
 */
package com.qzgf.NetStore.struts.form.BackForm;

import javax.servlet.http.HttpServletRequest;
import org.apache.struts.action.ActionErrors;
import org.apache.struts.action.ActionForm;
import org.apache.struts.action.ActionMapping;
	
/** 
 * MyEclipse Struts
 * Creation date: 08-12-2008
 * 
 * XDoclet definition:
 * @struts.form name="productManageForm"
 */
public class ProductForm extends ActionForm {
	private String ProductId;
	private String Productname;
	private String CatalogId;
	private String DisplayDate;
	private String ProductDate;
	private String ManufacturerID;
	private String IfCommend;
	private String MarketPrice;
	private String MemberPrice;
	private String Brand;
	private String ProductIntro;
	private String SmallPath;
	private String BigPath;
	private String Stock;

	public String getProductId() {
		return ProductId;
	}

	public void setProductId(String productId) {
		ProductId = productId;
	}

	public String getProductname() {
		return Productname;
	}

	public void setProductname(String productname) {
		Productname = productname;
	}

	public String getCatalogId() {
		return CatalogId;
	}

	public void setCatalogId(String catalogId) {
		CatalogId = catalogId;
	}

	public String getDisplayDate() {
		return DisplayDate;
	}

	public void setDisplayDate(String displayDate) {
		DisplayDate = displayDate;
	}

	public String getProductDate() {
		return ProductDate;
	}

	public void setProductDate(String productDate) {
		ProductDate = productDate;
	}

	public String getManufacturerID() {
		return ManufacturerID;
	}

	public void setManufacturerID(String manufacturerID) {
		ManufacturerID = manufacturerID;
	}

	public String getIfCommend() {
		return IfCommend;
	}

	public void setIfCommend(String ifCommend) {
		IfCommend = ifCommend;
	}

	public String getMarketPrice() {
		return MarketPrice;
	}

	public void setMarketPrice(String marketPrice) {
		MarketPrice = marketPrice;
	}

	public String getMemberPrice() {
		return MemberPrice;
	}

	public void setMemberPrice(String memberPrice) {
		MemberPrice = memberPrice;
	}

	public String getBrand() {
		return Brand;
	}

	public void setBrand(String brand) {
		Brand = brand;
	}

	public String getProductIntro() {
		return ProductIntro;
	}

	public void setProductIntro(String productIntro) {
		ProductIntro = productIntro;
	}

	public String getSmallPath() {
		return SmallPath;
	}

	public void setSmallPath(String smallPath) {
		SmallPath = smallPath;
	}

	public String getBigPath() {
		return BigPath;
	}

	public void setBigPath(String bigPath) {
		BigPath = bigPath;
	}

	public String getStock() {
		return Stock;
	}

	public void setStock(String stock) {
		Stock = stock;
	}

	/** 
	 * Method validate
	 * @param mapping
	 * @param request
	 * @return ActionErrors
	 */
	public ActionErrors validate(ActionMapping mapping,
			HttpServletRequest request) {
		// TODO Auto-generated method stub
		return null;
	}

	/** 
	 * Method reset
	 * @param mapping
	 * @param request
	 */
	public void reset(ActionMapping mapping, HttpServletRequest request) {
		// TODO Auto-generated method stub
	}
}
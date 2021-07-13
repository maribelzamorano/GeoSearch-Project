package com.topdev.aa.object;
import org.apache.struts.validator.ValidatorForm;

public final class ConfigText extends ValidatorForm{

	private static final long	serialVersionUID	= 1L;
	private String fontsize			= "6";
	private String fontstyle		= "none";
	private String fontfamily		= "helvetica";
	private String fontweight		= "normal";
	private String fontdecoration	= "none";		//unterstrichen?
	private String fontwest			= "Standard";


	/**
	 * @return
	 */
	public String getFontdecoration() {
		return fontdecoration;
	}

	/**
	 * @return
	 */
	public String getFontfamily() {
		return fontfamily;
	}

	/**
	 * @return
	 */
	public String getFontsize() {
		return fontsize;
	}

	/**
	 * @return
	 */
	public String getFontstyle() {
		return fontstyle;
	}

	/**
	 * @return
	 */
	public String getFontweight() {
		return fontweight;
	}

	/**
	 * @return
	 */
	public String getFontwest() {
		return fontwest;
	}

	/**
	 * @param string
	 */
	public void setFontdecoration(String string) {
		fontdecoration = string;
	}

	/**
	 * @param string
	 */
	public void setFontfamily(String string) {
		fontfamily = string;
	}

	/**
	 * @param string
	 */
	public void setFontsize(String string) {
		fontsize = string;
	}

	/**
	 * @param string
	 */
	public void setFontstyle(String string) {
		fontstyle = string;
	}

	/**
	 * @param string
	 */
	public void setFontweight(String string) {
		fontweight = string;
	}

	/**
	 * @param string
	 */
	public void setFontwest(String string) {
		fontwest = string;
	}

}
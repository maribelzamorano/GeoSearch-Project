<?xml version="1.0" encoding="iso-8859-1"?>
<xsl:stylesheet version="1.1" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
<!--____________________________________________________________________________________________________________________________________-->
<xsl:template match="navigator">
	<html>
		<head>
			<link rel="stylesheet" type="text/css">
				<xsl:attribute name="href"><xsl:value-of select="@absoluteUrl"/>/resources/stylesheet/css-navigator.css</xsl:attribute>
			</link>
			<script language="JavaScript">
				var homeURL		= "<xsl:value-of select="@absoluteUrl"/>";
				var registered	= <xsl:if test="/navigator/login/@registered != 'false'">true</xsl:if><xsl:if test="/navigator/login/@registered = 'false'">false</xsl:if>;
				var markedEntry	= "<xsl:value-of select="@mark"/>";
			</script>
			<script type="text/javascript">
				<xsl:attribute name="src"><xsl:value-of select="@absoluteUrl"/>/resources/javascript/pages/navigator.js</xsl:attribute>
			</script>
		</head>
		<body onload="init()">
			<xsl:if test="count(/navigator/image_left)>0">
				<xsl:attribute name="style">margin-left:0px;padding-left:0px;</xsl:attribute>
			</xsl:if>
					
			<table width="100%" cellspacing="0" cellpadding="0">
			<tr>
				<td valign="top">
				<xsl:if test="count(/navigator/image_left)>0">
					<xsl:attribute name="style">padding-top:160px;padding-right:3px</xsl:attribute>
					<img>
						<xsl:attribute name="src"><xsl:value-of select="@absoluteUrl"/><xsl:value-of select="image_left/@src"/></xsl:attribute>
					</img>
				</xsl:if>
				</td>
				<td>
					<xsl:apply-templates>
						<xsl:with-param name="absoluteUrl" select="@absoluteUrl"/>
					</xsl:apply-templates>
				</td>
			</tr>
			</table>
		</body>
	</html>
</xsl:template>
<!--____________________________________________________________________________________________________________________________________-->
<xsl:template match="login">	
	<xsl:param name="absoluteUrl"/>
	<xsl:if test="@visible != 'false'">
		<iframe name="loginFrame" style="display:none" src="javascript:false"/>
		<xsl:if test="@registered = 'false'">
			<table cellpadding="0" width="100%" border="0" class="login">
					<tr class="login">
						<td class="loginZugang">
							<span class="errorSpan" id="loginErrorSpan" style="display:none"></span>
						</td>
					</tr>
					<tr class="login">
						<td class="loginForm">
							<form target="_parent" method="post" name="loginForm" onsubmit="return loginSubmit();">
							<xsl:attribute name="action"><xsl:value-of select="$absoluteUrl"/><xsl:value-of select="@href"/></xsl:attribute>
							<nobr>
								Name:<br/>
								<input class="loginFormData" name="username" type="text" maxlength="30"/><br/>
								Kennwort:<br/>
								<input class="loginFormData" name="password" type="password" maxlength="30"/><br/>
								<input class="loginButton" type="submit" onclick="document.getElementById('loginErrorSpan').style.display = 'none'" value="">
								</input>
							<br/>
						  	<a class="login">
						  		<xsl:attribute name="href">javascript:openLink('user__forgotpassword__username','<xsl:value-of select="@href_forgotpassword"/>')</xsl:attribute>
						  		Kennwort vergessen?
						  	</a><br/>
						  	
							<xsl:if test="not(@registration='false')">
						  	<a class="login">
						  	<xsl:attribute name="href">javascript:openLink('businesspartner__face__detail','<xsl:value-of select="@href_newuser"/>')</xsl:attribute>
						  		Neuer Benutzer
						  	</a>
						  	</xsl:if>
							</nobr>
							</form>
						</td>
					</tr>
			</table>
		</xsl:if>
		<xsl:if test="@registered != 'false'">
			<table cellpadding="0" width="100%" border="0" class="logout">
			<tr>
				<td class="logout">
					<script>
					var GEPA_ID = <xsl:value-of select="@GEPA_ID"/>;
					</script>
					<span class="loginInfo">
						Angemeldet als:<br/>
						<xsl:value-of select="@loginName"/><br/>
					</span>
						<input class="logoutButton" type="button" value="">
							<xsl:attribute name="onclick">location.replace("<xsl:value-of select="$absoluteUrl"/>/user-logout.do");</xsl:attribute>
						</input>
				</td>
			</tr>
			</table>
		</xsl:if>
	</xsl:if>
</xsl:template>
<!--____________________________________________________________________________________________________________________________________-->
<xsl:template match="search">
	<xsl:param name="absoluteUrl"/>
	<xsl:if test="@visible != 'false'">
		<table cellspacing="0" cellpadding="0" class="search">
	<form onsubmit="return metasearch();">
		<tr class="search">
			<td class="search">
				<input id="SUCHBEGRIFF" name="SUCHBEGRIFF" onclick="if(this.value=='Suchbegriff') this.value=''" type="text" value="Suchbegriff" maxlength="30" class="searchFormData"/> 
				<br/><input class="searchButton" type="submit" value="">
				</input>
			</td>
		</tr>
	</form>
		</table>
	</xsl:if>
</xsl:template>
<!--____________________________________________________________________________________________________________________________________-->
<xsl:template match="logo">
	<xsl:param name="absoluteUrl"/>
	<xsl:if test="@visible != 'false'">
		<a href="javascript:logoAction();">
			<img border="0" class="logo">
				<xsl:attribute name="src"><xsl:value-of select="$absoluteUrl"/><xsl:value-of select="@src"/></xsl:attribute>
			</img>
		</a>
	</xsl:if>
</xsl:template>
<!--____________________________________________________________________________________________________________________________________-->
<xsl:template match="menu">
	<table class="menu">
		<xsl:apply-templates>
			<xsl:with-param name="deep" select="1"/>
		</xsl:apply-templates>
	</table>
</xsl:template>
<!--____________________________________________________________________________________________________________________________________-->
<xsl:template match="submenu">
	<xsl:param name="deep"/>
	<xsl:if test="@visible = 'true'">
	<tr>
	
		<xsl:attribute name="class">submenu<xsl:value-of select="$deep"/></xsl:attribute>
		<td>
				<xsl:if test="count(./submenu) = 0">
					<xsl:attribute name="class">submenu<xsl:value-of select="$deep"/></xsl:attribute>
				</xsl:if>
				<xsl:if test="count(./submenu) > 0 or $deep = 1">
					<a name="submenu" onclick="observLink(this)">
						<xsl:attribute name="href">javascript:openLink('<xsl:value-of select="@id"/>','<xsl:value-of select="@link"/>')</xsl:attribute>
						<xsl:attribute name="id">link<xsl:value-of select="@id"/></xsl:attribute>
						<xsl:if test="count(./submenu) > 0">
							<xsl:attribute name="class">submenu_with_childs</xsl:attribute>
						</xsl:if>
						<xsl:if test="count(./submenu) = 0">
							<xsl:attribute name="class">submenu_without_childs</xsl:attribute>
						</xsl:if>
						<xsl:value-of select="@label"/>
					</a>
				</xsl:if>
				<xsl:if test="$deep > 1">
					<xsl:if test="count(./submenu) = 0">
						<xsl:attribute name="class">submenu2</xsl:attribute>
						<table cellspacing="0" cellpadding="0">
						<tr>
							<td style="vertical-align:top; padding-top:3px" class="submenu_icon">
							</td>
							<td>
								<a name="submenu" onclick="observLink(this)">
									<xsl:attribute name="href">javascript:openLink('<xsl:value-of select="@id"/>','<xsl:value-of select="@link"/>')</xsl:attribute>
									<xsl:attribute name="id">link<xsl:value-of select="@id"/></xsl:attribute>
									<xsl:if test="count(./submenu) > 0">
										<xsl:attribute name="class">submenu_with_childs</xsl:attribute>
									</xsl:if>
									<xsl:if test="count(./submenu) = 0">
										<xsl:attribute name="class">submenu_without_childs</xsl:attribute>
									</xsl:if>
									<xsl:value-of select="@label"/>
								</a>
							</td>
						</tr>
						</table>
					</xsl:if>
				</xsl:if>
				
			<xsl:if test="count(./submenu) > 0">
				<span style="display:none">
					<xsl:attribute name="class">submenu<xsl:value-of select="$deep"/></xsl:attribute>
					<xsl:attribute name="id"><xsl:value-of select="@id"/>Span</xsl:attribute>
					<table>
						<xsl:apply-templates>
							<xsl:with-param name="deep" select="$deep + 1"/>
						</xsl:apply-templates>
					</table>
				</span>
			</xsl:if>
		</td>
	</tr>
	</xsl:if>
</xsl:template>
<!--____________________________________________________________________________________________________________________________________-->

<xsl:template match="footer">
	<span class="footer">
		<xsl:apply-templates/>
	</span>
</xsl:template>

<xsl:template match="impressum">	
	<xsl:param name="absoluteUrl"/>	
			<table class="menu">			
						<tr >						
							<td colspan="2" >	
							<!--<xsl:attribute name="action"><xsl:value-of select="$absoluteUrl"/><xsl:value-of select="@href"/></xsl:attribute>-->
							<hr class="navigator"/>
						  	<a class="submenu_with_childs" target="_blank">
						  		Kontakt
						  	</a>
						  
						  </td>
						 </tr>
						 <tr >
						  	<td   style="vertical-align:top; padding-top:3px" class="submenu_icon"></td>
						  	<td >
							  	<a class="submenu_without_childs" target="_blank">
							  	<xsl:attribute name="href"><xsl:value-of select="@href_mail"/></xsl:attribute>
							  		Mail
							  	</a>
						  	</td>
						  </tr>
						  <tr>
						  	<td style="vertical-align:top; padding-top:3px" class="submenu_icon"></td>
						  	<td>							  
								<a class="submenu_without_childs" target="_blank">
							  	<xsl:attribute name="href"><xsl:value-of select="@href"/></xsl:attribute>
							  		Bildungsserver <br/>Rheinland-Pfalz
							  	</a>
							</td>
						
						</tr>
						<tr >					
							<td colspan="2" >
						  	<a class="submenu_with_childs" target="_blank">
								<xsl:if test="@href_IFB">
							  		<xsl:attribute name="href"><xsl:value-of select="@href_IFB"/></xsl:attribute>
								</xsl:if>
						  		IFB
						  	</a>
						  	</td>
						</tr>
						<tr>
							 <td style="vertical-align:top; padding-top:3px" class="submenu_icon"></td>
							<td>	
							  	<a class="submenu" target="_blank">
							  	<xsl:attribute name="href"><xsl:value-of select="@href_LMZ"/></xsl:attribute>
							  		LMZ
							  	</a>
							 </td>
						 </tr>
						 <tr>
							<td style="vertical-align:top; padding-top:3px" class="submenu_icon"></td>
							<td>
								<a class="submenu" target="_blank">
							  	<xsl:attribute name="href"><xsl:value-of select="@href_PZ"/></xsl:attribute>
							  		PZ
							  	</a>
							</td>
						</tr>
						<tr >
						<td colspan="2" style="padding-bottom:5px; padding-top:5px">
						  	<a class="submenu_with_childs" target="_blank">
						  	<xsl:attribute name="href" ><xsl:value-of select="@href_ILF"/></xsl:attribute>
						  		ILF
						  	</a><br/>
						  	
						  
						</td>
					</tr>
					<tr >
						<td colspan="2" style="padding-bottom:5px">					
						  	<a class="submenu_with_childs" target="_blank">
						  	<xsl:attribute name="href" ><xsl:value-of select="@href_EFWI"/></xsl:attribute>
						  		EFWI
						  	</a>
						</td>
					</tr>
					<tr >
						<td colspan="2">						
					  	<a class="submenu">
						  		 und andere Fortbildungsträger
						  	</a>
						</td>
					</tr>
			</table>
</xsl:template>
<!--____________________________________________________________________________________________________________________________________-->
<xsl:template match="line">
	<xsl:apply-templates/><br/>
</xsl:template>
<!--____________________________________________________________________________________________________________________________________-->
<xsl:template match="link">
	<a class="footer" target="_blank">
		<xsl:attribute name="href"><xsl:value-of select="@url"/></xsl:attribute>
		<xsl:value-of select="."/>
	</a>
</xsl:template>
<!--____________________________________________________________________________________________________________________________________-->
<xsl:template match="image">
	<img border="0">
		<xsl:attribute name="src"><xsl:value-of select="@url"/></xsl:attribute>
	</img>
</xsl:template>
<!--____________________________________________________________________________________________________________________________________-->
</xsl:stylesheet>

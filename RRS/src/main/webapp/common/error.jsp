<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="s" uri="http://www.springframework.org/tags"%>
<!DOCTYPE html>
<html lang="en-US" class=" webkit chrome win js">
	<head>	
		<meta charset="UTF-8" />
		<meta http-equiv="X-UA-Compatible" content="IE=Edge"/>
		<!---------- 공통 CSS/JS Import ---------->
		<link href="https://fonts.googleapis.com/css?family=Roboto+Mono" rel="stylesheet">
		</head>

<body>
    <table width="100%" height="100%" border="0" cellpadding="0" cellspacing="0">
        <tr>
            <td width="100%" height="100%" align="center" valign="middle" style="padding-top: 150px;"><table border="0" cellspacing="0" cellpadding="0">
                    <tr>
                        <td class="<s:message code='image.errorBg' />">
                            <span style="font-family: Tahoma; font-weight: bold; color: #000000; line-height: 150%; width: 440px; height: 70px;"></span>
                            <p>
								<span style="font-size:4em; font-family:verdana; font-weight:700; color:#ff6600;">
								<i class="fa fa-warning">Error</i></span>
								<br></br><s:message code='errors.notfound1'/><br></br><s:message code='errors.notfound2'/></p>
                        </td>
                    </tr>
                </table>
            </td>
        </tr>
    </table>
</body>
</html>
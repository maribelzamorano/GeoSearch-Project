<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="anwf" scope="request">${(LIFERAY_SHARED_friendlyURL eq '/web/guest/media/mediacenter/overview')?'media':'school'}</c:set>
<c:set var="ns" scope="request">businesspartner</c:set>

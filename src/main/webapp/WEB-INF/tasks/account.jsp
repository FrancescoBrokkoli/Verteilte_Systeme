<%-- 
    Document   : account
    Created on : 26.03.2019, 09:58:12
    Author     : Service
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>

<%@taglib tagdir="/WEB-INF/tags/templates" prefix="template"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>

<template:base>
    <jsp:attribute name="title">
        Account verwalten
    </jsp:attribute>

    <jsp:attribute name="head">
   <link rel="stylesheet" href="<c:url value="/css/category_list.css"/>" /> 
    </jsp:attribute>

    <jsp:attribute name="menu">
        <div class="menuitem">
            <a href="<c:url value="/app/dashboard/"/>">Dashboard</a>
        </div>

        <div class="menuitem">
            <a href="<c:url value="/app/tasks/list/"/>">Liste</a>
        </div>
    </jsp:attribute>

    <jsp:attribute name="content">
        <form method="post" class="stacked">
            <%-- CSRF-Token --%>
            <input type="hidden" name="csrf_token" value="${csrf_token}">

            <%-- Feld zum Anlegen einer neuen Kategorie --%>
            <div class="column margin">
                <label for="j_username">Deine Accountdaten: </label>
            </div>   
                
                               
<%-- Hier muss der Vorname hin: --%>
<div class="column margin">
<label for="j_username">Vorname: </label>
    <input type="text" name="name" value="${categories_form.values["name"][0]}">
    </div>
    <div>
    <button class="ändern" type="submit">
                        Ändern
                    </button>
    </div>
    <br>
    
 <div class="column margin">
<label for="j_username">Nachname: </label>
    <input type="text" name="name" value="${categories_form.values["name"][0]}">
    </div>
    <div>
<button class="ändern" type="submit">
                        Ändern
 </button>
    </div>
    <br>
     <div class="column margin">
<label for="j_username">Username: </label>
    <input type="text" name="name" value="${categories_form.values["name"][0]}">
    </div>
    
            <%-- Fehlermeldungen --%>
            <c:if test="${!empty categories_form.errors}">
                <ul class="errors margin">
                    <c:forEach items="${categories_form.errors}" var="error">
                        <li>${error}</li>
                        </c:forEach>
                </ul>
            </c:if>

           
        </form>
    </jsp:attribute>
</template:base>

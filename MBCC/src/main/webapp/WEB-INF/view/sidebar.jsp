<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%> 
<c:set var="ctx" value="${pageContext.request.contextPath}"/>

		<div id="layoutSidenav">
            <div id="layoutSidenav_nav">
                <nav class="sb-sidenav accordion sb-sidenav-dark" id="sidenavAccordion">
                    <div class="sb-sidenav-menu">
                        <div class="nav">
                        
                        <a class="nav-link" href="#" onclick="asyncMovePage('main.do')">
                            <div class="sb-nav-link-icon"><i class="fas fa-tachometer-alt"></i></div>
                            Main
                        </a>
                        <a class="nav-link" href="#" onclick="asyncMovePage('task.do')">
                            <div class="sb-nav-link-icon"><i class="fa-solid fa-car-side"></i></div>
                            Task
                        </a>
                        <a class="nav-link" href="#" onclick="asyncMovePage('drive.do')">
                            <div class="sb-nav-link-icon"><i class="fa-solid fa-people"></i></div>
                            Drive
                        </a>
                        <a class="nav-link" href="#" onclick="asyncMovePage('notice.do')">
                            <div class="sb-nav-link-icon"><i class="fas fa-chart-area"></i></div>
                            Notice
                        </a>
                        <a class="nav-link" href="#" onclick="asyncMovePage('Address.do')">
                            <div class="sb-nav-link-icon"><i class="fas fa-chart-area"></i></div>
                            Address
                        </a>
                        <a class="nav-link" href="#" onclick="asyncMovePage('approval.do')">
                            <div class="sb-nav-link-icon"><i class="fas fa-chart-area"></i></div>
                            Approval
                        </a>
                        <a class="nav-link" href="#" onclick="asyncMovePage('calendar.do')">
                            <div class="sb-nav-link-icon"><i class="fa-regular fa-comet"></i></div>
                            Calendar
                        </a>
                        <a class="nav-link" href="#" onclick="asyncMovePage('meeting.do')">
                            <div class="sb-nav-link-icon"><i class="fa-regular fa-comet"></i></div>
                            Meeting
                        </a>
                        
                        
                        </div>
                    </div>
                    <div class="sb-sidenav-footer">
                        MBCC project
                    </div>
                </nav>
            </div>
            <div id="layoutSidenav_content">
            
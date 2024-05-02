<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page import="com.ai.ojt12.dto.*,java.util.List"%>

<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>

<html lang="en">

<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-T3c6CoIi6uLrA9TneNEoa7RxnatzjcDSCmG1MXxSR1GAsXEV/Dwwykc2MPK8M2HN"
	crossorigin="anonymous">

<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">

<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"
	integrity="sha384-C6RzsynM9kWDrMNeT87bh95OGNyZPhcTNXj1NW7RuBCsyN/o0jlpcV8Qyq46cDfL"
	crossorigin="anonymous"></script>
<script src="https://kit.fontawesome.com/83cece50f1.js"
	crossorigin="anonymous"></script>
    <link rel="stylesheet" type="text/css" href="https://cdn.datatables.net/1.11.5/css/jquery.dataTables.css">
<script src="https://cdn.datatables.net/2.0.1/js/dataTables.js"></script>
<title>Top Menu MNU001</title>
<style>
@charset "ISO-8859-1";
.dataTables_filter {
	margin-bottom: 20px;
	margin-right:400px!important
}
img {
	width: 60px !important;
	height: 60px !important;
}

body {
	margin: 0px;
	font-family: "Roboto", sans-serif;
	font-size: 11pt;
	float: left;
	text-align: justify;
	color: black;
	background-image: linear-gradient(45deg, #dde6e5, #d6f5e3);
	margin-left: auto;
	margin-right: auto;
	width: 1366px;
	height: 100%;
	overflow: hidden;
}

#testheader {
	background: #f2f2f2;
	width: 100%;
	height: 90px;
	float: top;
	padding: 20px 20px 0px 0px;
}

#testheader a {
	/* text-decoration: none; */
	color: rgb(114, 112, 112);
	font-family: "Roboto", sans-serif;
}

#testsidebar {
	background: rgb(255, 217, 171);
	float: left;
	width: 220px;
	min-height: 1000px;
	height: auto !important;
}

#testfooter {
	background: #f2f2f2;
	height: 60px;
	text-align: center;
	bottom: 0;
	left: 0;
	right: 0;
	padding: 20px 20px 0px 0px;
	position: fixed;
	width: 100%;
	float: bottom;
}

#container {
	overflow: hidden;
	flex: 1;
}

#main_contents {
	background: #ffffff;
	overflow: hidden;
	min-height: 1000px;
	height: auto !important;
	padding-top: 15px;
}

#sub_content {
	padding: 10px;
	margin-left: auto;
	padding-left: 10px;
	overflow: auto;
	position: absolute;
	width: 100%;
	height: auto;
	top: 90px;
	bottom: 20px;
	left: 220px;
}

#contents h3 {
	color: rgb(82, 179, 69);
	padding: 20px 20px 20px 20px;
	margin-left: 250px;
	font-size: 20px;
}

#stduentTable {
	width: 80%;
}

/* Login Form css */
.login-page {
	width: 360px;
	padding: 8% 0 0;
	margin: auto;
}

.login-page p {
	color: firebrick;
	font-family: 'Lucida Sans', 'Lucida Sans Regular', 'Lucida Grande',
		'Lucida Sans Unicode', Geneva, Verdana, sans-serif;
}

.login-page .form .login {
	margin-top: -31px;
	margin-bottom: 26px;
}

.form {
	position: relative;
	z-index: 1;
	background: #FFFFFF;
	max-width: 360px;
	margin: 0 auto 100px;
	padding: 45px;
	text-align: center;
	box-shadow: 0 0 20px 0 rgba(0, 0, 0, 0.2), 0 5px 5px 0
		rgba(0, 0, 0, 0.24);
}

.form input {
	font-family: "Roboto", sans-serif;
	outline: 0;
	background: #f2f2f2;
	width: 100%;
	border: 0;
	margin: 0 0 15px;
	padding: 15px;
	box-sizing: border-box;
	font-size: 14px;
}

.form button {
	font-family: "Roboto", sans-serif;
	text-transform: uppercase;
	outline: 0;
	background-color: #328f8a;
	background-image: linear-gradient(45deg, #328f8a, #08ac4b);
	width: 100%;
	border: 0;
	padding: 15px;
	color: #FFFFFF;
	font-size: 14px;
	-webkit-transition: all 0.3 ease;
	transition: all 0.3 ease;
	cursor: pointer;
}

.form .message {
	margin: 15px 0 0;
	color: #b3b3b3;
	font-size: 12px;
}

.form .message a {
	color: #4CAF50;
	text-decoration: none;
}

.login-page-body {
	background-color: #328f8a;
	background-image: linear-gradient(45deg, #328f8a, #08ac4b);
	font-family: "Roboto", sans-serif;
	-webkit-font-smoothing: antialiased;
	-moz-osx-font-smoothing: grayscale;
	width: 100%;
	height: 100%;
	overflow: hidden;
	color: rgb(0, 0, 0);
}

/* Fixed sidenav, full height */
.sidenav {
	height: 100%;
	width: 200px;
	position: absolute;
	z-index: 0;
	left: 0;
	font-family: "Roboto", sans-serif;
	/* background-color: rgb(154, 255, 133); */
	background-image: linear-gradient(45deg, #328f8a, #08ac4b);
	overflow-x: hidden;
	padding-top: 20px;
	float: left;
}

/* Style the sidenav links and the dropdown button */
.sidenav a, .dropdown-btn {
	padding: 6px 8px 6px 16px;
	text-decoration: none;
	font-size: 16px;
	font-family: "Roboto", sans-serif;
	color: #ffffff;
	display: block;
	border: none;
	background: none;
	width: 100%;
	text-align: left;
	cursor: pointer;
	outline: none;
}

/* On mouse-over */
.sidenav a:hover, .dropdown-btn:hover {
	color: #000000;
}

/* Main content */
.main {
	margin-left: 200px; /* Same as the width of the sidenav */
	font-size: 20px; /* Increased text to enable scrolling */
	padding: 0px 10px;
}

/* Add an active class to the active dropdown button */
.active {
	background-color: rgb(145, 145, 145);
	color: white;
}

/* Dropdown container (hidden by default). Optional: add a lighter background color and some left padding to change the design of the dropdown content */
.dropdown-container {
	display: none;
	background-color: rgb(145, 145, 145);
	padding-left: 8px;
}

/* Optional: Style the caret down icon */
.fa-caret-down {
	float: right;
	padding-right: 8px;
}

/* Some media queries for responsiveness */
@media screen and (max-height: 450px) {
	.sidenav {
		padding-top: 15px;
	}
	.sidenav a {
		font-size: 18px;
	}
}
</style>
</head>

<body>
	<div id="testheader">
		<div class="container">
			<div class=row>
				<div class="col-md-5 ">
					<a href="/home"><h3>Student Registration</h3></a>
				</div>
				<div class="col-md-6">
					<p>User:${id} ${email}</p>
					<p>Current Date : ${date}</p>

				</div>
				<div class="col-md-1">
					<form action="/StudentRegistrationJPA/logout" method="get">
						<input type="submit" class="btn-basic" id="lgnout-button"
							value="Log Out">
					</form>
				</div>
			</div>
		</div>

	</div>
	<!-- <div id="testsidebar">Hello World </div> -->

	<div class="sidenav">

		<button class="dropdown-btn">
			Class Management <i class="fa fa-caret-down"></i>
		</button>

		<div class="dropdown-container">
			<a href="/StudentRegistrationJPA/coursedisplay">Course
				Registration </a> <a href="/StudentRegistrationJPA/addstudentdisplay">Student
				Registration </a> <a href="/StudentRegistrationJPA/studentdisplay">Student
				Search </a>
		</div>
		<a href="/StudentRegistrationJPA/userlist">Users Management</a>
	</div>
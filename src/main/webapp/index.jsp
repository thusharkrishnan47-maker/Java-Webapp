<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.net.InetAddress, java.util.Date" %>

<!DOCTYPE html>
<html>
<head>
    <title>Java Web App | CI-CD on Kubernetes</title>
    <style>
        body {
            margin: 0;
            font-family: "Segoe UI", Arial, sans-serif;
            background: linear-gradient(135deg, #0f2027, #203a43, #2c5364);
            color: #ffffff;
            height: 100vh;
            display: flex;
            justify-content: center;
            align-items: center;
        }

        .card {
            background: rgba(255, 255, 255, 0.12);
            padding: 40px;
            border-radius: 16px;
            width: 650px;
            box-shadow: 0 25px 50px rgba(0,0,0,0.4);
        }

        h1 {
            margin-top: 0;
            color: #00e676;
        }

        h2 {
            font-weight: normal;
            color: #e0f2f1;
        }

        .success {
            margin: 20px 0;
            padding: 12px;
            background: #00c853;
            color: #003300;
            border-radius: 8px;
            font-weight: bold;
            text-align: center;
        }

        table {
            width: 100%;
            margin-top: 25px;
            border-collapse: coll

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
            border-collapse: collapse;
        }

        td {
            padding: 10px;
            border-bottom: 1px solid rgba(255,255,255,0.2);
        }

        td:first-child {
            font-weight: bold;
            color: #80deea;
            width: 40%;
        }

        footer {
            margin-top: 25px;
            text-align: center;
            font-size: 13px;
            opacity: 0.8;
        }
    </style>
</head>

<body>
<div class="card">

    <h1>🚀 Java Web App on Kubernetes</h1>
    <h2>CI/CD Pipeline Deployment Status</h2>

    <div class="success">
        ✅ BUILD & DEPLOYMENT SUCCESSFUL
    </div>

    <table>
        <tr>
            <td>CI/CD Pipeline</td>
            <td>GitHub → Jenkins → Docker → Ansible → Kubernetes</td>
        </tr>
        <tr>
            <td>Application Status</td>
            <td>Running</td>
        </tr>
        <tr>
            <td>Deployment Time</td>
            <td><%= new Date() %></td>
        </tr>
        <tr>
            <td>Pod / Host Name</td>
            <td><%= InetAddress.getLocalHost().getHostName() %></td>
        </tr>
        <tr>
            <td>Pod IP</td>
            <td><%= request.getLocalAddr() %></td>
        </tr>
        <tr>
            <td>CI Build Number</td>
            <td>
                <%= System.getenv("BUILD_NUMBER") != null 
                        ? System.getenv("BUILD_NUMBER") 
                        : "Injected via Docker Tag" %>
            </td>
        </tr>
    </table>

    <footer>
        Powered by Jenkins • Docker • Ansible • Kubernetes
    </footer>

</div>
</body>
</html>

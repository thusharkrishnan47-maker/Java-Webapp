<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.net.InetAddress, java.util.Date" %>

<!DOCTYPE html>
<html>
<head>
    <title>CI/CD Deployment Dashboard</title>
    <style>
        body {
            margin: 0;
            font-family: "Segoe UI", Arial, sans-serif;
            background: linear-gradient(135deg, #141e30, #243b55);
            color: #ffffff;
            min-height: 100vh;
            display: flex;
            justify-content: center;
            align-items: center;
        }

        .card {
            background: rgba(255, 255, 255, 0.12);
            padding: 40px;
            border-radius: 18px;
            width: 750px;
            box-shadow: 0 30px 60px rgba(0,0,0,0.45);
        }

        h1 {
            margin-top: 0;
            color: #00e676;
        }

        h2 {
            margin-top: 5px;
            font-weight: normal;
            color: #b2ebf2;
        }

        .success {
            margin: 20px 0;
            padding: 14px;
            background: #00c853;
            color: #003300;
            border-radius: 10px;
            font-weight: bold;
            text-align: center;
            font-size: 16px;
        }

        table {
            width: 100%;
            margin-top: 25px;
            border-collapse: collapse;
            font-size: 15px;
        }

        td {
            padding: 12px;
            border-bottom: 1px solid rgba(255,255,255,0.25);
        }

        td:first-child {
            font-weight: bold;
            color: #80deea;
            width: 38%;
        }

        .badge {
            padding: 6px 12px;
            border-radius: 14px;
            font-weight: bold;
            font-size: 13px;
        }

        .green { background: #00c853; color: #003300; }
        .blue  { background: #039be5; }
        .orange{ background: #fb8c00; color: #3e2723; }

        footer {
            margin-top: 30px;
            text-align: center;
            font-size: 13px;
            opacity: 0.85;
        }
    </style>
</head>

<body>
<div class="card">

    <h1>🚀 Java Web App on Kubernetes</h1>
    <h2>Live CI/CD Deployment Dashboard</h2>

    <div class="success">
        ✅ Application Successfully Built & Deployed via CI/CD
    </div>

    <table>
        <tr>
            <td>CI/CD Pipeline</td>
            <td>GitHub → Jenkins → Maven → Docker → Ansible → Kubernetes</td>
        </tr>

        <tr>
            <td>Application Status</td>
            <td><span class="badge green">RUNNING</span></td>
        </tr>

        <tr>
            <td>CI Build Number</td>
            <td>
                <%= System.getenv("BUILD_NUMBER") != null
                        ? System.getenv("BUILD_NUMBER")
                        : "Injected via Docker Image Tag" %>
            </td>
        </tr>

        <tr>
            <td>Deployment Timestamp</td>
            <td><%= new Date() %></td>
        </tr>

        <tr>
            <td>Kubernetes Pod Name</td>
            <td><span class="badge blue"><%= InetAddress.getLocalHost().getHostName() %></span></td>
        </tr>

        <tr>
            <td>Pod IP Address</td>
            <td><%= request.getLocalAddr() %></td>
        </tr>

        <tr>
            <td>Namespace</td>
            <td>
                <%= System.getenv("POD_NAMESPACE") != null
                        ? System.getenv("POD_NAMESPACE")
                        : "default" %>
            </td>
        </tr>

        <tr>
            <td>Replica Indicator</td>
            <td>
                <span class="badge orange">
                    One of multiple replicas (Rolling Deployment)
                </span>
            </td>
        </tr>

        <tr>
            <td>Deployment Strategy</td>
            <td>Rolling Update (Zero Downtime)</td>
        </tr>

        <tr>
            <td>Health Check</td>
            <td><span class="badge green">READY</span></td>
        </tr>
    </table>

    <footer>
        Jenkins • Docker • Ansible • Kubernetes <br/>
        Enterprise CI/CD Demonstration
    </footer>

</div>
</body>
</html>

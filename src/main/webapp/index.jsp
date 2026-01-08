<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <title>Java Web App | Kubernetes</title>
    <style>
        body {
            margin: 0;
            padding: 0;
            font-family: "Segoe UI", Tahoma, Arial, sans-serif;
            background: linear-gradient(135deg, #0f2027, #203a43, #2c5364);
            height: 100vh;
            display: flex;
            align-items: center;
            justify-content: center;
            color: #ffffff;
        }

        .container {
            background: rgba(255, 255, 255, 0.1);
            padding: 40px 50px;
            border-radius: 16px;
            text-align: center;
            box-shadow: 0 20px 40px rgba(0, 0, 0, 0.4);
            max-width: 600px;
        }

        h1 {
            font-size: 28px;
            margin-bottom: 15px;
            color: #00e676;
        }

        h2 {
            font-size: 20px;
            margin-bottom: 25px;
            font-weight: normal;
            color: #e0f2f1;
        }

        .status {
            display: inline-block;
            padding: 10px 20px;
            border-radius: 30px;
            font-weight: bold;
            background: #00c853;
            color: #003300;
            letter-spacing: 1px;
        }

        footer {
            margin-top: 25px;
            font-size: 13px;
            opacity: 0.8;
        }
    </style>
</head>

<body>
    <div class="container">
        <h1>🚀 Java Web App Running on Kubernetes</h1>
        <h2>Application has been successfully built & deployed</h2>

        <div class="status">STATUS : SUCCESS ✅</div>

        <footer>
            <p>Powered by Jenkins • Docker • Ansible • Kubernetes</p>
        </footer>
    </div>
</body>
</html>

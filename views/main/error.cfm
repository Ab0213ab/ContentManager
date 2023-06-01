<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Error Page</title>
    <style>
        body {
            background-image: url('/includes/images/badData.jpg');
            background-repeat: no-repeat;
            background-size: cover;
            background-position: center center;
            font-family: Arial, sans-serif;
            display: flex;
            justify-content: center;
            align-items: center;
            flex-direction: column;
            height: 100vh;
            margin: 0;
            padding: 0;
        }

        h1, h3 {
            color: white;
            text-shadow: 2px 2px 4px black;
        }

        p {
            color: red;
        }

        a {
            color: white;
            text-decoration: none;
            background-color: rgba(0, 0, 0, 0.5);
            padding: 10px;
            border-radius: 5px;
            font-size: 18px;
        }

        a:hover {
            background-color: rgba(0, 0, 0, 0.7);
        }
    </style>
</head>
<body>
    <h1>OH NO! YOU ENTERED BAD DATA!</h1>
    <br>
    <h3>The following issues have occurred:</h3>
    <hr>

    <a href="/views/main/index.cfm">Click here to go back to the login screen, 
        or click your browser's back button to go back to the form.</a>
</body>
</html>

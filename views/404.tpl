<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN"
    "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
%root = getURL('/')
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <meta name="keywords" content="pwgen, password generátor, zapamatovatelné heslo"/>
    <link href="{{root}}look/styles.css" rel="stylesheet" type="text/css" />
    <link href="{{root}}look/favico.png" rel="shortcut icon" type="image/png" />
    <title>webPWgen</title>
</head>

<style type="text/css">
body {
    color: white;
}
h1 {
    /*color: #dd5756;*/
    background-color: #5E905D;
    padding: 1em 1em 0.5ex;
}

.right {
    float: right;
}

.chyba {
    font-size:150%;
    background-color: #5E905D;
    margin-right: 420px;
    padding: 1ex;
}

.body {
    margin: 1ex;
    padding: 1ex;
    color: black;
    background-color: white;
    font-size:150%;
}

</style>

<body>

<h1>{{status}}</h1>


<p class="body"><code>{{body}}</code></p>

<p class="right">
<img src="/look/Cartoon_monkey_wrench.png" alt="" width="400" height="328" />
</p>

<p class="chyba">
Pardon, ale tuto adresu neumím zpracovat.
</p>

</body>
</html>

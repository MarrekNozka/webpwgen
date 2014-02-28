<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN"
    "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <meta name="keywords" content="pwgen, password generátor, zapamatovatelné heslo"/>
    <link href="look/styles.css" rel="stylesheet" type="text/css" />
    <link href="look/favico.png" rel="shortcut icon" type="image/png" />
    <title>webPWgen</title>
</head>

<body>
<div id="all">
<div id="head">
    <h1 class="sideL"><a href="/.">webPWgen</a></h1>
    <p class=sideR><span class="sideR">
        <a href="/cs/">Čeština</a>
        <a href="/en/">English</a> </span>
    </p>
</div>

<div id="body">
    <h1>Zapamatovatelné heslo?</h1>
    <form method="get">
    <p> Jak dlouhé má heslo být? (číslo v rozmezí 5 až 40)<br /> 
        <input name="length" type="text" /><input value="Generuj" type="submit" />
    </p>
    </form>
    <h2 class="sideL">Vyber si a zapamatuj si</h2>
    <p class="sideR"><span class="sideR">... nebo se jen inspiruj.</span></p>
    <p>Délka hesel je {{length}}:</p>
    <p class="pswd"><kbd>
        {{passwords}}
    </kbd></p>
</div>

<div id="foot">
    <p>Powered by: 
    <a href="http://python.org">Python</a>, 
    <a href="http://bottlepy.org">Bottle</a>, 
    <a href="http://debian.org">Debian GNU/Linux</a>,
    <a href="http://sourceforge.net/projects/pwgen/">PWgen</a>.
    </p>
</div>
</div>

</body>
</html>

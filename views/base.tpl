<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN"
    "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
%root = getURL('/')
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <meta name="keywords" content="pwgen, password generátor, zapamatovatelné heslo"/>
    <link href="{{root}}look/styles.css" rel="stylesheet" type="text/css" />
    <link href="{{root}}look/favico.png" rel="shortcut icon" type="image/png" />
    <title>pwgen</title>
</head>

<body>
<div id="all">
<!-- https://github.com/blog/273-github-ribbons -->
<!-- http://cssdeck.com/labs/github-fork-me-on -->
<a href="https://github.com/tlapicka/webpwgen"><img style="position: absolute; top: 0; left: 0; border: 0;z-index:50;" src="https://github-camo.global.ssl.fastly.net/8b6b8ccc6da3aa5722903da7b58eb5ab1081adee/68747470733a2f2f73332e616d617a6f6e6177732e636f6d2f6769746875622f726962626f6e732f666f726b6d655f6c6566745f6f72616e67655f6666373630302e706e67" alt="Fork me on GitHub" data-canonical-src="https://s3.amazonaws.com/github/ribbons/forkme_left_orange_ff7600.png"></a>

<div id="head">

    <h1 class="sideL"><a href="{{root}}">web pwgen</a></h1>
    <p class=sideR><span class="sideR">
% if lang=='cs':
        Čeština
        <a href="{{root}}en/{{length}}">English</a>
% elif lang=='en':
        <a href="{{root}}cs/{{length}}">Čeština</a>
        English
% end
        </span>
    </p>
</div>

<div id="body">
% if lang=='cs':
    <h1>Zapamatovatelné heslo?</h1>
% elif lang=='en':
    <h1>Memorizing password?</h1>
% end
    <form method="get">

% if lang=='cs':
    <p>Jak dlouhé heslo chceš? (číslo v rozmezí 5 až 40)<br /> 
% elif lang=='en':
    <p>How long password do you want? (number from 5 to 40)<br /> 
% end
        <input name="length" type="number" />
% if lang=='cs':
        <input value="Generuj" type="submit" />
% else:
        <input value="Generate" type="submit" />
% end
    </p>
    </form>
% if lang=='cs':
    <h2 class="sideL">Vyber si a zapamatuj si</h2>
    <p style="text-align:right;">... nebo se jen inspiruj.</p>
    <p>Délka hesel je {{length}} znaků:</p>
% elif lang=='en':
    <h2 class="sideL">Choose and remember</h2>
    <p style="text-align:right;">... or only for inspiration.</p>
    <p>Lenght of the passwords is {{length}} characters:</p>
% end

% for password in passwords:
    <p class="pswd"><kbd>{{ !password }}</kbd></p>
%end
</div>

<div id="foot">
    <p>Powered by: 
    <a href="http://python.org">Python</a>, 
    <a href="http://bottlepy.org">Bottle</a>, 
    <a href="http://debian.org">Debian GNU/Linux</a>,
    <a href="http://sourceforge.net/projects/pwgen/">PWgen</a>,
    <a href="http://www.spseol.cz">VOŠ a SPŠE Olomouc</a>.
    </p>
</div>
</div>

</body>
</html>

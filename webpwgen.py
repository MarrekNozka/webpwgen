# -*- coding: utf8 -*-
# Soubor:  main.py
# Datum:   22.02.2014 11:20
# Autor:   Marek Nožka, marek <@t> tlapicka <d.t> cz
# Licence: GNU/GPL
# Úloha:   web interface
############################################################################


from bottle import (
    # run,
    route,
    request,
    redirect,
    response,
    template,
    # view,
    error,
    static_file,
    default_app,
    BaseTemplate,
)
import subprocess

############################################################################

app = default_app()
BaseTemplate.defaults["getURL"] = app.get_url
getURL = app.get_url


@route("/look/<filepath:path>")
def server_static(filepath):
    return static_file(filepath, root="./look")


@route("/")
@route("/<length:int>")
@route("/<length:int>/")
def choselang(length=8):
    if request.get_cookie("lang"):
        lang = request.get_cookie("lang")
    else:
        fromBrowser = request.headers.get("Accept-Language")
        if fromBrowser:
            languages = acceptLanguages(fromBrowser)
            languages.reverse()
            try:
                cs = languages.index("cs")
            except ValueError:
                cs = -1
            try:
                en = languages.index("en")
            except ValueError:
                en = -1
            lang = "cs" if cs > en else "en"
        else:
            lang = "en"
    redirect(getURL("/") + lang + "/" + str(length))


@route("/<lang:re:cs|en>")
@route("/<lang:re:cs|en>/")
def golang(lang):
    redirect(getURL("/") + lang + "/8")


@route("/<lang:re:cs|en>/<length:int>")
@route("/<lang:re:cs|en>/<length:int>/")
def pwgen(lang, length):
    response.set_cookie("lang", lang, path=getURL("/"))
    if request.query.length:
        length = request.query.length
    try:
        length = int(length)
        length = 8 if length < 5 or length > 40 else length
    except ValueError:
        length = 8
    if request.query.length:
        redirect(getURL("/") + lang + "/" + str(length))
    passwords = []
    passwords.append(
        "<nobr>"
        + "</nobr> <nobr>".join(
            subprocess.check_output(
                [
                    "pwgen",
                    "-Ccn",
                    str(length),
                ]
            )
            .decode("ascii")
            .split()
        )
        + "</nobr>"
    )
    passwords.append(
        "<nobr>"
        + "</nobr> <nobr>".join(
            subprocess.check_output(
                [
                    "pwgen",
                    "-Ccny",
                    str(length),
                ]
            )
            .decode("ascii")
            .replace("&", "&amp;")
            .replace("<", "&lt;")
            .replace(">", "&gt;")
            .replace('"', "&quot;")
            .split()
        )
        + "</nobr>"
    )
    passwords.append(
        "<nobr>"
        + "</nobr> <nobr>".join(
            subprocess.check_output(
                [
                    "pwgen",
                    "-Ccnys",
                    str(length),
                ]
            )
            .decode("ascii")
            .replace("&", "&amp;")
            .replace("<", "&lt;")
            .replace(">", "&gt;")
            .replace('"', "&quot;")
            .split()
        )
        + "</nobr>"
    )
    return template("base", passwords=passwords, length=length, lang=lang)


############################################################################


@error(404)
def notFound(error):
    return template("404", status=error.status, body=error.body)


############################################################################
# https://gist.github.com/filippo/1106488


def acceptLanguages(browser_pref_langs):
    """Parses the request and return language list.
    browser_pref_langs is the plain Accept-Language http request header
    value.
    Stolen from Products.PloneLanguageTool, under GPL (c) Plone Foundation,
    slightly modified.
    Taken from tweetengine http://github.com/Arachnid/tweetengine/
    """
    # print(browser_pref_langs)
    browser_pref_langs = browser_pref_langs.split(",")
    i = 0
    langs = []
    length = len(browser_pref_langs)
    # Parse quality strings and build a tuple like
    # ((float(quality), lang), (float(quality), lang))
    # which is sorted afterwards
    # If no quality string is given then the list order
    # is used as quality indicator
    for lang in browser_pref_langs:
        lang = lang.strip().lower().replace("_", "-")
        if lang:
            l = lang.split(";", 2)
            quality = []
            if len(l) == 2:
                try:
                    q = l[1]
                    if q.startswith("q="):
                        q = q.split("=", 2)[1]
                        quality = float(q)
                except:
                    pass
            if quality == []:
                quality = float(length - i)
            language = l[0]
            langs.append((quality, language))
            if "-" in language:
                baselanguage = language.split("-")[0]
                langs.append((quality - 0.001, baselanguage))
            i = i + 1
    # Sort and reverse it
    langs.sort()
    langs.reverse()
    # Filter quality string
    langs = list(map(lambda x: x[1], langs))
    # print(langs)
    return langs
